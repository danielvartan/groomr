# Cut a vector into segments

`cut_vector()` splits a vector into segments at specified cutting points
or indexes. You can define the cuts either by providing explicit index
positions or by specifying the number of segments.

Additional options allow you to control whether cuts occur between or at
index values, and whether to remove elements at the start or end of the
resulting segments.

## Usage

``` r
cut_vector(
  x,
  index = NULL,
  n = NULL,
  between = NULL,
  rm_start = FALSE,
  rm_end = FALSE,
  round_fun = floor
)
```

## Arguments

- x:

  An
  [atomic](https://mllg.github.io/checkmate/reference/checkAtomicVector.html)
  vector.

- index:

  (optional) An
  [integerish](https://mllg.github.io/checkmate/reference/checkIntegerish.html)
  `numeric` object with the indexes/cutting points (default: `NULL`).

- n:

  (optional) An
  [integerish](https://mllg.github.io/checkmate/reference/checkIntegerish.html)
  number specifying the number of segments to cut the vector into. If
  `n` is specified, the `index` argument is ignored (default: `NULL`).

- between:

  (optional) A string specifying the direction of the cut: `"left"` or
  `"right"`. Use this argument only when the cut should be performed
  between the index values (default: `NULL`).

- rm_start:

  (optional) a [`logical`](https://rdrr.io/r/base/logical.html) flag
  indicating if the start element of the cut must be removed (default:
  `FALSE`).

- rm_end:

  (optional) a [`logical`](https://rdrr.io/r/base/logical.html) flag
  indicating if the end element of the cut must be removed (default:
  `FALSE`).

- round_fun:

  (optional) A function to round the number of elements in when cutting
  using `n` (default: `floor`).

## Value

A [`list`](https://rdrr.io/r/base/list.html) object with the cut pieces
as elements.

## Details

`cut_vector()` can perform different kinds of cuts. Here are some
examples.

### Cutting by index values

    cut_vector(seq(10), c(3, 9))

       cut         cut
        |           |
    1 2 3 4 5 6 7 8 9 10

    Element 1: 1, 2
    Element 2: 4, 5, 6, 7, 8
    Element 3: 10

### Cutting between index values

    cut_vector(seq(10), c(3, 9), between = "left")

      cut         cut
       |           |
    1 2 3 4 5 6 7 8 9 10

    Element 1: 1, 2
    Element 2: 3, 4, 5, 6, 7, 8
    Element 3: 9, 10

    cut_vector(seq(10), c(3, 9), between = "right")

        cut         cut
         |           |
    1 2 3 4 5 6 7 8 9 10

    Element 1: 1, 2, 3
    Element 2: 4, 5, 6, 7, 8, 9
    Element 3: 10

### Cutting by number of segments

    cut_vector(seq(10), n = 3, round_fun = floor)

        cut   cut
         |     |
    1 2 3 4 5 6 7 8 9 10

    Element 1: 1, 2, 3
    Element 2: 4, 5, 6
    Element 3: 7, 8, 9, 10

    cut_vector(seq(10), n = 3, round_fun = ceiling)

          cut     cut
           |       |
    1 2 3 4 5 6 7 8 9 10

    Element 1: 1, 2, 3, 4
    Element 2: 5, 6, 7, 8
    Element 3: 9, 10

### Removing tips

    cut_vector(seq(20), c(7, 16), rm_start = TRUE, rm_end = TRUE)

               cut                      cut
                |                        |
    1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
    |---------|                            |---------|
     start tip                               end tip

    Element 1: 8, 9, 10, 11, 12, 13, 14, 15

## See also

Other vector functions:
[`remove_caps()`](https://danielvartan.github.io/groomr/reference/remove_caps.md),
[`replace_caps()`](https://danielvartan.github.io/groomr/reference/replace_caps.md),
[`split_by_pattern()`](https://danielvartan.github.io/groomr/reference/split_by_pattern.md)

## Examples

``` r
## Cutting by index values

cut_vector(seq(10), c(3, 9))
#> [[1]]
#> [1] 1 2
#> 
#> [[2]]
#> [1] 4 5 6 7 8
#> 
#> [[3]]
#> [1] 10
#> 

## Cutting between index values

cut_vector(seq(10), c(3, 9), between = "left")
#> [[1]]
#> [1] 1 2
#> 
#> [[2]]
#> [1] 3 4 5 6 7 8
#> 
#> [[3]]
#> [1]  9 10
#> 

cut_vector(seq(10), c(3, 9), between = "right")
#> [[1]]
#> [1] 1 2 3
#> 
#> [[2]]
#> [1] 4 5 6 7 8 9
#> 
#> [[3]]
#> [1] 10
#> 

## Removing start or end tips

cut_vector(seq(10), c(3, 9), rm_start = TRUE)
#> [[1]]
#> [1] 4 5 6 7 8
#> 
#> [[2]]
#> [1] 10
#> 

cut_vector(seq(10), c(3, 9), rm_end = TRUE)
#> [[1]]
#> [1] 1 2
#> 
#> [[2]]
#> [1] 4 5 6 7 8
#> 
```
