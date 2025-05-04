#' Replace patterns inside files
#'
#' @description
#'
#' `r lifecycle::badge("maturing")`
#'
#' `replace_in_file()` searches each line of a file and replaces a specific
#' pattern when found.
#'
#' @param file A [`character`][base::character()] vector specifying the
#'   path(s) to the file(s) in which to perform the replacement.
#' @param pattern A [`character`][base::character()] vector specifying the
#'   pattern(s) (regular expressions) to search for. If multiple patterns are
#'   provided, each must correspond to a replacement of the same length.
#' @param replacement A [`character`][base::character()] vector specifying the
#'   replacement value(s) to use. Each element is applied to the corresponding
#'   pattern via [str_replace_all()][stringr::str_replace_all()].
#'
#' @return An invisible `NULL`. This function is used for its side effect.
#'
#' @family file functions
#' @export
#'
#' @examples
#' file <- tempfile()
#' file.create(file)
#'
#' con <- file(file, "r+")
#' data <- c("01:00:56", "", "Test", "")
#' writeLines(data, con = con)
#' close(con)
#'
#' replace_in_file(
#'   file = file,
#'   pattern = "([0-1][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]",
#'   replacement = ""
#' )
#'
#' con <- file(file, "r+")
#' readLines(con)
#' close(con)
replace_in_file <- function(
    file, #nolint
    pattern,
    replacement
  ) {
  checkmate::assert_string(file)
  checkmate::assert_file_exists(file)
  checkmate::assert_string(pattern)
  checkmate::assert_string(replacement)
  prettycheck::assert_identical(pattern, replacement, type = "length")

  cli::cli_progress_bar(
    "Replacing patterns",
    total = length(file),
    clear = FALSE
  )

  for (i in file) {
    data <- readr::read_lines(i)

    if (length(data) == 0) {
      cli::cli_progress_update()

      next
    }

    for (j in seq_along(pattern)) {
      data <- stringr::str_replace_all(
        data,
        pattern[j],
        replacement[j]
      )
    }

    readr::write_lines(data, i)

    cli::cli_progress_update()
  }

  cli::cli_progress_done()

  invisible()
}
