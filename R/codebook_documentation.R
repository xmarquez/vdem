#' V-Dem codebook
#'
#' The V-Dem codebook (version 11) as a [tibble] for easier use in R. The
#' original codebook is available at
#' [https://www.v-dem.net/en/data/data-version-11/](https://www.v-dem.net/en/data/data-version-11/)
#'
#' @section Variable Descriptions:
#'
#'   \describe{
#'
#'   \item{section}{The section number in the codebook, as an integer. For
#'   example, section 2 contains the main indexes of democracy, section 3 the
#'   mid-level indexes, etc.}
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
#'   pre-coded data. * A: Coding by Project Managers and Research Assistants.
#'   This is based on extant sources and is factual in nature. * B: Coding by
#'   Country Coordinators. This is typically a graduate student or recent
#'   graduate who is from the country. These questions are also factual in
#'   nature. * C: Coding by Country Experts. This is typically a scholar or
#'   professional with deep knowledge of a country and perhaps of a particular
#'   political institution. Generally, that person is a citizen or resident of
#'   the country being coded. Multiple experts (usually 5 or more) code each
#'   variable. * D: Indices, i.e., composite variables composed of type A, B, or
#'   C variables. This may be accomplished by adding a denominator (e.g., per
#'   capita), by creating a cumulative scale (Total number of ...), or by
#'   aggregating larger concepts (e.g., components or indices of democracy). *
#'   E: Non-V-Dem. If we import a variable from another source without doing any
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
#'   \item{additional_versions}{Indicates if the variable is also available in
#'   the following versions; _osp, _ord, _codelow, _codehigh, _sd, _mean and/or
#'   _nr. Detailed information about the different versions can be found in
#'   section 1.5 of the codebook (Variable Versions and Suffixes).}
#'
#'   \item{available_versions}{Lists the available variable types (Only
#'   applicable for ordinalized versions of indices).}
#'
#'   \item{question}{If available, the question that the variable attempts to
#'   measure.}
#'
#'   \item{clarification}{If available, the clarification in the codebook.}
#'
#'   \item{responses}{If available, the possible responses.}
#'
#'   \item{answer_type}{Multiple-choice: Where a coder can select only one
#'   answer. This is the usual protocol and is therefore not noted.
#'   Multiple-selection: Where a coder can select more than one answer. For most
#'   multiple-selection variables, the dataset contains both the original
#'   variable as well as a set of dummies for each of the responses.}
#'
#'   \item{ordering}{If available, the order in which the variable is coded
#'   (e.g., only if previous quesiton is answered).}
#'
#'   \item{aggregation}{If available, the type of aggregation for the index
#'   (e.g., Bayesian factor analysis, average of indicators). Only applicable to
#'   indices.}
#'
#'   \item{scale}{If available, the scale of the responses (e.g., nominal,
#'   categorical).}
#'
#'   \item{cross_coder}{If available, the method for aggregating multiple
#'   coders' judgments. Only applicable to C variables.}
#'
#'   \item{data_release}{If available, the versions of the V-Dem data where the
#'   variable has been included.}
#'
#'   \item{source}{If available, the source listed in the codebook. Citations
#'   for type-A* and A variables are listed, wherever possible, with complete
#'   references in the Bibliography. Note that this coding sometimes rests on
#'   numerous country-specific sources, in which case it has not been possible
#'   to include all citations. Composite indices (type-D) build on other
#'   variables in the V-Dem database, which are therefore listed as the source
#'   for that index.}
#'
#'   \item{cleaning}{Specifies if observations are set to missing based on
#'   values on other variables.}
#'
#'   \item{citation}{Suggested citation when using the specific variable.}
#'
#'   \item{years}{Available coverage for the respective variable. For more
#'   information on country-specific year coverage, see the country table in the
#'   codebook.}
#'
#'   \item{note}{If available, any notes in the codebook with additional info
#'   about the variable.}
#'
#'   }
#'
#' @references Coppedge, Michael, John Gerring, Carl Henrik Knutsen, Staffan I.
#'   Lindberg, Jan Teorell, David Altman, Michael Bernhard, Agnes Cornell, M.
#'   Steven Fish, Lisa Gastaldi, Haakon Gjerløw, Adam Glynn, Allen Hicken, Anna
#'   Lührmann, Seraphine F. Maerz, Kyle L. Marquardt, Kelly McMann, Valeriya
#'   Mechkova, Pamela Paxton, Daniel Pemstein, Johannes von Römer, Brigitte
#'   Seim, Rachel Sigman, Svend-Erik Skaaning, Jeffrey Staton, Aksel Sundtr¨om,
#'   Eitan Tzelgov,Luca Uberti, Yi-ting Wang, Tore Wig, and Daniel Ziblatt.
#'   2021. "V-Dem Codebook v11" Varieties of Democracy (V-Dem) Project. Available at
#' [https://www.v-dem.net/en/data/data-version-11/](https://www.v-dem.net/en/data/data-version-11/)
#'
"vdem_codebook"

