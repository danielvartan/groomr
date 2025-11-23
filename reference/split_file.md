# Split a file into parts

`split_file()` split a single file into `n` parts.

## Usage

``` r
split_file(file = file.choose(), n, dir = dirname(file), has_header = FALSE)
```

## Arguments

- file:

  (optional) A string indicating the file path (default::
  [`file.choose()`](https://rdrr.io/r/base/file.choose.html)).

- n:

  An integer number indicating the amount of parts to split the file.

- dir:

  (optional) A string indicating the directory where to write the file
  parts. (default:: `dirname(file)`).

- has_header:

  (optional) A [`logical`](https://rdrr.io/r/base/logical.html) flag
  indicating if the file has a header (e.g., a CSV file). If `TRUE`, the
  header will be repeated as the first line in every part (default:
  `FALSE`).

## Value

An invisible `NULL`. This function is used for its side effect.

## See also

Other file functions:
[`identify_blank_line_neighbors()`](https://danielvartan.github.io/groomr/reference/identify_blank_line_neighbors.md),
[`normalize_hashtags()`](https://danielvartan.github.io/groomr/reference/normalize_hashtags.md),
[`normalize_names()`](https://danielvartan.github.io/groomr/reference/normalize_names.md),
[`peek_csv_file()`](https://danielvartan.github.io/groomr/reference/peek_csv_file.md),
[`remove_blank_line_dups()`](https://danielvartan.github.io/groomr/reference/remove_blank_line_dups.md),
[`replace_in_file()`](https://danielvartan.github.io/groomr/reference/replace_in_file.md),
[`sort_files_by_size()`](https://danielvartan.github.io/groomr/reference/sort_files_by_size.md),
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
data <- as.character(0:100)
writeLines(data, con = con)
close(con)

split_file(file = file_name, n = 3)

con <- file(file_name, "r+")
readLines(con)
#>   [1] "0"   "1"   "2"   "3"   "4"   "5"   "6"   "7"   "8"   "9"   "10"  "11" 
#>  [13] "12"  "13"  "14"  "15"  "16"  "17"  "18"  "19"  "20"  "21"  "22"  "23" 
#>  [25] "24"  "25"  "26"  "27"  "28"  "29"  "30"  "31"  "32"  "33"  "34"  "35" 
#>  [37] "36"  "37"  "38"  "39"  "40"  "41"  "42"  "43"  "44"  "45"  "46"  "47" 
#>  [49] "48"  "49"  "50"  "51"  "52"  "53"  "54"  "55"  "56"  "57"  "58"  "59" 
#>  [61] "60"  "61"  "62"  "63"  "64"  "65"  "66"  "67"  "68"  "69"  "70"  "71" 
#>  [73] "72"  "73"  "74"  "75"  "76"  "77"  "78"  "79"  "80"  "81"  "82"  "83" 
#>  [85] "84"  "85"  "86"  "87"  "88"  "89"  "90"  "91"  "92"  "93"  "94"  "95" 
#>  [97] "96"  "97"  "98"  "99"  "100"
close(con)

con <- file(paste0(file_name, "_part-1"), "r+")
readLines(con)
#>  [1] "0"  "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" "11" "12" "13" "14"
#> [16] "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26" "27" "28" "29"
#> [31] "30" "31" "32"
close(con)

con <- file(paste0(file_name, "_part-2"), "r+")
readLines(con)
#>  [1] "33" "34" "35" "36" "37" "38" "39" "40" "41" "42" "43" "44" "45" "46" "47"
#> [16] "48" "49" "50" "51" "52" "53" "54" "55" "56" "57" "58" "59" "60" "61" "62"
#> [31] "63" "64" "65"
close(con)

con <- file(paste0(file_name, "_part-3"), "r+")
readLines(con)
#>  [1] "66"  "67"  "68"  "69"  "70"  "71"  "72"  "73"  "74"  "75"  "76"  "77" 
#> [13] "78"  "79"  "80"  "81"  "82"  "83"  "84"  "85"  "86"  "87"  "88"  "89" 
#> [25] "90"  "91"  "92"  "93"  "94"  "95"  "96"  "97"  "98"  "99"  "100"
close(con)
```
