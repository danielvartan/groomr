#' Remove the first and/or last element of a vector
#'
#' @description
#'
#' `remove_caps()` removes the first and/or last element of a vector.
#'
#' @param x An [`atomic`][base::is.atomic()] vector.
#' @param start (optional) A [`logical`][base::logical] flag indicating whether
#'   to remove the first element of `x` (default: `TRUE`).
#' @param end (optional) A [`logical`][base::logical] flag indicating whether
#'   to remove the last element of `x` (default: `TRUE`).
#'
#' @return The same vector `x` with the first and/or last element removed.
#'
#' @family vector functions
#' @export
#'
#' @examples
#' remove_caps(c("a", "b", "c"))
#' #> [1] "b" # Expected
#'
#' remove_caps(c("a", "b", "c"), start = FALSE)
#' #> [1] "a" "b" # Expected
#'
#' remove_caps(c("a", "b", "c"), end = FALSE)
#' #> [1] "b" "c" # Expected
remove_caps <- function(x, start = TRUE, end = TRUE) {
  checkmate::assert_flag(start)
  checkmate::assert_flag(end)

  if (isTRUE(start)) x <- x[-1]
  if (isTRUE(end)) x <- x[-length(x)]

  x
}
