#' Split files based on their size
#'
#' @description
#'
#' `split_files_by_size()` splits a vector of file paths into chunks based on
#' their size. It is useful for managing large files or datasets that need to
#' be processed in smaller parts.
#'
#' The function groups files into chunks so that the total size of files in
#' each chunk does not exceed the specified limit. If an individual file is
#' larger than the limit, it will be placed in its own chunk. The files are
#' sorted by size in decreasing order before chunking.
#'
#' @param files A [`character`][base::character()] vector of file paths.
#' @param max_size (optional) An integer or [`fs_bytes`][fs::fs_bytes()] value
#'   specifying the maximum total size (in bytes) allowed for each chunk
#'   (default: `fs_bytes("1GB")`).
#' @param order_by_size (optional) A [`logical`][base::logical()] flag
#'   indicating whether to sort the files by size before chunking
#'   (default: `TRUE`).
#' @param decreasing_size (optional) A [`logical`][base::logical()] flag
#'   indicating whether to sort the files in decreasing order of size.
#'   This is only relevant if `order_by_size` is `TRUE` (default: `FALSE`).
#' @param root (optional) A string specifying the root directory of the files.
#'   If `NULL`, the function will treat the paths as absolute
#'   (default: `NULL`).
#'
#' @return A [`list`][base::list()] of character vectors, where each vector
#'   contains file paths that fit within the specified size limit.
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
#' files <- sort_files_by_size(files, root = dir)
#' sizes <- file_size(file.path(dir, files)) |> as.character() |> trimws()
#' names(sizes) <- files
#' sizes
#'
#' total_size <- file_size(file.path(dir, files)) |> sum()
#' max_size <- fs::fs_bytes(total_size / 2)
#'
#' max_size
#'
#' split_files_by_size(
#'   files,
#'   max_size = fs_bytes(total_size / 2),
#'   root = dir
#' )
split_files_by_size <- function(
  files,
  max_size = fs::fs_bytes("1GB"),
  order_by_size = TRUE,
  decreasing_size = FALSE,
  root = NULL
) {
  checkmate::assert_character(files, any.missing = FALSE)
  checkmate::assert_number(max_size, lower = fs::fs_bytes(1))
  checkmate::assert_flag(order_by_size)
  checkmate::assert_flag(decreasing_size)

  if (is.null(root)) {
    checkmate::assert_file_exists(files, access = "r")
  } else {
    files <- fs::path(root, files)

    checkmate::assert_directory_exists(root, access = "r")
    checkmate::assert_file_exists(files, access = "r")
  }

  if (isTRUE(order_by_size)) {
    files <- sort_files_by_size(files, decreasing = decreasing_size)
  }

  total_size <- files |> fs::file_size() |> sum()

  if (total_size > max_size) {
    out <- list()
    i_chunk <- character()

    for (i in files) {
      i_chunk_sum <-
        i_chunk |>
        c(i) |>
        fs::file_size() |>
        sum()

      if (fs::file_size(i) > max_size) {
        out <- c(out, list(i))
      } else if (i_chunk_sum > max_size) {
        if (i == files[length(files)]) {
          out <- c(out, list((i_chunk), i))
        } else {
          out <- c(out, list(c(i_chunk)))
          i_chunk <- i
        }
      } else {
        i_chunk <- c(i_chunk, i)
      }
    }
  } else {
    out <- list(files)
  }

  if (!is.null(root)) {
    lapply(out, fs::path_rel, root)
  } else {
    out
  }
}
