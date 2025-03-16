#' Make file and directory names machine-readable
#'
#' @description
#'
#' `r lifecycle::badge("maturing")`
#'
#' `normalize_names()` normalizes file and directory names to make them
#' machine-readable.
#'
#' This function uses [`dir_ls()`][fs::dir_ls] to list files/directories to
#' rename, along with [`make_machine_readable()`][make_machine_readable]
#' to rename files.
#'
#' @param path (Optional) A [`character`][base::character] string indicating
#'   the directory path. Defaults to clipboard content.
#' @param regex (Optional) A [`character`][base::character] string with
#'   a regular expression to filter files/directories to rename
#'   (Default: `"^README|^OFL.txt$|^DESCRIPTION|^Google README.txt$"`).
#' @param invert (Optional) A [`logical`][base::logical] flag indicating if
#'   the regular expression in `regex` should be negated (Default: `TRUE`).
#' @param ... (Optional) Additional arguments to be passed to
#'   [`dir_ls()`][fs::dir_ls] while listing files/directories to rename.
#'
#' @return An invisible `NULL`. This function is used for its side effect.
#'
#' @family file functions.
#' @export
#'
#' @examples
#' dir <- tempfile("")
#' dir.create(dir) |> invisible()
#'
#' file <- tempfile("Test - Test-", tmpdir = dir)
#' file.create(file) |> invisible()
#'
#' normalize_names(dir)
#'
#' list.files(dir)
#' #> [1] "test-test-***" # Expected
normalize_names <- function(
    path = clipr::read_clip(), # nolint
    regex = "^README|^OFL.txt$|^DESCRIPTION|^Google README.txt$",
    invert = TRUE,
    ...
  ) {
  checkmate::assert_string(path)
  checkmate::assert_directory_exists(path, access = "rw")
  checkmate::assert_string(regex)
  checkmate::assert_flag(invert)

  ls_paths <- fs::dir_ls(path, regex = regex, invert = invert, ...)

  files <- character()
  dirs <- character()

  for (i in ls_paths) {
    if (fs::dir_exists(i)) {
      dirs <- c(dirs, i)
    } else {
      files <- c(files, i)
    }
  }

  # If directories are renamed before files, the file paths will be invalid.
  # Therefore, we need to rename files first and then directories.
  for (i in c(files, dirs)) {
    fs::file_move(
      path = i,
      new_path =
        dirname(i) |>
        file.path(
          i |>
            basename() |>
            make_machine_readable()
        )
    )
  }

  invisible()
}
