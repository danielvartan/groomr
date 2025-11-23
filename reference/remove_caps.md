# Remove the first and/or last element of a vector

`remove_caps()` removes the first and/or last element of a vector.

## Usage

``` r
remove_caps(x, start = TRUE, end = TRUE)
```

## Arguments

- x:

  An [`atomic`](https://rdrr.io/r/base/is.recursive.html) vector.

- start:

  (optional) A [`logical`](https://rdrr.io/r/base/logical.html) flag
  indicating whether to remove the first element of `x` (default:
  `TRUE`).

- end:

  (optional) A [`logical`](https://rdrr.io/r/base/logical.html) flag
  indicating whether to remove the last element of `x` (default:
  `TRUE`).

## Value

The same vector `x` with the first and/or last element removed.

## See also

Other vector functions:
[`cut_vector()`](https://danielvartan.github.io/groomr/reference/cut_vector.md),
[`replace_caps()`](https://danielvartan.github.io/groomr/reference/replace_caps.md),
[`split_by_pattern()`](https://danielvartan.github.io/groomr/reference/split_by_pattern.md)

## Examples

``` r
remove_caps(c("a", "b", "c"))
#> [1] "b"
#> [1] "b" # Expected

remove_caps(c("a", "b", "c"), start = FALSE)
#> [1] "a" "b"
#> [1] "a" "b" # Expected

remove_caps(c("a", "b", "c"), end = FALSE)
#> [1] "b" "c"
#> [1] "b" "c" # Expected
```
