# Find closest matches between numeric vectors

`find_closest_match_dbl_2()` identifies the closest matches between two
[`numeric`](https://rdrr.io/r/base/numeric.html) vectors.

Matches are determined by calculating the absolute differences between
reference and target values. A user-defined tolerance sets the maximum
acceptable difference for a match. The closest match is the pair with
the smallest absolute difference that falls within the specified
tolerance.

## Usage

``` r
find_closest_match_dbl_2(x, y, x_ref, y_ref, tol = 0.05)
```

## Arguments

- x:

  A [`numeric`](https://rdrr.io/r/base/numeric.html) vector.

- y:

  A [`numeric`](https://rdrr.io/r/base/numeric.html) vector.

- x_ref:

  A [`numeric`](https://rdrr.io/r/base/numeric.html) vector with
  reference values for `x`.

- y_ref:

  A [`numeric`](https://rdrr.io/r/base/numeric.html) vector with
  reference values for `y`.

- tol:

  (optional) A [`numeric`](https://rdrr.io/r/base/numeric.html) value
  that sets the maximum acceptable difference for a match (default:
  `0.05`).

## Value

If any value was found, returns the index of the closest match in
`x_ref`/`y_ref`. Else, returns `NA`.

## See also

Other match functions:
[`match_strings()`](https://danielvartan.github.io/groomr/reference/match_strings.md)

## Examples

``` r
x <- c(1, 2, 3, 4, 5)
y <- c(1.1, 2.1, 3.1, 4.1, 5.1)
x_ref <- c(5, 1, 3, 4, 2)
y_ref <- c(5, 1, 3, 4, 2)
tol <- 0.5

find_closest_match_dbl_2(x, y, x_ref, y_ref, tol)
#> [1] 2 5 3 4 1
#> [1] 2 5 3 4 1 # Expected
```
