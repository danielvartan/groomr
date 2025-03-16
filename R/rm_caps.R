#' Remove the first and/or last element of a `character`` vector
#'
#' @description
#'
#' `r lifecycle::badge("stable")`
#'
#' `rm_caps()` removes the first and/or last element of a `character`` vector.
#'
#' @param x A [`character`][base::character] vector.
#' @param start A [`logical`][base::logical] flag indicating whether to remove
#'   the first element of `x` (Default: `TRUE`).
#' @param end A [`logical`][base::logical] flag indicating whether to remove
#'   the last element of `x` (Default: `TRUE`).
#'
#' @return A [`character`][base::character] vector.
#'
#' @family string functions.
#' @export
#'
#' @examples
#' rm_caps(c("a", "b", "c"))
#' #> [1] "b" # Expected
#'
#' rm_caps(c("a", "b", "c"), start = FALSE)
#' #> [1] "a" "b" # Expected
#'
#' rm_caps(c("a", "b", "c"), end = FALSE)
#' #> [1] "b" "c" # Expected
rm_caps <- function(x, start = TRUE, end = TRUE) {
  checkmate::assert_flag(start)
  checkmate::assert_flag(end)

  if (isTRUE(start)) x <- x[-1]
  if (isTRUE(end)) x <- x[-length(x)]

  x
}
