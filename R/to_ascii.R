#' Convert a string to ASCII
#'
#' @description
#'
#' `to_ascii()` converts a string to ASCII, removing any non-ASCII characters.
#'
#' @param x A [`character`][base::character] vector.
#' @param from A [`character`][base::character] string indicating the encoding
#'   of the input string, See [`iconv`][base::iconv] to learn more.
#'   (default: `"UTF-8"`).
#'
#' @return A [`character`][base::character] vector.
#'
#' @family string functions
#' @export
#'
#' @examples
#' to_ascii("São Paulo")
#' #> [1] "Sao Paulo" # Expected
#'
#' to_ascii("Île-de-France")
#' #> [1] "Ile-de-France" # Expected
to_ascii <- function(x, from = "UTF-8") {
  checkmate::assert_character(x)
  checkmate::assert_string(from)

  x |> iconv(to = "ASCII//TRANSLIT")
}
