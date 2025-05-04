# Borrowed from `rutils`: github.com/danielvartan/rutils
drop_na <- function(x) {
  checkmate::assert_atomic(x)

  x[which(!is.na(x))]
}

# Borrowed from `rutils`: github.com/danielvartan/rutils
get_file_ext <- function(file) {
  checkmate::assert_character(file)

  file |>
    basename() |>
    stringr::str_extract("\\.[[:alnum:]]+$")
}

# Borrowed from `rutils`: github.com/danielvartan/rutils
get_file_name_without_ext <- function(file) {
  checkmate::assert_character(file)

  ext <- get_file_ext(file)

  ifelse(
    is.na(ext),
    file |> basename(),
    file |>
      basename() |>
      stringr::str_replace(paste0("\\", ext, "$"), "")
  )
}

# Borrowed from `rutils`: github.com/danielvartan/rutils
shush <- function(x, quiet = TRUE) {
  if (isTRUE(quiet)) {
    suppressMessages(suppressWarnings(x))
  } else {
    x
  }
}
