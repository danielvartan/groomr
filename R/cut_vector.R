#' Cut a vector into segments
#'
#' @description
#'
#' `cut_vector()` splits a vector into segments at specified cutting points
#' or indexes. You can define the cuts either by providing explicit index
#' positions or by specifying the number of segments.
#'
#' Additional options allow you to control whether cuts occur between or at
#' index values, and whether to remove elements at the start or end of the
#' resulting segments.
#'
#' @details
#'
#' `cut_vector()` can perform different kinds of cuts. Here are some examples.
#'
#' ## Cutting by index values
#'
#' ```
#' cut_vector(seq(10), c(3, 9))
#'
#'    cut         cut
#'     |           |
#' 1 2 3 4 5 6 7 8 9 10
#'
#' Element 1: 1, 2
#' Element 2: 4, 5, 6, 7, 8
#' Element 3: 10
#' ```
#'
#' ## Cutting between index values
#'
#' ```
#' cut_vector(seq(10), c(3, 9), between = "left")
#'
#'   cut         cut
#'    |           |
#' 1 2 3 4 5 6 7 8 9 10
#'
#' Element 1: 1, 2
#' Element 2: 3, 4, 5, 6, 7, 8
#' Element 3: 9, 10
#' ```
#'
#' ```
#' cut_vector(seq(10), c(3, 9), between = "right")
#'
#'     cut         cut
#'      |           |
#' 1 2 3 4 5 6 7 8 9 10
#'
#' Element 1: 1, 2, 3
#' Element 2: 4, 5, 6, 7, 8, 9
#' Element 3: 10
#' ```
#'
#' ## Cutting by number of segments
#'
#' ```
#' cut_vector(seq(10), n = 3, round_fun = floor)
#'
#'     cut   cut
#'      |     |
#' 1 2 3 4 5 6 7 8 9 10
#'
#' Element 1: 1, 2, 3
#' Element 2: 4, 5, 6
#' Element 3: 7, 8, 9, 10
#' ```
#'
#' ```
#' cut_vector(seq(10), n = 3, round_fun = ceiling)
#'
#'       cut     cut
#'        |       |
#' 1 2 3 4 5 6 7 8 9 10
#'
#' Element 1: 1, 2, 3, 4
#' Element 2: 5, 6, 7, 8
#' Element 3: 9, 10
#' ```
#'
#' ## Removing tips
#'
#' ```
#' cut_vector(seq(20), c(7, 16), rm_start = TRUE, rm_end = TRUE)
#'
#'            cut                      cut
#'             |                        |
#' 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
#' |---------|                            |---------|
#'  start tip                               end tip
#'
#' Element 1: 8, 9, 10, 11, 12, 13, 14, 15
#' ```
#'
#' @param x An [atomic][checkmate::test_atomic_vector()] vector.
#' @param index (optional) An [integerish][checkmate::test_integerish()]
#'   `numeric` object with the indexes/cutting points (default: `NULL`).
#' @param n (optional) An [integerish][checkmate::test_integerish()] number
#'   specifying the number of segments to cut the vector into. If `n` is
#'   specified, the `index` argument is ignored (default: `NULL`).
#' @param between (optional) A string specifying the direction of the cut:
#'   `"left"` or `"right"`. Use this argument only when the cut should be
#'   performed between the index values (default: `NULL`).
#' @param rm_start (optional) a [`logical`][base::logical()] flag indicating if
#'   the start element of the cut must be removed (default: `FALSE`).
#' @param rm_end (optional) a [`logical`][base::logical()] flag indicating if
#'   the end element of the cut must be removed (default: `FALSE`).
#' @param round_fun (optional) A function to round the number of elements in
#'   when cutting using `n` (default: `floor`).
#'
#' @return A [`list`][base::as.list()] object with the cut pieces as elements.
#'
#' @family vector functions
#' @export
#'
#' @examples
#' ## Cutting by index values
#'
#' cut_vector(seq(10), c(3, 9))
#'
#' ## Cutting between index values
#'
#' cut_vector(seq(10), c(3, 9), between = "left")
#'
#' cut_vector(seq(10), c(3, 9), between = "right")
#'
#' ## Removing start or end tips
#'
#' cut_vector(seq(10), c(3, 9), rm_start = TRUE)
#'
#' cut_vector(seq(10), c(3, 9), rm_end = TRUE)
cut_vector <- function(
  x,
  index = NULL,
  n = NULL,
  between = NULL,
  rm_start = FALSE,
  rm_end = FALSE,
  round_fun = floor
) {
  checkmate::assert_atomic_vector(x, min.len = 1)
  checkmate::assert_integerish(
    index,
    lower = 1,
    upper = length(x),
    any.missing = FALSE,
    all.missing = FALSE,
    unique = TRUE,
    null.ok = TRUE
  )
  checkmate::assert_int(n, lower = 0, null.ok = TRUE)
  checkmate::assert_choice(between, c("left", "right"), null.ok = TRUE)
  checkmate::assert_flag(rm_start)
  checkmate::assert_flag(rm_end)
  checkmate::assert_function(round_fun)

  if (!is.null(n)) {
    x <- cut_n(x, n, round_fun)
  } else if (is.null(between)) {
    x <- cut_by(x, index)
  } else {
    x <- cut_between(x, index, between)
  }

  if ((isTRUE(rm_start) || isTRUE(rm_end)) && length(x) == 1) {
    cli::cli_abort(paste0(
      "The cut process returned just one piece. In those cases, ",
      "{cli::col_blue('rm_start')} and {cli::col_blue('rm_end')} ",
      "cannot be {cli::col_red('TRUE')}."
    ))
  }

  if (isTRUE(rm_start) && !length(x) == 1) {
    x <- x[-1]
  }

  if (isTRUE(rm_end) && !length(x) == 1) {
    x <- x[-length(x)]
  }

  x
}

