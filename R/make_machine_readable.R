#' Make a string machine-readable
#'
#' @description
#'
#' `r lifecycle::badge("stable")`
#'
#' `make_machine_readable()` makes a string machine-readable by converting it
#' to lowercase, removing special characters, and replacing spaces with hyphens.
#'
#' This function follows the naming conventions from the
#' [Tidyverse Style Guide](https://style.tidyverse.org/files.html#names).
#'
#' @param x A [`character`][base::character] vector.
#'
#' @return A [`character`][base::character] vector with machine-readable names.
#'
#' @family string functions
#' @export
#'
#' @examples
#' make_machine_readable("Test - Test ")
#' #> [1] "test-test" # Expected
#'
#' make_machine_readable("!@#TéSt$$%^")
#' #> [1] "test" # Expected
#'
#' make_machine_readable("TeSt_test.txt")
#' #> [1] "test-test.txt" # Expected
make_machine_readable <- function(x) {
  checkmate::assert_character(x)

  x |>
    stringr::str_to_lower() |>
    stringr::str_squish() |>
    stringr::str_replace_all(" - |_| ", "-") |>
    iconv(to = "ASCII//TRANSLIT") |>
    stringr::str_replace_all("[^A-Za-z0-9-_.]", "")
}