#' V-Dem dataset (version 11)
#'
#' The V-Dem dataset (version 11), including external variables. This
#' documentation only provides variable names and labels for the country-year
#' identifiers included. The rest of the codebook is available at
#' [https://www.v-dem.net/en/data/data-version-11/](https://www.v-dem.net/en/data/data-version-11/),
#' and in this package as [vdem_codebook].
#'
#' @section Identifiers:
#'
#'   \describe{
#'
#'   \item{vdem_country_name}{The original country name in the dataset. There
#'   are 202 distinct countries in version 11. According to the codebook, "a
#'   V-Dem country is a political unit enjoying at least some degree of
#'   functional and/or formal sovereignty."}
#'
#'   \item{vdem_country_id}{Unique numerical country id for each country.}
#'
#'   \item{vdem_country_text_id}{Unique abbreviation for each country.}
#'
#'   \item{year}{Year, from 1789-2020.}
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
#'   in a few instances, and it does not exist in for some historical polities.
#'   For details, see Gleditsch and Ward 1999. The list can be found at
#'   \url{http://privatewww.essex.ac.uk/~ksg/statelist.html}. Column added by
#'   Xavier Marquez to the original V-Dem dataset.}
#'
#'   \item{historical_date}{"This variable is included in the V-Dem Country Date
#'   dataset. The default date is December 31st, as in 2020-12-31, referring to
#'   the time span from 01-01 to 12-31 in a respective year. Additionally,
#'   specific changes, such as the appointment of a Head of State, are coded on
#'   the specific date within a certain year. Thus, a code can change within a
#'   year, and will be reflected in the 12-31 date."}
#'
#'   \item{codingstart}{"V-Dem country coding starts in 1789, or from when a
#'   country first enjoyed at least some degree of functional and/or formal
#'   sovereignty. For detailed information, please see the V-Dem Country Coding
#'   Units document."}
#'
#'   \item{codingstart_contemp}{This variable indicates the coding start for the
#'   countries coded by Contemporary V-Dem.}
#'
#'   \item{codingstart_hist}{This variable indicates the coding start for the
#'   countries coded by Historical V-Dem.}
#'
#'   \item{gapstart}{"Time periods when a country does not fulfill V-Dem’s
#'   coding period criteria are not coded. The date that indicates the gap start
#'   is the last date coded before the gap. For more details about V-Dem country
#'   coding periods, please see the V-Dem Country Coding Units document."}
#'
#'   \item{gapend}{"The periods of when a country does not fulfill V-Dem’s
#'   coding period macriteria are not coded. The date that indicates the gap end
#'   is the first date coded after the gap. For more details about V-Dem country
#'   coding periods, please see the V-Dem Country Coding Units document."}
#'
#'   \item{codingend}{"V-Dem country coding ends in 2018, or from when a country
#'   formally stopped enjoying at least some degree of functional and/or formal
#'   sovereignty. For detailed information, please see the V-Dem Country Coding
#'   Units document."}
#'
#'   \item{codingend_contemp}{"This variable indicates when the coding ends for
#'   countries coded by the Contemporary V-Dem project."}
#'
#'   \item{codingend_hist}{"This variable indicates when the coding ends for
#'   countries coded by the Historical V-Dem Project."}
#'
#'   \item{project}{"This variable indicates which V-Dem project coded that
#'   country-year: Contemporary V-Dem (0), Historical V-Dem (1), or both (2)."}
#'
#'   \item{historical}{"This variable indicates if the Historical V-Dem project
#'   coded a country at any time: No (0), Yes (1)."}
#'
#'   \item{vdem_cown}{The Correlates of War numeric country code (2016). Note
#'   that this differs from Gleditsch and Ward's numeric country code in a few
#'   cases.}
#'
#'   \item{cown}{The Correlates of War numeric country code (from the 2016
#'   version of the COW state list). Note that this differs from Gleditsch and
#'   Ward's numeric country code in a few cases. Column added by Xavier Marquez
#'   to the original V-Dem dataset.}
#'
#'   \item{GWc}{Gleditsch and Ward's alphabetic country code, from the Gleditsch
#'   and Ward list of independent states. Missing for some historical polities
#'   and some states with contested sovereignty. For details, see Gleditsch and
#'   Ward 1999. The list can be found at
#'   \url{http://privatewww.essex.ac.uk/~ksg/statelist.html}. Column added by
#'   Xavier Marquez to the original V-Dem dataset.}
#'
#'   \item{extended_region}{Region. Column added by Xavier Marquez to the
#'   original V-Dem dataset. You may wish to use the `e_region*` set of
#'   variables instead.}
#'
#'   \item{extended_continent}{Continent. Column added by Xavier Marquez to the
#'   original V-Dem dataset.}
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
#'   dataset. You may instead wish to use one of the `v2sv*`` columns provided
#'   in the original V-Dem dataset.}
#'
#'   }
#'
#' @source Coppedge, Michael, John Gerring, Carl Henrik Knutsen, Staffan I.
#'   Lindberg, Jan Teorell, David Altman, Michael Bernhard, Agnes Cornell, M.
#'   Steven Fish, Lisa Gastaldi, Haakon Gjerløw, Adam Glynn, Allen Hicken, Anna
#'   Lührmann, Seraphine F. Maerz, Kyle L. Marquardt, Kelly McMann, Valeriya
#'   Mechkova, Pamela Paxton, Daniel Pemstein, Johannes von Römer, Brigitte
#'   Seim, Rachel Sigman, Svend-Erik Skaaning, Jeffrey Staton, Aksel Sundtr¨om,
#'   Eitan Tzelgov,Luca Uberti, Yi-ting Wang, Tore Wig, and Daniel Ziblatt.
#'   2021. "V-Dem Codebook v11" Varieties of Democracy (V-Dem) Project.
#'   Available at
#'   [https://www.v-dem.net/en/data/data-version-11/](https://www.v-dem.net/en/data/data-version-11/)
#'
#'
#'
#'
#' @references Coppedge, Michael, John Gerring, Carl Henrik Knutsen, Staffan I. Lindberg,
#' Jan Teorell, Nazifa Alizada, David Altman, Michael Bernhard, Agnes Cornell,
#' M. Steven Fish, Lisa Gastaldi, Haakon Gjerløw, Adam Glynn, Allen Hicken,
#' Garry Hindle, Nina Ilchenko, Joshua Krusell, Anna Luhrmann, Seraphine F.
#' Maerz, Kyle L. Marquardt, Kelly McMann, Valeriya Mechkova, Juraj Medzihorsky,
#' Pamela Paxton, Daniel Pemstein, Joseﬁne Pernes, Johannes von Römer, Brigitte
#' Seim, Rachel Sigman, Svend-Erik Skaaning, Jeffrey Staton, Aksel Sundström,
#' Ei-tan Tzelgov, Yi-ting Wang, Tore Wig, Steven Wilson and Daniel Ziblatt.
#' 2021. "V-Dem Country-Year Dataset v11" Varieties of Democracy
#' Project. https://doi.org/10.23696/vdems21
#'
#' Pemstein, Daniel, Kyle L. Marquardt, Eitan Tzelgov, Yi-ting Wang, Juraj
#' Medzihorsky, Joshua Krusell, Farhad Miri, and Johannes von Römer. 2020 "The
#' V-Dem Measurement Model: Latent Variable Analysis for Cross-National and
#' Cross-Temporal Expert-Coded Data". V-Dem Working Paper No. 21. 5th edition.
#' University of Gothenburg: Varieties of Democracy Institute.
#'
#' Gleditsch, Kristian S. & Michael D. Ward. 1999. "Interstate System
#' Membership: A Revised List of the Independent States since 1816."
#' International Interactions 25: 393-413. The list can be found at
#' [http://privatewww.essex.ac.uk/~ksg/statelist.html](http://privatewww.essex.ac.uk/~ksg/statelist.html)
"VDem_plus"


