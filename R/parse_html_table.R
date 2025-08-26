#' Parse HTML tables
#'
#' @description
#'
#' `parse_html_table()` parses a HTML table to a [`tibble`][tibble::tibble()].
#'
#' @param x (optional) A [`character`][base::character] vector with HTML code.
#'
#' @return A [`tibble`][tibble::tibble()] with the parsed HTML table.
#'
#' @family parse functions
#' @export
#'
#' @examples
#' x <- c(
#'   "<table>",
#'   "  <tr>",
#'   "    <th>Name</th>",
#'   "    <th>Age</th>",
#'   "  </tr>",
#'   "  <tr>",
#'   "    <td>Alice</td>",
#'   "    <td>30</td>",
#'   "  </tr>",
#'   "  <tr>",
#'   "    <td>Bob</td>",
#'   "    <td>25</td>",
#'   "  </tr>",
#'   "</table>"
#' )
#'
#' x |> parse_html_table()
parse_html_table <- function(x = clipr::read_clip()) {
  checkmate::assert_character(x)

  x |>
    paste0(collapse = " ") |>
    rvest::read_html() |>
    rvest::html_element("table") |>
    rvest::html_table()
}
