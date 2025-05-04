#' Peek the dimensions of a CSV file
#'
#' @description
#'
#' `r lifecycle::badge("stable")`
#'
#' `peek_csv_file()` reads a CSV file and provides a summary of its contents,
#' including the number of columns, rows, and cells. It is useful for quickly
#' inspecting the structure of a CSV file without loading the entire dataset
#' into memory.
#'
#' @param file A string specifying the path to the file.
#' @param delim A string specifying the delimiter used in the file
#'   (default: `","`).
#' @param skip An [`integer`][base::as.integer()] specifying the number of
#'   lines to skip before reading the file (default: `0`).
#' @param has_header A [`logical`][base::logical()] flag indicating whether
#'   the file has a header row. If `TRUE`, the first row is
#'   treated as column names (default: `TRUE`).
#'
#' @return An invisible `NULL`. This function is used for its side effect.
#'
#' @family file functions
#' @export
#'
#' @examples
#' library(datasets)
#' library(readr)
#'
#' file <- tempfile()
#'
#' write_csv(mtcars, file)
#'
#' peek_csv_file(file)
#' #> The file has 11 columns, 32 rows*, and 352 cells. # Expected
peek_csv_file <- function(file, delim = ",", skip = 0, has_header = TRUE) {
  checkmate::assert_string(file)
  checkmate::assert_file_exists(file)
  checkmate::assert_string(delim)
  checkmate::assert_int(skip)
  checkmate::assert_flag(has_header)

  cols <-
    file |>
    readr::read_delim(
      delim = delim,
      col_names = TRUE,
      skip = skip,
      n_max = 1,
      progress = FALSE
    ) |>
    shush() |>
    ncol()

  rows <- fpeek::peek_count_lines(file, with_eof = FALSE) - skip
  if (has_header) rows <- rows - 1

  cells <- cols * rows #nolint

  cli::cli_inform(paste0(
    "The file has ",
    "{.strong {cli::col_red(prettyNum(cols, big.mark = ','))}} columns, ",
    "{.strong {cli::col_green(prettyNum(rows, big.mark = ','))}} rows*, and ",
    "{.strong {cli::col_blue(prettyNum(cells, big.mark = ','))}} cells.",
    ifelse(
      !skip == 0,
      paste0(
        "\n\n",
        "*Note: Row count excludes any skipped lines ({skip})."
      ),
      ""
    )
  ))

  invisible()
}
