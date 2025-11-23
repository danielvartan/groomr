# Make file and directory names machine-readable

`normalize_names()` normalizes file and directory names to make them
machine-readable.

This function uses
[`dir_ls()`](https://fs.r-lib.org/reference/dir_ls.html) to list
files/directories to rename, along with
[`make_machine_readable()`](https://danielvartan.github.io/groomr/reference/make_machine_readable.md)
to rename files.

## Usage

``` r
normalize_names(
  path = clipr::read_clip(),
  regexp = "^README|^OFL|^DESCRIPTION|^Google README",
  invert = TRUE,
  ...
)
```

## Arguments

- path:

  (optional) A [`character`](https://rdrr.io/r/base/character.html)
  string indicating the directory path. Defaults to clipboard content.

- regexp:

  (optional) A [`character`](https://rdrr.io/r/base/character.html)
  string with a regular expression to filter files/directories to rename
  (default: `"^README|^OFL.txt$|^DESCRIPTION|^Google README.txt$"`).

- invert:

  (optional) A [`logical`](https://rdrr.io/r/base/logical.html) flag
  indicating if the regular expression in `regex` should be negated
  (default: `TRUE`).

- ...:

  (optional) Additional arguments to be passed to
  [`dir_ls()`](https://fs.r-lib.org/reference/dir_ls.html) while listing
  files/directories to rename.

## Value

An invisible `NULL`. This function is used for its side effect.

## See also

Other file functions:
[`identify_blank_line_neighbors()`](https://danielvartan.github.io/groomr/reference/identify_blank_line_neighbors.md),
[`normalize_hashtags()`](https://danielvartan.github.io/groomr/reference/normalize_hashtags.md),
[`peek_csv_file()`](https://danielvartan.github.io/groomr/reference/peek_csv_file.md),
[`remove_blank_line_dups()`](https://danielvartan.github.io/groomr/reference/remove_blank_line_dups.md),
[`replace_in_file()`](https://danielvartan.github.io/groomr/reference/replace_in_file.md),
[`sort_files_by_size()`](https://danielvartan.github.io/groomr/reference/sort_files_by_size.md),
[`split_file()`](https://danielvartan.github.io/groomr/reference/split_file.md),
[`split_files_by_size()`](https://danielvartan.github.io/groomr/reference/split_files_by_size.md),
[`zip_files_by_pattern()`](https://danielvartan.github.io/groomr/reference/zip_files_by_pattern.md)

## Examples

``` r
dir <- tempfile("")
dir.create(dir) |> invisible()

file <- tempfile("Test - Test-", tmpdir = dir)
file.create(file) |> invisible()

normalize_names(dir)

list.files(dir)
#> [1] "test-test-1ad55aa81cb0"
#> [1] "test-test-***" # Expected
```
