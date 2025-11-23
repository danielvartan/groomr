# Parse HTML tables

`parse_html_table()` parses a HTML table to a
[`tibble`](https://tibble.tidyverse.org/reference/tibble.html).

## Usage

``` r
parse_html_table(x = clipr::read_clip())
```

## Arguments

- x:

  (optional) A [`character`](https://rdrr.io/r/base/character.html)
  vector with HTML code.

## Value

A [`tibble`](https://tibble.tidyverse.org/reference/tibble.html) with
the parsed HTML table.

## Examples

``` r
x <- c(
  "<table>",
  "  <tr>",
  "    <th>Name</th>",
  "    <th>Age</th>",
  "  </tr>",
  "  <tr>",
  "    <td>Alice</td>",
  "    <td>30</td>",
  "  </tr>",
  "  <tr>",
  "    <td>Bob</td>",
  "    <td>25</td>",
  "  </tr>",
  "</table>"
)

x |> parse_html_table()
#> # A tibble: 2 × 2
#>   Name    Age
#>   <chr> <int>
#> 1 Alice    30
#> 2 Bob      25
```
