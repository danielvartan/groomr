#' Split a file into parts
#'
#' @description
#'
#' `r lifecycle::badge("stable")`
#'
#' `split_file()` split a single file into `n` parts.
#'
#' @param file (optional) A string indicating the file path
#'  (default:: `file.choose()`).
#' @param n An integer number indicating the amount of parts to split the file.
#' @param dir (optional) A string indicating the directory where to write the
#'  file parts. (default:: `dirname(file)`).
#' @param has_header (optional) A [`logical`][base::as.logical()] flag
#'   indicating if the file has a header (e.g., a CSV file). If `TRUE`, the
#'   header will be repeated as the first line in every part
#'   (default: `FALSE`).
#'
#' @return An invisible `NULL`. This function is used for its side effect.
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
#' data <- as.character(0:100)
#' writeLines(data, con = con)
#' close(con)
#'
#' split_file(file = file_name, n = 3)
#'
#' con <- file(file_name, "r+")
#' readLines(con)
#' close(con)
#'
#' con <- file(paste0(file_name, "_part-1"), "r+")
#' readLines(con)
#' close(con)
#'
#' con <- file(paste0(file_name, "_part-2"), "r+")
#' readLines(con)
#' close(con)
#'
#' con <- file(paste0(file_name, "_part-3"), "r+")
#' readLines(con)
#' close(con)
split_file <- function(
    file = file.choose(), #nolint
    n,
    dir = dirname(file),
    has_header = FALSE
  ) {
  checkmate::assert_string(file)
  checkmate::assert_file_exists(file)
  checkmate::assert_integerish(n, lower = 2)
  checkmate::assert_string(dir)
  checkmate::assert_directory_exists(dir)
  checkmate::assert_flag(has_header)

  con <- file(file, "r")
  data <- readLines(con)
  close(con)

  if (isTRUE(has_header)) {
    header <- data[1]
    data <- data[-1]
  }

  if (length(data) < n) {
    cli::cli_abort(paste0(
      "The {.strong {cli::col_red('data length')}} of the file", " ",
      "cannot be lower than {.strong {cli::col_blue('n')}}."
    ))
  }

  ext <- get_file_ext(file)
  if (is.na(ext)) ext <- ""
  file_name <- get_file_name_without_ext(file)

  data <- data |> cut_vector(n = n)

  for (i in seq_along(data)) {
    file_i <- file.path(dir, paste0(file_name, "_part-", i, ext))

    if (!checkmate::test_file_exists(file_i)) {
      file.create(file_i)
    } else {
      cli::cli_abort(paste0(
        "{.strong {cli::col_red(basename(file_i))}} already ", " ",
        "exists in  {.strong {cli::col_blue('dir')}}. Move or delete the", " ",
        "file and try again."
      ))
    }

    con <- file(file_i, "w")

    if (exists("header")) {
      c(header, data[[i]]) |> writeLines(con = con)
    } else {
      data[[i]] |> writeLines(con = con)
    }

    close(con)
  }

  invisible()
}
