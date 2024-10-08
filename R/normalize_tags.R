#' Normalize hashtags inside files
#'
#' @description
#'
#' `r lifecycle::badge("experimental")`
#'
#' __ATTENTION__: Be careful, there is no coming back from the effects of
#' this function. It only works for hashed tags.
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
#' @family tag functions.
#' @export
#'
#' @examples
#' file_name <- tempfile(tmpdir = tempfile())
#' dir_name <- dirname(file_name)
#' dir.create(dir_name)
#' file.create(file_name)
#'
#' con <- file(file_name, "r+")
#' data <- c("#tEs43(23)ds", "#45&$dAAsad-dsade", "", "Test", "")
#' writeLines(data, con = con)
#' close(con)
#'
#' normalize_hashtags(dir_name, tag_line = 1)
#'
#' con <- file(file_name, "r+")
#' readLines(con)
#' close(con)
normalize_hashtags <- function(dir = utils::choose.dir(), tag_line = 1) {
  prettycheck:::assert_string(dir)
  prettycheck:::assert_directory_exists(dir)
  prettycheck:::assert_number(tag_line)

  files <- rutils:::list_files(dir) #nolint

  cli::cli_progress_bar(
    "Normalizing tags", total = length(files), clear = FALSE
  )

  for (i in files) {
    con <- file(i, "r+")
    data <- readLines(con, warn = FALSE)

    if (length(data) == 0) {
      close(con)
      cli::cli_progress_update()

      next
    }

    data[tag_line] <- normalize_hashtag_string(data[tag_line])
    write(data, file = con)
    close(con)

    cli::cli_progress_update()
  }

  cli::cli_progress_done()

  invisible(NULL)
}

normalize_hashtag_string <- function(tag) {
  prettycheck:::assert_character(tag)

  tag |>
    stringr::str_to_lower() |>
    stringr::str_squish() |>
    stringr::str_replace_all("[^[:alnum:]\\s#-]", "") |>
    iconv(from = "UTF-8", to = "ASCII//TRANSLIT")
}
