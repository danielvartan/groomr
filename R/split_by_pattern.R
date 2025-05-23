#' Split a character vector by a pattern
#'
#' @description
#'
#' `split_by_pattern()` allow you to split a character vector considering a
#' start and end pattern.
#'
#' @param x A [`character`][base::as.character] vector.
#' @param start_pattern (optional) A string with the start pattern (default:
#'   `"^# |^## |---"`).
#' @param end_pattern (optional) A string with the end pattern. Use `NULL` if
#'   there isn't one (default: `NULL`).
#' @param name_list (optional) A [`logical`][base::logical] flag
#'   indicating if each output item should have a name (default: `TRUE`).
#' @param include_start (optional) A [`logical`][base::logical] flag
#'   indicating if the line flagged in the start pattern should be included
#'   in the split (default: `FALSE`).
#'
#' @return A [list][base::list] with the split character vector.
#'
#' @family vector functions
#' @export
#'
#' @examples
#' x <- c(
#'  "# Title 1",
#'  "## Subtitle 1",
#'  "Content 1",
#'  "Content 2",
#'  "# Title 2",
#'  "## Subtitle 2",
#'  "Content 3",
#'  "Content 4"
#'  )
#'
#'  split_by_pattern(
#'    x,
#'    start_pattern = "^# |^## |---",
#'    end_pattern = NULL,
#'    name_list = TRUE,
#'    include_start = FALSE
#'  )
split_by_pattern <- function(
    x, #nolint
    start_pattern = "^# |^## |---",
    end_pattern = NULL,
    name_list = TRUE,
    include_start = FALSE
) {
  checkmate::assert_character(x)
  checkmate::assert_string(start_pattern)
  checkmate::assert_string(end_pattern, null.ok = TRUE)
  checkmate::assert_flag(include_start)

  if (length(x) == 0) return(list())

  out <- list()
  end_flag <- FALSE

  for (i in seq_along(x)) {
    if (!is.null(end_pattern)) {
      if (stringr::str_detect(x[i], end_pattern)) {
        end_flag <- TRUE
      }
    }

    if (stringr::str_detect(x[i], start_pattern)) {
      header <- stringr::str_extract(x[i], start_pattern)
      title <- stringr::str_extract(x[i], "(?<=# |## ).*(?= \\{)|(?<=# |## ).*")
      title <- ifelse(is.na(title), "", title)

      if (isTRUE(include_start)) {
        out[[length(out) + 1]] <- paste0(header, title)
      } else {
        out[[length(out) + 1]] <- as.character(NA)
      }

      if (isTRUE(name_list)) {
        names(out)[length(out)] <- paste0(header, title, " [line ", i, "]")
      }

      end_flag <- FALSE
    } else if (length(out) == 0) {
      next
    } else if (isFALSE(end_flag)) {
      out[[length(out)]] <- append(out[[length(out)]], x[i])
    } else {
      next
    }
  }

  lapply(out, drop_na)
}
