#' Replace patterns inside files
#'
#' @description
#'
#' __ATTENTION__: Be careful, there is no coming back from the effects of
#' this function.
#'
#' `replace_pattern()` search each line of a file and replace a specific pattern
#' when found.
#'
#' @section Tip:
#'
#' ```
#' replace_pattern(
#'   dir = normalizePath(readClipboard(), "/", mustWork = FALSE),
#'   pattern = "pattern", replacement = "pattern"
#' )
#' ```
#'
#' @param dir (optional) a string indicating the directory of the files. This
#'   function will look up just for files, directories will not be affected.
#'   (default:: `utils::choose.dir()`).
#' @param pattern A [character][base::character()] vector indicating the
#'   pattern to look for. The default interpretation is a regular expression.
#'   This parameter will be used on [stringr::str_replace_all()].
#' @param replacement A [character][base::character()] vector indicating the
#'   replacement value. This parameter will be used on
#'   [stringr::str_replace_all()].
#'
#' @return An invisible `NULL`. This function don't aim to return values.
#'
#' @family string functions.
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
#' replace_pattern(
#'   dir = dir_name,
#'   pattern = "([0-1][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]",
#'   replacement = ""
#'   )
#'
#' con <- file(file_name, "r+")
#' readLines(con)
#' close(con)
replace_pattern <- function(dir = utils::choose.dir(), pattern, replacement) {
  checkmate::assert_string(dir)
  checkmate::assert_directory_exists(dir)
  checkmate::assert_character(pattern)
  checkmate::assert_character(replacement)
  rutils:::assert_identical(pattern, replacement, type = "length")

  files <- list_files(dir) #nolint

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

# pattern = "../_resources/|./_resources/"
