# Split files based on their size

`split_files_by_size()` splits a vector of file paths into chunks based
on their size. It is useful for managing large files or datasets that
need to be processed in smaller parts.

The function groups files into chunks so that the total size of files in
each chunk does not exceed the specified limit. If an individual file is
larger than the limit, it will be placed in its own chunk. The files are
sorted by size in decreasing order before chunking.

## Usage

``` r
split_files_by_size(
  files,
  max_size = fs::fs_bytes("1GB"),
  order_by_size = TRUE,
  decreasing_size = FALSE,
  root = NULL
)
```

## Arguments

- files:

  A [`character`](https://rdrr.io/r/base/character.html) vector of file
  paths.

- max_size:

  (optional) An integer or
  [`fs_bytes`](https://fs.r-lib.org/reference/fs_bytes.html) value
  specifying the maximum total size (in bytes) allowed for each chunk
  (default: `fs_bytes("1GB")`).

- order_by_size:

  (optional) A [`logical`](https://rdrr.io/r/base/logical.html) flag
  indicating whether to sort the files by size before chunking (default:
  `TRUE`).

- decreasing_size:

  (optional) A [`logical`](https://rdrr.io/r/base/logical.html) flag
  indicating whether to sort the files in decreasing order of size. This
  is only relevant if `order_by_size` is `TRUE` (default: `FALSE`).

- root:

  (optional) A string specifying the root directory of the files. If
  `NULL`, the function will treat the paths as absolute (default:
  `NULL`).

## Value

A [`list`](https://rdrr.io/r/base/list.html) of character vectors, where
each vector contains file paths that fit within the specified size
limit.

## See also

Other file functions:
[`identify_blank_line_neighbors()`](https://danielvartan.github.io/groomr/reference/identify_blank_line_neighbors.md),
[`normalize_hashtags()`](https://danielvartan.github.io/groomr/reference/normalize_hashtags.md),
[`normalize_names()`](https://danielvartan.github.io/groomr/reference/normalize_names.md),
[`peek_csv_file()`](https://danielvartan.github.io/groomr/reference/peek_csv_file.md),
[`remove_blank_line_dups()`](https://danielvartan.github.io/groomr/reference/remove_blank_line_dups.md),
[`replace_in_file()`](https://danielvartan.github.io/groomr/reference/replace_in_file.md),
[`sort_files_by_size()`](https://danielvartan.github.io/groomr/reference/sort_files_by_size.md),
[`split_file()`](https://danielvartan.github.io/groomr/reference/split_file.md),
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

files <- sort_files_by_size(files, root = dir)
sizes <- file_size(file.path(dir, files)) |> as.character() |> trimws()
names(sizes) <- files
sizes
#> file4.txt file2.txt file5.txt file3.txt file1.txt 
#>    "170K"    "364K"    "435K"    "492K"    "505K" 

total_size <- file_size(file.path(dir, files)) |> sum()
max_size <- fs::fs_bytes(total_size / 2)

max_size
#> 983K

split_files_by_size(
  files,
  max_size = fs_bytes(total_size / 2),
  root = dir
)
#> [[1]]
#> file4.txt file2.txt file5.txt 
#> 
#> [[2]]
#> file3.txt
#> 
#> [[3]]
#> file1.txt
#> 
```
