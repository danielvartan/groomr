testthat::test_that("rm_caps() | General test", {
  rm_caps(c("a", "b", "c"), start = TRUE, end = TRUE) |>
    testthat::expect_equal(c("b"))

  rm_caps(c("a", "b", "c"), start = FALSE, end = TRUE) |>
    testthat::expect_equal(c("a", "b"))

  rm_caps(c("a", "b", "c"), start = TRUE, end = FALSE) |>
    testthat::expect_equal(c("b", "c"))
})

testthat::test_that("rm_caps() | Error test", {
  # checkmate::assert_flag(start)
  rm_caps(x = "a", start = 1, end = TRUE) |>
    testthat::expect_error()

  # checkmate::assert_flag(end)
  rm_caps(x = "a", start = TRUE, end = 1) |>
    testthat::expect_error()
})
