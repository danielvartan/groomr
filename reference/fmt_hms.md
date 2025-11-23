# Format time duration strings into `hms` for `gtsummary` objects

`fmt_hms()` formats strings representing time durations
(e.g.,`"1,234.56 secs"`) in
[`gtsummary`](https://www.danieldsjoberg.com/gtsummary/reference/as_gtsummary.html)
objects to a more readable
[`hms`](https://hms.tidyverse.org/reference/hms.html) format (e.g.,
`"00:20:34"`).

## Usage

``` r
fmt_hms(x, big_mark = ",", decimal_mark = ".")
```

## Arguments

- x:

  A
  [`gtsummary`](https://www.danieldsjoberg.com/gtsummary/reference/as_gtsummary.html)
  object.

- big_mark:

  (optional) A [`character`](https://rdrr.io/r/base/character.html)
  string indicating the thousands separator (default: `","`).

- decimal_mark:

  (optional) A [`character`](https://rdrr.io/r/base/character.html)
  string indicating the decimal separator (default: `"."`).

## Value

A
[`gtsummary`](https://www.danieldsjoberg.com/gtsummary/reference/as_gtsummary.html)
object with formatted `hms` strings in all `stat_` columns.

## Examples

``` r
library(dplyr)
#> 
#> Attaching package: ‘dplyr’
#> The following objects are masked from ‘package:stats’:
#> 
#>     filter, lag
#> The following objects are masked from ‘package:base’:
#> 
#>     intersect, setdiff, setequal, union
library(gtsummary)
library(hms)

table <-
  tibble(
    time =
      seq(
        from = parse_hms("00:00:00"),
        to = parse_hms("23:59:59"),
        by = parse_hms("00:00:01")
      ) |>
      sample(1000)
  ) |>
  tbl_summary(
    label = list(time ~ "Time of Day"),
    type = all_continuous() ~ "continuous2",
    statistic = all_continuous2() ~ c("{mean} ({sd})", "{min}, {max}")
  )

table


  

Characteristic
```

**N = 1,000**

Time of Day

  

    Mean (SD)

43,315 secs (24,961)

    Min, Max

6 secs, 86,201 secs

table \|\> fmt_hms()

[TABLE]
