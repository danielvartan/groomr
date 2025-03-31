#' Find closest matches between numeric vectors
#'
#' @description
#'
#' `r lifecycle::badge("maturing")`
#'
#' `find_closest_match_dbl_2()` identifies the closest matches between two
#' [`numeric`][base::numeric] vectors.
#'
#' Matches are determined by calculating the absolute differences between
#' reference and target values. A user-defined tolerance sets the maximum
#' acceptable difference for a match. The closest match is the pair with
#' the smallest absolute difference that falls within the specified tolerance.
#'
#' @param x A [`numeric`][base::numeric] vector.
#' @param y A [`numeric`][base::numeric] vector.
#' @param x_ref A [`numeric`][base::numeric] vector with reference values for
#'   `x`.
#' @param y_ref A [`numeric`][base::numeric] vector with reference values for
#'   `y`.
#' @param tol (Optional) A [`numeric`][base::numeric] value that sets the
#'   maximum acceptable difference for a match (Default: `0.05`).
#'
#' @return If any value was found, returns the index of the closest match in
#'   `x_ref`/`y_ref`. Else, returns `NA`.
#'
#' @family match functions
#' @export
#'
#' @examples
#' x <- c(1, 2, 3, 4, 5)
#' y <- c(1.1, 2.1, 3.1, 4.1, 5.1)
#' x_ref <- c(5, 1, 3, 4, 2)
#' y_ref <- c(5, 1, 3, 4, 2)
#' tol <- 0.5
#'
#' find_closest_match_dbl_2(x, y, x_ref, y_ref, tol)
#' #> [1] 2 5 3 4 1 # Expected
find_closest_match_dbl_2 <- function(x, y, x_ref, y_ref, tol = 0.05) {
  purrr::map2_int(
    .x = x,
    .y = y,
    .f = find_closest_match_dbl_2_scalar,
    x_ref = x_ref,
    y_ref = y_ref,
    tol = tol
  )
}

find_closest_match_dbl_2_scalar <- function( #nolint
    x, #nolint
    y,
    x_ref,
    y_ref,
    tol = 0.05
  ) {
  checkmate::assert_number(x, na.ok = TRUE)
  checkmate::assert_number(y, na.ok = TRUE)
  prettycheck::assert_numeric(x_ref, min_len = 2)
  prettycheck::assert_numeric(y_ref, min_len = 2)
  prettycheck::assert_identical(x_ref, y_ref, type = "length")
  checkmate::assert_number(tol, lower = 0)

  # R CMD Check variable bindings fix
  # nolint start
  x_diff <- y_diff <- NULL
  # nolint end

  out <-
    dplyr::tibble(
      x_ref,
      y_ref,
      x_diff = abs(x_ref - x),
      y_diff = abs(y_ref - y),
    ) |>
    dplyr::mutate(
      row = dplyr::row_number()
    ) |>
    dplyr::filter(x_diff <= tol, y_diff <= tol) |>
    dplyr::arrange(x_diff, y_diff) |>
    dplyr::pull(row)

  if (length(out) == 0) {
    out <- NA_integer_
  } else {
    out[1] |> as.integer()
  }
}
