#' Identify blank lines around a line
#'
#' @description
#'
#' `r lifecycle::badge("maturing")`
#'
#' `blank_line_neighbors()` identify and returns the indexes of blank lines
#' around a specific line matching a pattern.
#'
#' @param x A [`character`][base::as.character()] vector.
#' @param pattern A string indicating the pattern to look for. If there's more
#'   than one match, the first one will be used (default: `NULL`).
#' @param index An integer number indicating the line to look for (default:
#'   `NULL`). If this parameter is provided, the `pattern` parameter will be
#'   ignored.
#' @param top A [`logical`][base::as.logical()] flag indicating if the function
#'   should look for blank lines at the top of the line (default: `TRUE`).
#' @param bottom A [`logical`][base::as.logical()] flag indicating if the
#'   function should look for blank lines at the bottom of the line (default:
#'   `TRUE`).
#'
#' @return An [`integer`][as.integer()] vector with the indexes of the blank
#'   lines.
#'
#' @family file functions
#' @export
#'
#' @examples
#' file <- tempfile()
#' writeLines(c("", "line 1", "", "", "line 2", "", "", "line 3", ""), file)
#' x <- readLines(file)
#'
#' blank_line_neighbors(x, pattern = "^line 2$")
#' #> [1] 4 6 # Expected
blank_line_neighbors <- function(
    x,
    pattern = NULL,
    index = NULL,
    top = TRUE,
    bottom = TRUE
  ) {
  checkmate::assert_character(x)
  checkmate::assert_string(pattern, null.ok = TRUE)
  checkmate::assert_integerish(index, null.ok = TRUE)
  checkmate::assert_flag(top)
  checkmate::assert_flag(bottom)
  prettycheck::assert_pick(pattern, index, pick = 1)

  if (is.null(index)) {
    line <- stringr::str_which(x, pattern)

    if (length(line) == 0) {
      return(integer())
    }
  } else {
    line <- index
  }

  out <- integer()

  if (isTRUE(top) && line != 1) {
    if (x[line - 1] == "") out <- append(line - 1, out)
  }

  if (isTRUE(bottom) && line != length(x)) {
    if (x[line + 1] == "") out <- append(line + 1, out)
  }

  sort(out)
}
