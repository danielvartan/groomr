# Remove blank line duplicates from a file

This function removes blank line duplicates (e.g., a `""` line, followed
by another `""` line) from a file.

It can also remove blank lines at the top or bottom of the file, and
remove blank lines around a text block.

## Usage

``` r
remove_blank_line_dups(
  file,
  remove_caps = TRUE,
  block_fix = TRUE,
  block_start_pattern = "<!-- badges: start -->",
  block_end_pattern = "<!-- badges: end -->"
)
```

## Arguments

- file:

  A string indicating a file path.

- remove_caps:

  A [`logical`](https://rdrr.io/r/base/logical.html) flag indicating if
  the function should remove blank lines at the top and bottom of the
  file.

- block_fix:

  A [`logical`](https://rdrr.io/r/base/logical.html) flag indicating if
  the function should fix blank lines around a text block

- block_start_pattern:

  A string indicating the start of the text block.

- block_end_pattern:

  A string indicating the end of text block.

## Value

An invisible `NULL`. This function don't aim to return values.

## See also

Other file functions:
[`identify_blank_line_neighbors()`](https://danielvartan.github.io/groomr/reference/identify_blank_line_neighbors.md),
[`normalize_hashtags()`](https://danielvartan.github.io/groomr/reference/normalize_hashtags.md),
[`normalize_names()`](https://danielvartan.github.io/groomr/reference/normalize_names.md),
[`peek_csv_file()`](https://danielvartan.github.io/groomr/reference/peek_csv_file.md),
[`replace_in_file()`](https://danielvartan.github.io/groomr/reference/replace_in_file.md),
[`sort_files_by_size()`](https://danielvartan.github.io/groomr/reference/sort_files_by_size.md),
[`split_file()`](https://danielvartan.github.io/groomr/reference/split_file.md),
[`split_files_by_size()`](https://danielvartan.github.io/groomr/reference/split_files_by_size.md),
[`zip_files_by_pattern()`](https://danielvartan.github.io/groomr/reference/zip_files_by_pattern.md)

## Examples

``` r
file <- tempfile()
writeLines(c("", "line 1", "", "", "line 2", "", "", "line 3", ""), file)

remove_blank_line_dups(file)

readLines(file)
#> [1] "line 1" ""       "line 2" ""       "line 3"
#> [1] "line 1" ""       "line 2" ""       "line 3" # Expected
```
