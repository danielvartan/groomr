testthat::test_that("replace_caps() | General test", {
  replace_caps(c("a", "b", "c"), replacement = NA, start = TRUE, end = TRUE) |>
    testthat::expect_equal(c(NA, "b", NA))

  replace_caps(c("a", "b", "c"), replacement = NA, start = FALSE, end = TRUE) |>
    testthat::expect_equal(c("a", "b", NA))

  replace_caps(c("a", "b", "c"), replacement = NA, start = TRUE, end = FALSE) |>
    testthat::expect_equal(c(NA, "b", "c"))
})

testthat::test_that("replace_caps() | Error test", {
  # checkmate::assert_atomic(x)
  replace_caps(
    x = list(a = 1, b = 2),
    replacement = NA,
    start = TRUE,
    end = TRUE
  ) |>
    testthat::expect_error()

  # checkmate::assert_atomic(replacement, len = 1)
  replace_caps(x = "a", replacement = 1:2, start = TRUE, end = TRUE) |>
    testthat::expect_error()

  # checkmate::assert_flag(start)
  replace_caps(x = "a", replacement = NA, start = 1, end = TRUE) |>
    testthat::expect_error()

  # checkmate::assert_flag(end)
  replace_caps(x = "a", replacement = NA, start = TRUE, end = 1) |>
    testthat::expect_error()
})
