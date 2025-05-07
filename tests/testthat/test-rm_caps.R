testthat::test_that("remove_caps() | General test", {
  remove_caps(c("a", "b", "c"), start = TRUE, end = TRUE) |>
    testthat::expect_equal(c("b"))

  remove_caps(c("a", "b", "c"), start = FALSE, end = TRUE) |>
    testthat::expect_equal(c("a", "b"))

  remove_caps(c("a", "b", "c"), start = TRUE, end = FALSE) |>
    testthat::expect_equal(c("b", "c"))
})

testthat::test_that("remove_caps() | Error test", {
  # checkmate::assert_flag(start)
  remove_caps(x = "a", start = 1, end = TRUE) |>
    testthat::expect_error()

  # checkmate::assert_flag(end)
  remove_caps(x = "a", start = TRUE, end = 1) |>
    testthat::expect_error()
})
