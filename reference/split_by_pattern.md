# Split a character vector by a pattern

`split_by_pattern()` allow you to split a character vector considering a
start and end pattern.

## Usage

``` r
split_by_pattern(
  x,
  start_pattern = "^# |^## |---",
  end_pattern = NULL,
  name_list = TRUE,
  include_start = FALSE
)
```

## Arguments

- x:

  A [`character`](https://rdrr.io/r/base/character.html) vector.

- start_pattern:

  (optional) A string with the start pattern (default:
  `"^# |^## |---"`).

- end_pattern:

  (optional) A string with the end pattern. Use `NULL` if there isn't
  one (default: `NULL`).

- name_list:

  (optional) A [`logical`](https://rdrr.io/r/base/logical.html) flag
  indicating if each output item should have a name (default: `TRUE`).

- include_start:

  (optional) A [`logical`](https://rdrr.io/r/base/logical.html) flag
  indicating if the line flagged in the start pattern should be included
  in the split (default: `FALSE`).

## Value

A [list](https://rdrr.io/r/base/list.html) with the split character
vector.

## See also

Other vector functions:
[`cut_vector()`](https://danielvartan.github.io/groomr/reference/cut_vector.md),
[`remove_caps()`](https://danielvartan.github.io/groomr/reference/remove_caps.md),
[`replace_caps()`](https://danielvartan.github.io/groomr/reference/replace_caps.md)

## Examples

``` r
x <- c(
 "# Title 1",
 "## Subtitle 1",
 "Content 1",
 "Content 2",
 "# Title 2",
 "## Subtitle 2",
 "Content 3",
 "Content 4"
 )

 split_by_pattern(
   x,
   start_pattern = "^# |^## |---",
   end_pattern = NULL,
   name_list = TRUE,
   include_start = FALSE
 )
#> $`# Title 1 [line 1]`
#> character(0)
#> 
#> $`## Subtitle 1 [line 2]`
#> [1] "Content 1" "Content 2"
#> 
#> $`# Title 2 [line 5]`
#> character(0)
#> 
#> $`## Subtitle 2 [line 6]`
#> [1] "Content 3" "Content 4"
#> 
```
