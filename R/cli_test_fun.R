cli_test_fun <- function(test) {
  checkmate::assert_flag(test)

  if (isTRUE(test)) {
    cli::col_blue
  } else {
    cli::col_red
  }
}
