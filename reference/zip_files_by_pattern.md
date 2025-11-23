# Zip files by pattern

`zip_files_by_pattern()` compresses files by grouping them according to
specified patterns and splitting them into chunks if needed.

## Usage

``` r
zip_files_by_pattern(
  files,
  pattern = NULL,
  prefix = NULL,
  suffix = NULL,
  max_size = fs::fs_bytes("1GB"),
  appendices = NULL,
  root = ".",
  dir = root,
  ...
)
```

## Arguments

- files:

  A [`character`](https://rdrr.io/r/base/character.html) vector
  specifying the paths to the files to be compressed. Only relative
  paths are supported. See
  [`zip()`](https://r-lib.github.io/zip/reference/zip.html) for more
  details.

- pattern:

  (optional) A [`character`](https://rdrr.io/r/base/character.html)
  vector specifying one or more patterns to group files for zipping.
  Files matching each pattern will be aggregated into a single zip file,
  named using the pattern and `suffix`. If `NULL`, each file will be
  zipped individually (default: `NULL`).

- prefix:

  (optional) A string specifying a prefix to be added to the zip file
  names (default: `NULL`).

- suffix:

  (optional) A string specifying a suffix to be added to the zip file
  names (default: `NULL`).

- max_size:

  (optional) An integer or
  [`fs_bytes`](https://fs.r-lib.org/reference/fs_bytes.html) value
  specifying the maximum size of the zip files in bytes. The function
  will try to split the files into chunks if the total size of the files
  exceeds this value. If an individual file is larger than the limit, it
  will be placed in its own chunk. Use `Inf` to disable chunking
  (default:
  [`fs_bytes("1GB")`](https://fs.r-lib.org/reference/fs_bytes.html)).

- appendices:

  (optional) A [`character`](https://rdrr.io/r/base/character.html)
  vector specifying additional files to be included in each zip file.
  Like in `files`, only relative paths are supported (default: `NULL`).

- root:

  (optional) A string specifying the root directory of the files. See
  [`zip()`](https://r-lib.github.io/zip/reference/zip.html) for more
  details (default: `.`).

- dir:

  (optional) A string specifying the directory where the zip files must
  be saved (default: `root`).

- ...:

  Additional arguments passed to the
  [`zip`](https://r-lib.github.io/zip/reference/zip.html) function.

## Value

An invisible [`character`](https://rdrr.io/r/base/character.html) vector
containing the paths to the created zip files.

## Details

This function uses the
[`zip`](https://r-lib.github.io/zip/reference/zip.html) package for
cross-platform compatibility and efficient file compression.

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
[`split_files_by_size()`](https://danielvartan.github.io/groomr/reference/split_files_by_size.md)

## Examples

``` r
files <- c("test_1_1.txt", "test_1_2.txt", "test_2.txt")
appendices <- c("appendix.txt")

txt_dir <- tempfile("dir")
zip_dir <- tempfile("dir")
dir.create(txt_dir)
dir.create(zip_dir)

for (i in files) file.create(file.path(txt_dir, i))
for (i in appendices) file.create(file.path(txt_dir, i))

list.files(txt_dir)
#> [1] "appendix.txt" "test_1_1.txt" "test_1_2.txt" "test_2.txt"  
#> [1] "appendix.txt" "test_1_1.txt" "test_1_2.txt" "test_2.txt" # Expected

zip_files_by_pattern(
  files = files,
  pattern = c("test_1", "test_2"),
  appendices = appendices,
  root = txt_dir,
  dir = zip_dir
)
#> ℹ Zipping files using 2 patterns: test_1 and test_2.
#> ℹ Zipping 2 files matching the pattern test_1 into 1 chunk.
#> ℹ Zipping 1 file matching the pattern test_2 into 1 chunk.

list.files(zip_dir)
#> [1] "test_1.zip" "test_2.zip"
#> [1] "test_1.zip" "test_2.zip" # Expected

unzip_dir <- tempfile("dir")
dir.create(unzip_dir)

library(zip)
#> 
#> Attaching package: ‘zip’
#> The following objects are masked from ‘package:utils’:
#> 
#>     unzip, zip

for (i in file.path(zip_dir, list.files(zip_dir))) {
  unzip(i, exdir = unzip_dir)
}

list.files(unzip_dir)
#> [1] "appendix.txt" "test_1_1.txt" "test_1_2.txt" "test_2.txt"  
#> [1] "appendix.txt" "test_1_1.txt" "test_1_2.txt" "test_2.txt" # Expected
```
