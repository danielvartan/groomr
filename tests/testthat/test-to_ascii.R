testthat::test_that("to_ascii() | General test", {
  # # Issue with Mac builds: "S~ao Paulo"
  # to_ascii(x = "São Paulo", from = "UTF-8") |>
  #   testthat::expect_equal("Sao Paulo")

  to_ascii(x = "Comment ça va", from = "UTF-8") |>
    testthat::expect_equal("Comment ca va")
})

testthat::test_that("to_ascii() | Error test", {
  # checkmate::assert_character(x)
  to_ascii(x = 1, from = "UTF-8") |>
    testthat::expect_error()

  # checkmate::assert_string(from)
  to_ascii(x = "a", from = 1) |>
    testthat::expect_error()
})
