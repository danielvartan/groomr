# Normalize hashtags inside files

`normalize_hashtags()` lower case and remove accents and
non-alphanumeric characters from hashtags.

## Usage

``` r
normalize_hashtags(dir = utils::choose.dir(), tag_line = 1)
```

## Arguments

- dir:

  (optional) a string indicating the directory of the files. This
  function will look up just for files, directories will not be
  affected. (default::
  [`utils::choose.dir()`](https://rdrr.io/r/utils/choose.dir.html)).

- tag_line:

  (optional) a number indicating the line where the tags are in.

## Value

An invisible `NULL`. This function don't aim to return values.

## Tip

    normalize_hashtags(normalizePath(readClipboard(), "/", mustWork = FALSE))

## See also

Other file functions:
[`identify_blank_line_neighbors()`](https://danielvartan.github.io/groomr/reference/identify_blank_line_neighbors.md),
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
file_name <- tempfile(tmpdir = tempfile())
dir_name <- dirname(file_name)
dir.create(dir_name)
file.create(file_name)
#> [1] TRUE

con <- file(file_name, "r+")
data <- c("#tEs43(23)ds #45&$dAAsad-dsade", "", "Test", "")
writeLines(data, con = con)
close(con)

normalize_hashtags(dir_name, tag_line = 1)

con <- file(file_name, "r+")
readLines(con)
#> [1] "#tes4323ds #45daasad-dsade" ""                          
#> [3] "Test"                       ""                          
#> [5] "st"                         ""                          
close(con)
```
