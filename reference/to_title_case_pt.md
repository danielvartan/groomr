# Convert to title case considering Portuguese rules

`to_title_case_pt()` converts a character vector to title case, but
keeping some classes of words in lower case.

In written Portuguese (PT), when converting to title case, it is not
usual to keep in title case some words, like prepositions, conjunctions,
articles and some kinds of pronouns. This function locates those cases
and converts them to lower case.

**(Adapted from the original function `to_title_case()` by José de Jesus
Filho)**

## Usage

``` r
to_title_case_pt(
  x,
  articles = TRUE,
  conjunctions = TRUE,
  oblique_pronouns = TRUE,
  prepositions = TRUE,
  custom_rules = c(`(.)\\bD(el)\\b` = "\\1d\\2")
)
```

## Arguments

- x:

  A [`character`](https://rdrr.io/r/base/character.html) vector.

- articles:

  (optional) A [`logical`](https://rdrr.io/r/base/logical.html) flag
  indicating if articles should be converted (default: `TRUE`).

- conjunctions:

  (optional) A [`logical`](https://rdrr.io/r/base/logical.html) flag
  indicating if conjunctions should be converted (default: `TRUE`).

- oblique_pronouns:

  (optional) A [`logical`](https://rdrr.io/r/base/logical.html) flag
  indicating if oblique pronouns should be converted (default: `TRUE`).

- prepositions:

  (optional) A [`logical`](https://rdrr.io/r/base/logical.html) flag
  indicating if prepositions should be converted (default: `TRUE`).

- custom_rules:

  (optional) A [`character`](https://rdrr.io/r/base/character.html)
  vector with custom rules to be applied. The syntax is
  `c("regex" = "replacement")`. The default is
  `c("(.)\\bD(el)\\b" = "\\1d\\2")`, which converts *Del* to *del*.

## Value

A [`character`](https://rdrr.io/r/base/character.html) vector.

## See also

Other string functions:
[`make_machine_readable()`](https://danielvartan.github.io/groomr/reference/make_machine_readable.md),
[`to_ascii()`](https://danielvartan.github.io/groomr/reference/to_ascii.md)

## Author

José de Jesus Filho

## Examples

``` r
to_title_case_pt("Desterro de Entre Rios")
#> [1] "Desterro de entre Rios"
#> [1] "Desterro de entre Rios" # Expected

to_title_case_pt("São João Del Rei")
#> [1] "São João del Rei"
#> [1] "São João del Rei" # Expected

to_title_case_pt("Sant'ana do Livramento")
#> [1] "Sant'Ana do Livramento"
#> [1] "Sant'Ana do Livramento" # Expected

to_title_case_pt("Alta Floresta d'Oeste")
#> [1] "Alta Floresta D'Oeste"
#> [1] "Alta Floresta D'Oeste" # Expected
```
