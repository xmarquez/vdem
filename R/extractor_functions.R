#' Extracts parts of the V-Dem dataset by section number, name pattern, or label
#' pattern
#'
#' Extracts variables in the V-Dem dataset (version 7.1), according to the
#' section number in the codebook or a regular expression pattern matching the
#' name or the label.
#'
#' @param section_number A section number (or vector of section numbers) in the
#'   V-dem codebook. Must be an integer or an integer vector (e.g., `1:2`, or
#'   `28`).
#' @param name_pattern A character pattern, interpreted as a regular expression,
#'   to search over the V-dem variable names, e.g., "v2x" extracts all variables
#'   including the string "v2x" in their names.
#' @param label_pattern A character pattern, interpreted as a regular
#'   expression, to search over the V-dem labels, e.g., "corrupt" extracts
#'   all variables that mention "corrupt" in their label.
#' @param include_uncertainty Whether to return the uncertainty measurements for
#'   the selected variables (`codelow` and `codehigh` suffixes). Default is
#'   `TRUE`.
#' @param include_sd Whether to return the standard deviation for the selected
#'   variables (`sd` suffix). Default is `FALSE`.
#' @param include_osp Whether to return variables available in the original
#'   scale (`osp` suffix, linearized original scale posterior prediction).
#'   Default is `FALSE`.
#' @param include_ord Whether to return variables available in an ordinal scale
#'   (`ord` suffix, measurement model estimates of original scale value).
#'   Default is `FALSE`.
#' @param include_nr Whether to return the number of coders for the variable
#'   (`nr` suffix). Default is `FALSE`.
#' @param include_external Whether to return variables marked "external", i.e.,
#'   coming from an external source rather than V-Dem (`e_` prefix). Default is
#'   `FALSE`.
#'
#' @return A [tibble] with the V-Dem country identifiers, other state system
#'   identifiers, plus the desired variables.
#' @import stringr
#' @import dplyr
#' @export
#'
#' @examples
#' # Main democracy indexes
#' extract_vdem(section_number = 1)
#' # Mid-level indexes, no measures of uncertainty
#' extract_vdem(section_number = 2, include_uncertainty = FALSE)
#' # All indexes about corruption
#' extract_vdem(label_pattern = "corrupt")
#' # All indexes about elections, include external indexes
#' extract_vdem(label_pattern = "elect", include_external = TRUE)
#' # All civil liberties indexes, include original scale prediction
#' extract_vdem(name_pattern = "^v2cl", include_osp = TRUE)
#' # Combine section and label patterns
#' extract_vdem(section_number = 1, label_pattern = "elect", include_external = TRUE)
extract_vdem <- function(section_number = NULL,
                         name_pattern = NULL,
                         label_pattern = NULL,
                         include_uncertainty = TRUE,
                         include_sd = FALSE,
                         include_osp = FALSE,
                         include_ord = FALSE,
                         include_nr = FALSE,
                         include_external = FALSE) {

  vars_section <- vars_name <- vars_label <- NULL
  identifiers <- c("vdem_country_name", "vdem_country_id",
                   "vdem_country_text_id", "year",
                   "extended_country_name",
                   "GWn", "historical_date",
                   "codingstart", "gapstart",
                   "gapend", "codingend",
                   "vdem_cown", "cown")

  additional_vars <- c("GW_startdate",
                       "GW_enddate", "GWc",
                       "extended_region",
                       "extended_continent",
                       "microstate",
                       "lat" , "lon",
                       "in_GW_system")



  if(!is.null(section_number)) {
    stopifnot(is.numeric(section_number))

    vars_section <- extract_by_section(section_number,
                       include_uncertainty,
                       include_sd,
                       include_osp,
                       include_ord,
                       include_nr,
                       include_external)

  }

  if(!is.null(name_pattern)) {
    stopifnot(is.character(name_pattern))
    vars_name <- extract_by_name(name_pattern,
                       include_uncertainty,
                       include_sd,
                       include_osp,
                       include_ord,
                       include_nr,
                       include_external)
  }

  if(!is.null(label_pattern)) {
    stopifnot(is.character(label_pattern))
    vars_label <- extract_by_label(label_pattern,
                    include_uncertainty,
                    include_sd,
                    include_osp,
                    include_ord,
                    include_nr,
                    include_external)
  }

  vars <- unique(c(vars_section, vars_name, vars_label))

  vdem::VDem_plus %>%
    select(identifiers, vars, additional_vars)

}

