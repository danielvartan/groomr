format_to_md_latex <- function(
    x, #nolint
    after = NULL,
    before = NULL,
    max_digits = 3,
    decimal_mark = ".",
    big_mark = ",",
    key = "$"
  ) {
  checkmate::assert_atomic(x)
  checkmate::assert_string(after, null.ok = TRUE)
  checkmate::assert_string(before, null.ok = TRUE)
  checkmate::assert_string(decimal_mark)
  checkmate::assert_string(big_mark)
  checkmate::assert_int(max_digits, lower = 0)
  checkmate::assert_string(key)

  # R CMD Check variable bindings fix
  # nolint start
  . <- NULL
  # nolint end

  if (is.numeric(x)) {
    x |>
      round(max_digits) |>
      format(
        decimal.mark = decimal_mark,
        big.mark = big_mark,
        scientific = FALSE
      ) %>% # Don't change the pipe!
      paste0(key, before, ., after, key) |>
      I()
  } else {
    x |>
      as.character() %>% # Don't change the pipe!
      paste0(key, before, ., after, key) |>
      I()
  }
}
