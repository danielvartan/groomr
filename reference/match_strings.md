# Approximate string matching

`match_strings()` performs approximate string matching between two
[`character`](https://rdrr.io/r/base/character.html) vectors using the
[`amatch()`](https://rdrr.io/pkg/stringdist/man/amatch.html) function
from the `stringdist` package.

The difference between this function and
[`amatch()`](https://rdrr.io/pkg/stringdist/man/amatch.html) is that
`match_strings()` returns a
[`tibble`](https://tibble.tidyverse.org/reference/tibble.html) with the
original strings and their matched counterparts, while
[`amatch()`](https://rdrr.io/pkg/stringdist/man/amatch.html) returns
only the indices of the matched strings.

## Usage

``` r
match_strings(raw, reference, one_by_one = FALSE, ...)
```

## Arguments

- raw:

  A [`character`](https://rdrr.io/r/base/character.html) vector with the
  data to be matched.

- reference:

  A [`character`](https://rdrr.io/r/base/character.html) vector with the
  reference to match the raw data.

- one_by_one:

  A [`logical`](https://rdrr.io/r/base/logical.html) value indicating
  whether to perform one-by-one matching. If `TRUE`, the function will
  match each string in `raw` to the corresponding string in `reference`.
  If `FALSE`, the function will match all strings in `raw` to all
  strings in `reference` (default: `FALSE`).

- ...:

  Additional arguments to be passed to
  [`amatch()`](https://rdrr.io/pkg/stringdist/man/amatch.html).

## Value

A [`tibble`](https://tibble.tidyverse.org/reference/tibble.html) with
the original strings and their matched counterparts.

## See also

Other match functions:
[`find_closest_match_dbl_2()`](https://danielvartan.github.io/groomr/reference/find_closest_match_dbl_2.md)

## Examples

``` r
raw <- c("sao paulo", "rio de janeiro", "SAO PULO", "RiO de Janiro")
reference <- c("São Paulo", "Rio de Janeiro")
match_strings(raw, reference, maxDist = 1)
#> # A tibble: 4 × 2
#>   key            value         
#>   <chr>          <chr>         
#> 1 sao paulo      São Paulo     
#> 2 rio de janeiro Rio de Janeiro
#> 3 SAO PULO       São Paulo     
#> 4 RiO de Janiro  Rio de Janeiro
```
