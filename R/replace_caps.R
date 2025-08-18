#' Replace the first and/or last element of a vector
#'
#' @description
#'
#' `replace_caps()` replaces the first and/or last element of a vector.
#'
#' @param x An [`atomic`][base::is.atomic()] vector.
#' @param replacement (optional) A value to replace the first and/or last
#'   element of `x` with (default: `NA`).
#' @param start (optional) A [`logical`][base::logical] flag indicating whether
#'   to remove the first element of `x` (default: `TRUE`).
#' @param end (optional) A [`logical`][base::logical] flag indicating whether
#'   to remove the last element of `x` (default: `TRUE`).
#'
#' @return The same vector `x` with the first and/or last element replaced.
#'
#' @family vector functions
#' @export
#'
#' @examples
#' replace_caps(c("a", "b", "c"))
#' #> [1] NA "b" NA # Expected
#'
#' replace_caps(c("a", "b", "c"), start = FALSE)
#' #> [1] "a" "b" NA # Expected
#'
#' replace_caps(c("a", "b", "c"), end = FALSE)
#' #> [1] "b" "c" NA # Expected
replace_caps <- function(x, replacement = NA, start = TRUE, end = TRUE) {
  checkmate::assert_atomic(x)
  checkmate::assert_atomic(replacement, len = 1)
  checkmate::assert_flag(start)
  checkmate::assert_flag(end)

  if (isTRUE(start)) x[1] <- replacement
  if (isTRUE(end)) x[length(x)] <- replacement

  x
}
