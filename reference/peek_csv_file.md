# Peek the dimensions of a CSV file

`peek_csv_file()` reads a CSV file and provides a summary of its
contents, including the number of columns, rows, and cells. It is useful
for quickly inspecting the structure of a CSV file without loading the
entire dataset into memory.

## Usage

``` r
peek_csv_file(file, delim = ",", skip = 0, has_header = TRUE)
```

## Arguments

- file:

  A string specifying the path to the file.

- delim:

  A string specifying the delimiter used in the file (default: `","`).

- skip:

  An [`integer`](https://rdrr.io/r/base/integer.html) specifying the
  number of lines to skip before reading the file (default: `0`).

- has_header:

  A [`logical`](https://rdrr.io/r/base/logical.html) flag indicating
  whether the file has a header row. If `TRUE`, the first row is treated
  as column names (default: `TRUE`).

## Value

An invisible `NULL`. This function is used for its side effect.

## See also

Other file functions:
[`identify_blank_line_neighbors()`](https://danielvartan.github.io/groomr/reference/identify_blank_line_neighbors.md),
[`normalize_hashtags()`](https://danielvartan.github.io/groomr/reference/normalize_hashtags.md),
[`normalize_names()`](https://danielvartan.github.io/groomr/reference/normalize_names.md),
[`remove_blank_line_dups()`](https://danielvartan.github.io/groomr/reference/remove_blank_line_dups.md),
[`replace_in_file()`](https://danielvartan.github.io/groomr/reference/replace_in_file.md),
[`sort_files_by_size()`](https://danielvartan.github.io/groomr/reference/sort_files_by_size.md),
[`split_file()`](https://danielvartan.github.io/groomr/reference/split_file.md),
[`split_files_by_size()`](https://danielvartan.github.io/groomr/reference/split_files_by_size.md),
[`zip_files_by_pattern()`](https://danielvartan.github.io/groomr/reference/zip_files_by_pattern.md)

## Examples

``` r
library(datasets)
library(readr)

file <- tempfile()

write_csv(mtcars, file)

peek_csv_file(file)
#> The file has 11 columns, 32 rows, and 352 cells.
#> The file has 11 columns, 32 rows*, and 352 cells. # Expected
```
