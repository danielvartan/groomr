# Sort files based on their size

`sort_files_by_size()` sorts a vector of file paths based on their size.
It is useful for organizing files in a directory or for preparing files
for processing.

## Usage

``` r
sort_files_by_size(files, decreasing = FALSE, root = NULL)
```

## Arguments

- files:

  A [`character`](https://rdrr.io/r/base/character.html) vector of file
  paths.

- decreasing:

  (optional) A [`logical`](https://rdrr.io/r/base/logical.html) flag
  indicating whether to sort the files in decreasing order of size
  (default: `FALSE`).

- root:

  (optional) A string specifying the root directory of the files. If
  `NULL`, the function will treat the paths as absolute (default:
  `NULL`).

## Value

A [`character`](https://rdrr.io/r/base/character.html) vectors with the
file paths sorted by size.

## See also

Other file functions:
[`identify_blank_line_neighbors()`](https://danielvartan.github.io/groomr/reference/identify_blank_line_neighbors.md),
[`normalize_hashtags()`](https://danielvartan.github.io/groomr/reference/normalize_hashtags.md),
[`normalize_names()`](https://danielvartan.github.io/groomr/reference/normalize_names.md),
[`peek_csv_file()`](https://danielvartan.github.io/groomr/reference/peek_csv_file.md),
[`remove_blank_line_dups()`](https://danielvartan.github.io/groomr/reference/remove_blank_line_dups.md),
[`replace_in_file()`](https://danielvartan.github.io/groomr/reference/replace_in_file.md),
[`split_file()`](https://danielvartan.github.io/groomr/reference/split_file.md),
[`split_files_by_size()`](https://danielvartan.github.io/groomr/reference/split_files_by_size.md),
[`zip_files_by_pattern()`](https://danielvartan.github.io/groomr/reference/zip_files_by_pattern.md)

## Examples

``` r
library(fs)
library(readr)

files <- c("file1.txt", "file2.txt", "file3.txt", "file4.txt", "file5.txt")

dir <- tempfile("dir")
dir.create(dir)

for (i in files) {
  write_lines(rep(letters, sample(1000:10000, 1)), file.path(dir, i))
}

sizes <- file_size(file.path(dir, files)) |> as.character() |> trimws()
names(sizes) <- files
sizes
#> file1.txt file2.txt file3.txt file4.txt file5.txt 
#>    "459K"    "356K"    "308K"    "375K"    "301K" 

sort_files_by_size(files, root = dir)
#> file5.txt file3.txt file2.txt file4.txt file1.txt 
```
