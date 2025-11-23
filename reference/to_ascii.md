# Convert a string to ASCII

`to_ascii()` converts a string to ASCII, removing any non-ASCII
characters.

## Usage

``` r
to_ascii(x, from = "UTF-8")
```

## Arguments

- x:

  A [`character`](https://rdrr.io/r/base/character.html) vector.

- from:

  A [`character`](https://rdrr.io/r/base/character.html) string
  indicating the encoding of the input string, See
  [`iconv`](https://rdrr.io/r/base/iconv.html) to learn more. (default:
  `"UTF-8"`).

## Value

A [`character`](https://rdrr.io/r/base/character.html) vector.

## See also

Other string functions:
[`make_machine_readable()`](https://danielvartan.github.io/groomr/reference/make_machine_readable.md),
[`to_title_case_pt()`](https://danielvartan.github.io/groomr/reference/to_title_case_pt.md)

## Examples

``` r
to_ascii("São Paulo")
#> [1] "Sao Paulo"
#> [1] "Sao Paulo" # Expected

to_ascii("Île-de-France")
#> [1] "Ile-de-France"
#> [1] "Ile-de-France" # Expected
```