cut_n <- function(x, n, round_fun = floor) {
  checkmate::assert_atomic(x, min.len = n)
  checkmate::assert_integerish(n, lower = 0)
  checkmate::assert_function(round_fun)

  if (n < 2) {
    x
  } else {
    cut_size <- round_fun(length(x) / n)
    cut_indexes <- cut_size

    for (i in utils::head(seq(n)[-1], -1)) {
      cut_indexes <- append(
        cut_indexes,
        cut_indexes[length(cut_indexes)] + cut_size
      )
    }

    cut_vector(x, cut_indexes, between = "right")
  }
}

cut_by <- function(x, index) {
  checkmate::assert_atomic_vector(x, min.len = 1)
  checkmate::assert_integerish(index, lower = 1, upper = length(x),
                               any.missing = FALSE, all.missing = FALSE,
                               unique = TRUE)

  if (index[1] == 1 || index[length(index)] == length(x)) {
    cli::cli_abort(paste0(
      "When {cli::col_red('between = NULL')}, an index cannot be ",
      "in the start or at the end of an object."
    ))
  }

  if (any(Reduce("-", index) == -1)) {
    cli::cli_abort(paste0(
      "When {cli::col_red('between = NULL')}, indexes must have at ",
      "least a distance of {cli::col_red(1)} between each other."
    ))
  }

  out <- list()

  for (i in index) {
    i_index <- which(index == i)
    j <- length(out) + 1

    if (i == index[1]) {
      out[[j]] <- x[seq(1, i - 1)]

      if (length(index) == 1) {
        out[[j + 1]] <- x[seq(i + 1, length(x))]
      } else {
        out[[j + 1]] <- x[seq(i + 1, index[i_index + 1] - 1)]
      }
    } else if (i == index[length(index)]) {
      out[[j]] <- x[seq(i + 1, length(x))]
    } else {
      out[[j]] <- x[seq(i + 1, index[i_index + 1] - 1)]
    }
  }

  out
}

cut_between <- function(x, index, between) { #nolint
  checkmate::assert_atomic_vector(x, min.len = 1)
  checkmate::assert_integerish(index, lower = 1, upper = length(x),
                               any.missing = FALSE, all.missing = FALSE,
                               unique = TRUE)
  checkmate::assert_choice(between, c("left", "right"))

  out <- list()

  if (between == "left") {
    for (i in index) {
      i_index <- which(index == i)
      j <- length(out) + 1

      if (i == index[1]) {
        if (!i == 1) {
          out[[1]] <- x[seq(1, i - 1)]
          j <- 2
        }

        if (length(index) == 1) {
          out[[j]] <- x[seq(i, length(x))]
        } else {
          out[[j]] <- x[seq(i, index[i_index + 1] - 1)]
        }
      } else if (i == index[length(index)]) {
        out[[j]] <- x[seq(i, length(x))]
      } else {
        out[[j]] <- x[seq(i, index[i_index + 1] - 1)]
      }
    }
  } else {
    for (i in index) {
      i_index <- which(index == i)
      j <- length(out) + 1

      if (i == index[1]) {
        out[[1]] <- x[seq(1, i)]

        if (length(index) == 1) {
          out[[2]] <- x[seq(i + 1, length(x))]
        }
      } else if (i == index[length(index)] && !i == length(x)) {
        out[[j]] <- x[seq(index[i_index - 1] + 1, i)]
        out[[j + 1]] <- x[seq(i + 1, length(x))]
      } else {
        out[[j]] <- x[seq(index[i_index - 1] + 1, i)]
      }
    }
  }

  out
}
