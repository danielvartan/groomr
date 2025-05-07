#' Get the Shared Directory of Files
#'
#' @description
#'
#' `r lifecycle::badge("stable")`
#'
#' `get_shared_dir()` identifies the common parent directories among a set of
#' file paths. It returns the directories that are shared by two or more files
#' in the input vector.
#'
#' @param files A [`character`][base::character()] vector of file paths.
#' @param expand_paths (optional) A [`logical`][base::logical()] flag
#'   indicating whether to expand relative paths to absolute paths. If `TRUE`,
#'   all paths must exist (default: `FALSE`).
#'
#' @return A [`character`][base::character()] vector of shared directories.
#'   If no shared directories are found, it returns `NA_character_`.
#'
#' @family file functions
#' @export
#'
#' @examples
#' get_shared_dir(c("/home/user/file1.txt", "/home/user/file2.txt"))
#' #> [1] "/home/user"
#'
#' files <- c(
#'   "/home/user/file1.txt",
#'   "/home/user/file2.txt",
#'   "/home/user/dir/file3.txt",
#'   "/home/test.txt",
#'   "C:\\Users\\user\\file1.txt"
#' )
#'
#' get_shared_dir(files)
#' #> [1] "/home"      "/home/user"
get_shared_dir <- function(files, expand_paths = FALSE) {
  checkmate::assert_character(files, any.missing = FALSE)

  if (isTRUE(expand_paths)) {
    checkmate::assert_file_exists(files, access = "r")

    files <- normalizePath(files)
  }

  shared_dir <- character()

  for (i in files) {
    test <- stringr::str_starts(files, dirname(i))

    if (length(which(test == TRUE)) > 1 && !dirname(i) == ".") {
      shared_dir <- c(shared_dir, dirname(i))
    }
  }

  if (length(shared_dir) == 0) {
    NA_character_
  } else {
    shared_dir |> sort() |> unique()
  }
}
