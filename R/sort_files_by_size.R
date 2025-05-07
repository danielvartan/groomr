#' Sort files based on their size
#'
#' @description
#'
#' `r lifecycle::badge("stable")`
#'
#' `sort_files_by_size()` sorts a vector of file paths based on their size.
#' It is useful for organizing files in a directory or for preparing files
#' for processing.
#'
#' @param files A [`character`][base::character()] vector of file paths.
#' @param decreasing (optional) A [`logical`][base::logical()] flag indicating
#'   whether to sort the files in decreasing order of size (default: `FALSE`).
#' @param root (optional) A string specifying the root directory of the files.
#'   If `NULL`, the function will treat the paths as absolute
#'   (default: `NULL`).
#'
#' @return A [`character`][base::character()] vectors with the file paths
#'   sorted by size.
#'
#' @family file functions
#' @export
#'
#' @examples
#' library(fs)
#' library(readr)
#'
#' files <- c("file1.txt", "file2.txt", "file3.txt", "file4.txt", "file5.txt")
#'
#' dir <- tempfile("dir")
#' dir.create(dir)
#'
#' for (i in files) {
#'   write_lines(rep(letters, sample(1000:10000, 1)), file.path(dir, i))
#' }
#'
#' sizes <- file_size(file.path(dir, files)) |> as.character() |> trimws()
#' names(sizes) <- files
#' sizes
#'
#' sort_files_by_size(files, root = dir)
sort_files_by_size <- function(files, decreasing = FALSE, root = NULL) {
  checkmate::assert_character(files, any.missing = FALSE)
  checkmate::assert_flag(decreasing)

  if (is.null(root)) {
    checkmate::assert_file_exists(files, access = "r")
  } else {
    files <- fs::path(root, files)

    checkmate::assert_directory_exists(root, access = "r")
    checkmate::assert_file_exists(files, access = "r")
  }

  out <-
    files |>
    fs::file_size() |>
    magrittr::set_names(files) |>
    sort(decreasing = decreasing) |>
    names()

  if (!is.null(root)) {
    fs::path_rel(out, root)
  } else {
    out
  }
}
