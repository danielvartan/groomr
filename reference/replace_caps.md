# Replace the first and/or last element of a vector

`replace_caps()` replaces the first and/or last element of a vector.

## Usage

``` r
replace_caps(x, replacement = NA, start = TRUE, end = TRUE)
```

## Arguments

- x:

  An [`atomic`](https://rdrr.io/r/base/is.recursive.html) vector.

- replacement:

  (optional) A value to replace the first and/or last element of `x`
  with (default: `NA`).

- start:

  (optional) A [`logical`](https://rdrr.io/r/base/logical.html) flag
  indicating whether to remove the first element of `x` (default:
  `TRUE`).

- end:

  (optional) A [`logical`](https://rdrr.io/r/base/logical.html) flag
  indicating whether to remove the last element of `x` (default:
  `TRUE`).

## Value

The same vector `x` with the first and/or last element replaced.

## See also

Other vector functions:
[`cut_vector()`](https://danielvartan.github.io/groomr/reference/cut_vector.md),
[`remove_caps()`](https://danielvartan.github.io/groomr/reference/remove_caps.md),
[`split_by_pattern()`](https://danielvartan.github.io/groomr/reference/split_by_pattern.md)

## Examples

``` r
replace_caps(c("a", "b", "c"))
#> [1] NA  "b" NA 
#> [1] NA "b" NA # Expected

replace_caps(c("a", "b", "c"), start = FALSE)
#> [1] "a" "b" NA 
#> [1] "a" "b" NA # Expected

replace_caps(c("a", "b", "c"), end = FALSE)
#> [1] NA  "b" "c"
#> [1] "b" "c" NA # Expected
```
