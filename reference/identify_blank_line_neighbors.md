# Identify blank lines around a line

`identify_blank_line_neighbors()` identify and returns the indexes of
blank lines around a specific line matching a pattern.

## Usage

``` r
identify_blank_line_neighbors(
  x,
  pattern = NULL,
  index = NULL,
  top = TRUE,
  bottom = TRUE
)
```

## Arguments

- x:

  A [`character`](https://rdrr.io/r/base/character.html) vector.

- pattern:

  A string indicating the pattern to look for. If there's more than one
  match, the first one will be used (default: `NULL`).

- index:

  An integer number indicating the line to look for (default: `NULL`).
  If this parameter is provided, the `pattern` parameter will be
  ignored.

- top:

  A [`logical`](https://rdrr.io/r/base/logical.html) flag indicating if
  the function should look for blank lines at the top of the line
  (default: `TRUE`).

- bottom:

  A [`logical`](https://rdrr.io/r/base/logical.html) flag indicating if
  the function should look for blank lines at the bottom of the line
  (default: `TRUE`).

## Value

An [`integer`](https://rdrr.io/r/base/integer.html) vector with the
indexes of the blank lines.

## See also

Other file functions:
[`normalize_hashtags()`](https://danielvartan.github.io/groomr/reference/normalize_hashtags.md),
[`normalize_names()`](https://danielvartan.github.io/groomr/reference/normalize_names.md),
[`peek_csv_file()`](https://danielvartan.github.io/groomr/reference/peek_csv_file.md),
[`remove_blank_line_dups()`](https://danielvartan.github.io/groomr/reference/remove_blank_line_dups.md),
[`replace_in_file()`](https://danielvartan.github.io/groomr/reference/replace_in_file.md),
[`sort_files_by_size()`](https://danielvartan.github.io/groomr/reference/sort_files_by_size.md),
[`split_file()`](https://danielvartan.github.io/groomr/reference/split_file.md),
[`split_files_by_size()`](https://danielvartan.github.io/groomr/reference/split_files_by_size.md),
[`zip_files_by_pattern()`](https://danielvartan.github.io/groomr/reference/zip_files_by_pattern.md)

## Examples

``` r
library(readr)

file <- tempfile()

c("", "line 1", "", "", "line 2", "") |> write_lines(file)

x <- read_lines(file)

identify_blank_line_neighbors(x, pattern = "^line 2$")
#> [1] 4 6
#> [1] 4 6 # Expected
```