#' Extracts parts of the V-Dem dataset by passing a filter expression to
#' [vdem_codebook]
#'
#' Extracts variables in the V-Dem dataset (version 7.1), by using a filter
#' expression that is used to extract variable names from the V-Dem coddebook
#' ([vdem_codebook])
#'
#' @param ... A sequence of filter expressions, separated by commas, suitable
#'   for use with [dplyr::filter], operating on the column names of
#'   [vdem_codebook]. See examples.
#' @param include_uncertainty Whether to return the uncertainty measurements for
#'   the selected variables (`codelow` and `codehigh` suffixes). Default is
#'   `TRUE`.
#' @param include_sd Whether to return the standard deviation for the selected
#'   variables (`sd` suffix). Default is `FALSE`.
#' @param include_osp Whether to return variables available in the original
#'   scale (`osp` suffix, linearized original scale posterior prediction).
#'   Default is `FALSE`.
#' @param include_ord Whether to return variables available in an ordinal scale
#'   (`ord` suffix, measurement model estimates of original scale value).
#'   Default is `FALSE`.
#' @param include_nr Whether to return the number of coders for the variable
#'   (`nr` suffix). Default is `FALSE`.
#' @param include_external Whether to return variables marked "external", i.e.,
#'   coming from an external source rather than V-Dem (`e_` prefix). Default is
#'   `FALSE`.
#'
#' @return A [tibble] with the V-Dem country identifiers, other state system
#'   identifiers, plus the desired variables.
#' @import stringr
#' @import dplyr
#' @importFrom rlang UQS
#' @export
#'
#' @examples
#' # All in section 1 of the codebook except component indexes
#' extract_vdem_filter(section == 1, !grepl("component index", label))
#' # All variables inclued in release 2 of the dataset
#' extract_vdem_filter(grepl("2(,|$)", data_release))
extract_vdem_filter <- function(...,
                         include_uncertainty = TRUE,
                         include_sd = FALSE,
                         include_osp = FALSE,
                         include_ord = FALSE,
                         include_nr = FALSE,
                         include_external = FALSE) {

  identifiers <- c("vdem_country_name", "vdem_country_id",
                   "vdem_country_text_id", "year",
                   "extended_country_name",
                   "GWn", "historical_date",
                   "codingstart", "gapstart",
                   "gapend", "codingend",
                   "vdem_cown", "cown")

  additional_vars <- c("GW_startdate",
                       "GW_enddate", "GWc",
                       "extended_region",
                       "extended_continent",
                       "microstate",
                       "lat" , "lon",
                       "in_GW_system")


  filters <- quos(...)

  vars <- vdem::vdem_codebook %>%
    filter(UQS(filters)) %>%
    pull("name")

  vars <- collect_vars(vars,
                       include_uncertainty,
                       include_sd,
                       include_osp,
                       include_ord,
                       include_nr,
                       include_external)

  vdem::VDem_plus %>%
    select(identifiers, vars, additional_vars)


}


extract_by_section <- function(section_number,
                               include_uncertainty,
                               include_sd,
                               include_osp,
                               include_ord,
                               include_nr,
                               include_external) {

  section <- NULL

  vars <- vdem::vdem_codebook %>%
    filter(section %in% section_number) %>%
    pull("name")


  collect_vars(vars,
               include_uncertainty,
               include_sd,
               include_osp,
               include_ord,
               include_nr,
               include_external)

}

extract_by_name <- function(name_pattern,
                            include_uncertainty,
                            include_sd,
                            include_osp,
                            include_ord,
                            include_nr,
                            include_external) {

  name <- NULL

  vars <- vdem::vdem_codebook %>%
    filter(stringr::str_detect(name, name_pattern)) %>%
    pull("name")


  collect_vars(vars,
               include_uncertainty,
               include_sd,
               include_osp,
               include_ord,
               include_nr,
               include_external)

}

extract_by_label <- function(label_pattern,
                            include_uncertainty,
                            include_sd,
                            include_osp,
                            include_ord,
                            include_nr,
                            include_external) {

  label <- NULL

  vars <- vdem::vdem_codebook %>%
    filter(stringr::str_detect(label, label_pattern)) %>%
    pull("name")


  collect_vars(vars,
               include_uncertainty,
               include_sd,
               include_osp,
               include_ord,
               include_nr,
               include_external)

}

collect_vars <- function(vars,
                         include_uncertainty,
                         include_sd,
                         include_osp,
                         include_ord,
                         include_nr,
                         include_external) {
  special_vars <- names(vdem::VDem_plus)[grepl("_[0-9]+(_|_nr|_osp|_code|_mean|\\b)",names(vdem::VDem_plus))]

  special_vars_prefix <- stringr::str_replace_all(special_vars,
                                                  "_[0-9]+(_nr|_osp.*|_code.*|_ord.*|_mean|_sd|\\b)",
                                                  "")

  if(any(vars %in% special_vars_prefix)) {
    special_vars_to_select <- special_vars[special_vars_prefix %in% vars]
    vars <- vars[!vars %in% special_vars_prefix]
    vars <- c(vars, special_vars_to_select)
  }

  if(include_osp) {
    vars <- c(vars,
              paste0(vars, "_osp"))
  } else {
    vars <- vars[ !grepl("_osp", vars) ]
  }

  if(include_ord) {
    vars <- c(vars,
              paste0(vars, "_ord"))
  } else {
    vars <- vars[ !grepl("_ord", vars) ]
  }

  if(include_uncertainty) {
    vars <- c(vars,
              paste0(vars, "_codelow"),
              paste0(vars, "_codehigh"))
  } else {
    vars <- vars[ !grepl("_code(high|low)", vars) ]
  }

  if(include_sd) {
    vars <- c(vars,
              paste0(vars, "_sd"))
  } else {
    vars <- vars[ !grepl("_sd", vars) ]
  }

  if(include_nr) {
    vars <- c(vars,
              paste0(vars, "_nr"))
  } else {
    vars <- vars[ !grepl("_nr", vars) ]
  }

  if(!include_external) {
    vars <- vars[ !grepl("^e_", vars) ]
  }

  vars <- vars[ vars %in% names(vdem::VDem_plus) ]

  vars
}
