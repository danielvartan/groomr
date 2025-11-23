# Make a string machine-readable

`make_machine_readable()` makes a string machine-readable by converting
it to lowercase, removing special characters, and replacing spaces with
hyphens.

This function follows the naming conventions from the [Tidyverse Style
Guide](https://style.tidyverse.org/files.html#names).

## Usage

``` r
make_machine_readable(x)
```

## Arguments

- x:

  A [`character`](https://rdrr.io/r/base/character.html) vector.

## Value

A [`character`](https://rdrr.io/r/base/character.html) vector with
machine-readable names.

## See also

Other string functions:
[`to_ascii()`](https://danielvartan.github.io/groomr/reference/to_ascii.md),
[`to_title_case_pt()`](https://danielvartan.github.io/groomr/reference/to_title_case_pt.md)

## Examples

``` r
make_machine_readable("Test - Test ")
#> [1] "test-test"
#> [1] "test-test" # Expected

make_machine_readable("!@#TéSt$$%^")
#> [1] "test"
#> [1] "test" # Expected

make_machine_readable("TeSt_test.txt")
#> [1] "test-test.txt"
#> [1] "test-test.txt" # Expected
```
