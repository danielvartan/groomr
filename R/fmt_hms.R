#' Format time duration strings into `hms` for `gtsummary` objects
#'
#' @description
#'
#' `fmt_hms()` formats strings representing time durations
#' (e.g.,`"1,234.56 secs"`) in [`gtsummary`][gtsummary::as_gtsummary] objects
#' to a more readable [`hms`][hms::as_hms] format (e.g., `"00:20:34"`).
#'
#' @param x A [`gtsummary`][gtsummary::as_gtsummary] object.
#' @param big_mark (optional) A [`character`][base::character] string indicating
#'   the thousands separator (default: `","`).
#' @param decimal_mark (optional) A [`character`][base::character] string
#'   indicating the decimal separator (default: `"."`).
#'
#' @return A [`gtsummary`][gtsummary::as_gtsummary] object with formatted
#'   `hms` strings in all `stat_` columns.
#'
#' @family `gtsummary` functions
#' @export
#'
#' @examples
#' library(dplyr)
#' library(gtsummary)
#' library(hms)
#'
#' table <-
#'   tibble(
#'     time =
#'       seq(
#'         from = parse_hms("00:00:00"),
#'         to = parse_hms("23:59:59"),
#'         by = parse_hms("00:00:01")
#'       ) |>
#'       sample(1000)
#'   ) |>
#'   tbl_summary(
#'     label = list(time ~ "Time of Day"),
#'     type = all_continuous() ~ "continuous2",
#'     statistic = all_continuous2() ~ c("{mean} ({sd})", "{min}, {max}")
#'   )
#'
#' table
#'
#' table |> fmt_hms()
fmt_hms <- function(
  x,
  big_mark = ",",
  decimal_mark = "."
) {
  checkmate::assert_class(x, "gtsummary")
  checkmate::assert_string(big_mark, n.chars = 1)
  checkmate::assert_string(decimal_mark, n.chars = 1)

  # R CMD Check variable bindings fix
  # nolint start
  . <- NULL
  # nolint end

  x |>
    magrittr::extract2("table_body") |>
    dplyr::mutate(
      dplyr::across(
        .cols = dplyr::starts_with("stat_"),
        .fns = \(x) fmt_hms.character(x, big_mark, decimal_mark)
      )
    ) %>%
    magrittr::inset2(x, "table_body", .)
}

fmt_hms.character <- function(x, big_mark, decimal_mark) {
  checkmate::assert_character(x)
  checkmate::assert_string(big_mark, n.chars = 1)
  checkmate::assert_string(decimal_mark, n.chars = 1)

  index <- x |> stringr::str_which("\\bsecs\\b")

  if (!length(index) == 0) {
    x <- x |> stringr::str_replace_all(" secs\\b", "")

    for (i in index) {
      values <-
        x[i] |>
        stringr::str_extract_all(
          paste0("\\b[\\d", big_mark, decimal_mark, "]+\\b")
        ) |>
        unlist()

      for (j in seq_along(values)) {
        replacement <-
          values[j] |>
          stringr::str_remove_all(big_mark) |>
          stringr::str_replace(paste0("\\", decimal_mark), ".") |>
          as.numeric() |>
          round() |>
          hms::as_hms() |>
          as.character()

        x[i] <- x[i] |> stringr::str_replace(values[j], replacement)
      }
    }

    x
  } else {
    x
  }
}
