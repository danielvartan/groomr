#' Normalize hashtags inside files
#'
#' @description
#'
#' `normalize_hashtags()` lower case and remove accents and non-alphanumeric
#' characters from hashtags.
#'
#' @section Tip:
#'
#' ```
#' normalize_hashtags(normalizePath(readClipboard(), "/", mustWork = FALSE))
#' ```
#'
#' @param dir (optional) a string indicating the directory of the files. This
#'   function will look up just for files, directories will not be affected.
#'   (default:: `utils::choose.dir()`).
#' @param tag_line (optional) a number indicating the line where the tags
#'  are in.
#'
#' @return An invisible `NULL`. This function don't aim to return values.
#'
#' @family file functions
#' @export
#'
#' @examples
#' file_name <- tempfile(tmpdir = tempfile())
#' dir_name <- dirname(file_name)
#' dir.create(dir_name)
#' file.create(file_name)
#'
#' con <- file(file_name, "r+")
#' data <- c("#tEs43(23)ds #45&$dAAsad-dsade", "", "Test", "")
#' writeLines(data, con = con)
#' close(con)
#'
#' normalize_hashtags(dir_name, tag_line = 1)
#'
#' con <- file(file_name, "r+")
#' readLines(con)
#' close(con)
normalize_hashtags <- function(dir = utils::choose.dir(), tag_line = 1) {
  checkmate::assert_string(dir)
  checkmate::assert_directory_exists(dir)
  checkmate::assert_number(tag_line)

  files <- fs::dir_ls(dir, type = "file")

  for (i in files) {
    con <- file(i, "r+")
    data <- readLines(con, warn = FALSE)

    if (length(data) == 0) {
      close(con)

      next
    }

    data[tag_line] <- normalize_hashtag_string(data[tag_line])
    write(data, file = con)
    close(con)
  }

  invisible()
}

normalize_hashtag_string <- function(tag) {
  checkmate::assert_character(tag)

  tag |>
    stringr::str_to_lower() |>
    stringr::str_squish() |>
    stringr::str_replace_all("[^[:alnum:]\\s#-]", "") |>
    iconv(from = "UTF-8", to = "ASCII//TRANSLIT")
}
