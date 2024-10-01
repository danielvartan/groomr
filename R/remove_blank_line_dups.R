#' Remove blank line duplicates from a file
#'
#' @description
#'
#' `r lifecycle::badge("experimental")`
#'
#' This function removes blank line duplicates (e.g., a `""` line, followed by
#' another `""` line) from a file.
#'
#' It can also remove blank lines at the top or bottom of the file, and remove
#' blank lines around a text block.
#'
#' @param file A string indicating a file path.
#' @param remove_caps A [`logical`][as.logical] flag indicating if the function
#'   should remove blank lines at the top and bottom of the file.
#' @param block_fix A [`logical`][as.logical] flag indicating if the function
#'   should fix blank lines around a text block
#' @param block_start_pattern A string indicating the start of the text block.
#' @param block_end_pattern A string indicating the end of text block.
#'
#' @return An invisible `NULL`. This function don't aim to return values.
#' @export
#'
#' @examples
#' file <- tempfile()
#' writeLines(c("", "line 1", "", "", "line 2", "", "", "line 3", ""), file)
#'
#' remove_blank_line_dups(file)
#'
#' readLines(file)
#' #> [1] "line 1" ""       "line 2" ""       "line 3" # Expected
remove_blank_line_dups <- function(
    file,
    remove_caps = TRUE,
    block_fix = TRUE,
    block_start_pattern = "<!-- badges: start -->",
    block_end_pattern = "<!-- badges: end -->"
  ) {
  prettycheck:::assert_file(file)
  prettycheck:::assert_file_exists(file, access = "rw")
  prettycheck:::assert_flag(remove_caps)
  prettycheck:::assert_flag(block_fix)
  prettycheck:::assert_string(block_start_pattern)
  prettycheck:::assert_string(block_end_pattern)

  data <- readr::read_lines(file)

  n_lines <- length(data)
  blank_lines <- data == ""
  start_line <- which(blank_lines == FALSE) |> dplyr::first()
  end_line <- which(blank_lines == FALSE) |> dplyr::last()

  lines_to_remove <- integer()

  if (isTRUE(remove_caps)) {
    if (start_line != 1) {
      lines_to_remove <- append(seq(1, start_line - 1), lines_to_remove)
    }

    if (end_line != n_lines && n_lines > end_line) {
      lines_to_remove <- append(seq(end_line + 1, n_lines), lines_to_remove)
    }
  }

  for (i in seq_along(data)) {
    if (isTRUE(blank_lines[i]) && isTRUE(blank_lines[i + 1])) {
      lines_to_remove <- append(i, lines_to_remove)
    }
  }

  if (isTRUE(block_fix)) {
    lines_to_remove <- append(
      c(
        blank_line_neighbors(data, block_start_pattern, top = FALSE),
        blank_line_neighbors(data, block_end_pattern, bottom = FALSE)
      ),
      lines_to_remove
    )
  }

  lines_to_remove <- unique(lines_to_remove)
  if (length(lines_to_remove) > 0) data <- data[-lines_to_remove]

  readr::write_lines(data, file)

  invisible(NULL)
}
