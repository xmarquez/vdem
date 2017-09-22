#' V-Dem codebook
#'
#' The V-Dem codebook (version 7.1) as a [tibble] for easier use in R. The original codebook is available
#' at [https://www.v-dem.net/en/data/data-version-7-1/](https://www.v-dem.net/en/data/data-version-7-1/)
#'
#' @section Variable Descriptions:
#'
#'   \describe{
#'
#'   \item{section}{The section number in the codebook, as an integer. For
#'   example, section 1 contains the main indexes of democracy, section 2 the
#'   mid-level indexes, etc. Note section 28 is dubplicated in the codebook.}
#'
#'   \item{name}{The name of the variable. Does not include suffixes (e.g.,
#'   `_codehigh`, `_osp`)}
#'
#'   \item{label}{The label extracted from the codebook.}
#'
#'   \item{type}{The type of variable. These are, according to the codebook:
#'
#'   * A*: Coding by Research Assistants. This is based on extant sources and is
#'   factual in nature. Country Experts indicate their confidence for this
#'   pre-coded data.
#'   * A: Coding by Project Managers and Research Assistants.
#'   This is based on extant sources and is factual in nature.
#'   * B: Coding by
#'   Country Coordinators. This is typically a graduate student or recent
#'   graduate who is from the country. These questions are also factual in
#'   nature.
#'   * C: Coding by Country Experts. This is typically a scholar or
#'   professional with deep knowledge of a country and perhaps of a particular
#'   political institution. Generally, that person is a citizen or resident of
#'   the country being coded. Multiple experts (usually 5 or more) code each
#'   variable.
#'   * D: Indices, i.e., composite variables composed of type A, B, or
#'   C variables. This may be accomplished by adding a denominator (e.g., per
#'   capita), by creating a cumulative scale (Total number of ...), or by
#'   aggregating larger concepts (e.g., components or indices of democracy).
#'   * E: Non-V-Dem. If we import a variable from another source without doing any
#'   original coding, except for perhaps imputing missing data, it is not
#'   considered a V-Dem product. Many of these variables are found in the
#'   section of the Codebook labeled "Background Factors.: If, however, we
#'   gather data from a number of sources and combine them in a more than purely
#'   mechanical fashion (requiring some judgment on our part), we regard this as
#'   a V-Dem product and classify it as type A, B, C, or D. All "E" variables
#'   are included in the codebook except those drawn from sources that have more
#'   than 30 variables such as Archigos (Goemans et al.), BDM (Bueno de Mesquita
#'   et al.), Henisz/POLCON (2000, 2002), Miller (Democratic Pieces),
#'   Performance of Nations (Kugler and Tammen), PEI (Norris et al.), PIPE
#'   (Przeworski et al.), QoG (Quality of Government). For these variables, we
#'   ask users to consult separate codebooks, as listed above.}
#'
#'   \item{project_manager}{The project manager listed in the codebook.}
#'
#'   \item{compiler}{The compiler listed in the codebook.}
#'
#'   \item{question}{If available, the question answered by the coders.}
#'
#'   \item{clarification}{If available, the clarification in the codebook.}
#'
#'   \item{responses}{If available, the possible responses.}
#'
#'   \item{scale}{If available, the scale of the responses (e.g., nominal,
#'   categorical).}
#'
#'   \item{aggregation}{If available, the type of aggregation for the index
#'   (e.g., Bayesian factor analysis, average of indicators).}
#'
#'   \item{note}{If available, any notes in the codebook.}
#'
#'   \item{ordering}{If available, the order in which the variable is coded
#'   (e.g., only if previous quesiton is answered).}
#'
#'   \item{cross_coder}{If available, the method for aggregating multiple
#'   coders' judgments.}
#'
#'   \item{source}{If available, the source listed in the codebook.}
#'
#'   \item{data_release}{If available, the version of the V-Dem data where the
#'   variable was included.}
#'
#'   \item{data_release}{If available, the suggested citation listed in the
#'   codebook.}
#'
#'   }
#'
#' @references
#' Coppedge, Michael, John Gerring, Staffan I. Lindberg, Svend-Erik
#' Skaaning, Jan Teorell, David Altman, Frida Andersson, Michael Bernhard, M.
#' Steven Fish, Adam Glynn, Allen Hicken, Carl Henrik Knutsen, Kyle L.
#' Marquardt, Kelly McMann, Valeriya Mechkova, Pamela Paxton, Daniel Pemstein,
#' Laura Saxer, Brigitte Seim, Rachel Sigman and Jeffrey Staton. 2017. "V-Dem
#' Codebook v7.1" Varieties of Democracy (V-Dem) Project. Available at
#' [https://www.v-dem.net/en/data/data-version-7-1/](https://www.v-dem.net/en/data/data-version-7-1/)
"vdem_codebook"

