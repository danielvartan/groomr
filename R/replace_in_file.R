#' Replace patterns inside files
#'
#' @description
#'
#' `r lifecycle::badge("maturing")`
#'
#' `replace_in_file()` searches each line of a file and replaces a specific
#' pattern when found.
#'
#' @param dir (Optional) a string indicating the directory of the files.
#'   Defaults to clipboard content.
#' @param pattern A string indicating the pattern to look for. The default
#'   interpretation is a regular expression. This parameter will be used on
#'   [stringr::str_replace_all()].
#' @param replacement A string indicating the replacement value. This parameter
#'   will be used on [stringr::str_replace_all()].
#'
#' @return An invisible `NULL`. This function is used for its side effect.
#'
#' @family string functions
#' @export
#'
#' @examples
#' file_name <- tempfile(tmpdir = tempfile())
#' dir_name <- dirname(file_name)
#' dir.create(dir_name)
#' file.create(file_name)
#'
#' con <- file(file_name, "r+")
#' data <- c("01:00:56", "", "Test", "")
#' writeLines(data, con = con)
#' close(con)
#'
#' replace_in_file(
#'   dir = dir_name,
#'   pattern = "([0-1][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]",
#'   replacement = ""
#'   )
#'
#' con <- file(file_name, "r+")
#' readLines(con)
#' close(con)
replace_in_file <- function(
    dir = clipr::read_clip(), #nolint
    pattern,
    replacement
  ) {
  checkmate::assert_string(dir)
  checkmate::assert_directory_exists(dir)
  checkmate::assert_string(pattern)
  checkmate::assert_string(replacement)
  prettycheck::assert_identical(pattern, replacement, type = "length")

  files <- fs::dir_ls(dir, type = "file")

  cli::cli_progress_bar(
    "Replacing patterns", total = length(files), clear = FALSE
  )

  for (i in files) {
    con <- file(i, "r+")
    data <- readLines(con, warn = FALSE)

    if (length(data) == 0) {
      close(con)
      cli::cli_progress_update()

      next
    }

    data <- stringr::str_replace_all(data, pattern, replacement)
    write(data, file = con)
    close(con)

    cli::cli_progress_update()
  }

  cli::cli_progress_done()

  invisible(NULL)
}
