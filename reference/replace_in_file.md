# Replace patterns inside files

`replace_in_file()` searches each line of a file and replaces a specific
pattern when found.

## Usage

``` r
replace_in_file(file, pattern, replacement)
```

## Arguments

- file:

  A [`character`](https://rdrr.io/r/base/character.html) vector
  specifying the path(s) to the file(s) in which to perform the
  replacement.

- pattern:

  A [`character`](https://rdrr.io/r/base/character.html) vector
  specifying the pattern(s) (regular expressions) to search for. If
  multiple patterns are provided, each must correspond to a replacement
  of the same length.

- replacement:

  A [`character`](https://rdrr.io/r/base/character.html) vector
  specifying the replacement value(s) to use. Each element is applied to
  the corresponding pattern via
  [str_replace_all()](https://stringr.tidyverse.org/reference/str_replace.html).

## Value

An invisible `NULL`. This function is used for its side effect.

## See also

Other file functions:
[`identify_blank_line_neighbors()`](https://danielvartan.github.io/groomr/reference/identify_blank_line_neighbors.md),
[`normalize_hashtags()`](https://danielvartan.github.io/groomr/reference/normalize_hashtags.md),
[`normalize_names()`](https://danielvartan.github.io/groomr/reference/normalize_names.md),
[`peek_csv_file()`](https://danielvartan.github.io/groomr/reference/peek_csv_file.md),
[`remove_blank_line_dups()`](https://danielvartan.github.io/groomr/reference/remove_blank_line_dups.md),
[`sort_files_by_size()`](https://danielvartan.github.io/groomr/reference/sort_files_by_size.md),
[`split_file()`](https://danielvartan.github.io/groomr/reference/split_file.md),
[`split_files_by_size()`](https://danielvartan.github.io/groomr/reference/split_files_by_size.md),
[`zip_files_by_pattern()`](https://danielvartan.github.io/groomr/reference/zip_files_by_pattern.md)

## Examples

``` r
file <- tempfile()
file.create(file)
#> [1] TRUE

con <- file(file, "r+")
data <- c("01:00:56", "", "Test", "")
writeLines(data, con = con)
close(con)

replace_in_file(
  file = file,
  pattern = "([0-1][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]",
  replacement = ""
)

con <- file(file, "r+")
readLines(con)
#> [1] ""     ""     "Test" ""    
close(con)
```