#' V-Dem dataset (version 7.1)
#'
#' The V-Dem dataset (version 7.1), including external variables. This
#' documentation only provides variable names and labels for the country-year
#' identifiers included. The rest of the codebook is available at
#' [https://www.v-dem.net/en/data/data-version-7-1/](https://www.v-dem.net/en/data/data-version-7-1/),
#' and in this package as [vdem_codebook].
#'
#' @section Identifiers:
#'
#'   \describe{
#'
#'   \item{vdem_country_name}{The original country name in the dataset. There
#'   are 178 distinct countries in version 7.1. According to the codebook, "a
#'   V-Dem country is a political unit enjoying at least some degree of
#'   functional and/or formal sovereignty."}
#'
#'   \item{vdem_country_id}{Unique numerical country id for each country.}
#'
#'   \item{vdem_country_text_id}{Unique abbreviation for each country.}
#'
#'   \item{year}{Year, from 1900-2016.}
#'
#'   \item{extended_country_name}{The standard country according to the
#'   [Gleditsch and Ward system of
#'   states](http://privatewww.essex.ac.uk/~ksg/statelist.html) (Gleditsch and
#'   Ward 1999), or a standardized country name. Note that West Bank, and Gaza
#'   are two separate coding units in `vdem_country_name` but all map to
#'   "Palestine, State of" here. Column added by Xavier Marquez to the original
#'   V-Dem dataset.}
#'
#'   \item{GWn}{Gleditsch and Ward's numeric country code, from the Gleditsch
#'   and Ward list of independent states. This differs from the V-Dem COW code
#'   in a few instances. For details, see Gleditsch and Ward 1999. The list can
#'   be found at \url{http://privatewww.essex.ac.uk/~ksg/statelist.html}. Column
#'   added by Xavier Marquez to the original V-Dem dataset.}
#'
#'   \item{historical_date}{According to the codebook, "This variable is
#'   included in the V-Dem Country Date dataset. The default date is 31st
#'   December, as in 2016-12-31, referring to the time span from 01-01 to 12-31
#'   in a respective year. Additionally, specific changes, such as the
#'   appointment of a Head of State, are coded on the specific date within a
#'   certain year. Thus, a code can change within a year, and will be reflected
#'   in the 12-31 date."}
#'
#'   \item{codingstart}{"V-Dem country coding starts in 1900, or from when a
#'   country first was formally sovereign (according to international law). For
#'   detailed information, please see to VDem Country Coding Units."}
#'
#'   \item{gapstart}{"Time periods when a country does not fulfill V-Dem's
#'   coding period criteria are not coded. The date that indicates the gap start
#'   is the last date coded before the gap. For more details about V-Dem country
#'   coding periods, please see to V-Dem Country Coding Units."}
#'
#'   \item{gapend}{"The periods of when a country does not fulfill V-Dem's
#'   coding period criteria are not coded. The date that indicates the gap end
#'   is the first date coded after the gap. For more details about V-Dem country
#'   coding periods, please see to V-Dem Country Coding Units."}
#'
#'   \item{codingend}{"V-Dem country coding ends in 2016, or from when a country
#'   formally stopped being sovereign (according to international law). For
#'   detailed information , please see VDem Country Coding Units."}
#'
#'   \item{vdem_cown}{The Correlates of War numeric country code. Note that this
#'   differs from Gleditsch and Ward's numeric country code in a few cases.}
#'
#'   \item{cown}{The Correlates of War numeric country code (from the 2016
#'   version of the COW state list). Note that this differs from Gleditsch and
#'   Ward's numeric country code in a few cases; it also differs from
#'   `vdem_cown` in a couple of cases: Germany 1949-1989, where `vdem_cown`
#'   incorrectly has 255 (it should be 260), Czech Republic 1918-1992 (coded as
#'   Czechoslovakia, 315 in `cown`, 316 in `vdem_cown`), South Korea 1900-1908
#'   (coded as Korea, 730, where `vdem_cown` has 732), and Yemen 1918-1989
#'   (coded as 678, where `vdem_cown` has 679). Column added by Xavier Marquez
#'   to the original V-Dem dataset.}
#'
#'   \item{GWc}{Gleditsch and Ward's alphabetic country code, from the Gleditsch
#'   and Ward list of independent states. For details, see Gleditsch and Ward
#'   1999. The list can be found at
#'   \url{http://privatewww.essex.ac.uk/~ksg/statelist.html}. Column added by
#'   Xavier Marquez to the original V-Dem dataset.}
#'
#'   \item{extended_region}{Region. Column added by Xavier Marquez to the original V-Dem
#'   dataset.}
#'
#'   \item{extended_continent}{Continent. Column added by Xavier Marquez to the original
#'   V-Dem dataset.}
#'
#'   \item{GW_startdate}{The entry date of the state into the international
#'   system (usually the date of independence, though there can be more than
#'   one), according to Gleditsch and Ward, or 1 January 1816, whichever is
#'   later. Column added by Xavier Marquez to the original V-Dem dataset.}
#'
#'   \item{GW_enddate}{The exit date of the state from the international system
#'   (usually the date the state lost its independence, though there can be more
#'   than one), according to Gleditsch and Ward, or NA if the country is still
#'   in the international system as of the time the dataset was compiled. Column
#'   added by Xavier Marquez to the original V-Dem dataset.}
#'
#'   \item{microstate}{Whether the state is a microstate, according to
#'   Gleditsch. His tentative list of microstates is available at
#'   \url{http://privatewww.essex.ac.uk/~ksg/statelist.html}. Column added by
#'   Xavier Marquez to the original V-Dem dataset.}
#'
#'   \item{lat}{The rough latitude of the state. Column added by Xavier Marquez
#'   to the original V-Dem dataset.}
#'
#'   \item{lon}{The rough longitude of the state. Column added by Xavier Marquez
#'   to the original V-Dem dataset.}
#'
#'   \item{in_GW_system}{Whether the state is "in system" (that is, is
#'   independent and sovereign), according to Gleditsch and Ward, for this
#'   particular date. Column added by Xavier Marquez to the original V-Dem
#'   dataset. You may instead wish to use one of the v2sv* columns provided in
#'   the original V-Dem dataset.}
#'
#'   }
#'
#' @source Coppedge, Michael, John Gerring, Staffan I. Lindberg, Svend-Erik
#'   Skaaning, Jan Teorell, David Altman, Michael Bernhard, M. Steven Fish, Adam
#'   Glynn, Allen Hicken, Carl Henrik Knutsen, Joshua Krusell, Anna Luhrmann,
#'   Kyle L. Marquardt, Kelly McMann, Valeriya Mechkova, Moa Olin, Pamela
#'   Paxton, Daniel Pemstein, Josefine Pernes, Constanza Sanhueza Petrarca,
#'   Johannes von Romer, Laura Saxer, Brigitte Seim, Rachel Sigman, Jeffrey
#'   Staton, Natalia Stepanova, and Steven Wilson. 2017. "V-Dem
#'   [Country-Year/Country-Date](https://www.v-dem.net/en/data/data-version-7-1/)
#'    Dataset v7.1" Varieties of Democracy (V-Dem) Project.  Available at
#'   [https://www.v-dem.net/en/data/data-version-7-1/](https://www.v-dem.net/en/data/data-version-7-1/)
#'
#'
#'
#' @references
#'
#' Coppedge, Michael, John Gerring, Staffan I. Lindberg, Svend-Erik Skaaning,
#' Jan Teorell, David Altman, Frida Andersson, Michael Bernhard, M. Steven Fish,
#' Adam Glynn, Allen Hicken, Carl Henrik Knutsen, Kyle L. Marquardt, Kelly
#' McMann, Valeriya Mechkova, Pamela Paxton, Daniel Pemstein, Laura Saxer,
#' Brigitte Seim, Rachel Sigman and Jeffrey Staton. 2017. "V-Dem Codebook v7.1"
#' Varieties of Democracy (V-Dem) Project. Available at
#' [https://www.v-dem.net/en/data/data-version-7-1/](https://www.v-dem.net/en/data/data-version-7-1/)
#'
#' Gleditsch, Kristian S. & Michael D. Ward. 1999. "Interstate System
#' Membership: A Revised List of the Independent States since 1816."
#' International Interactions 25: 393-413. The list can be found at
#' [http://privatewww.essex.ac.uk/~ksg/statelist.html](http://privatewww.essex.ac.uk/~ksg/statelist.html)
"VDem_plus"


