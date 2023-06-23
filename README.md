
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rc.template

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/giperbio/rc.template/workflows/R-CMD-check/badge.svg)](https://github.com/giperbio/rc.template/actions)
[![Codecov test
coverage](https://codecov.io/gh/giperbio/rc.template/branch/main/graph/badge.svg)](https://app.codecov.io/gh/giperbio/rc.template?branch=main)
[![License:
MIT](https://img.shields.io/badge/license-MIT-green)](https://choosealicense.com/licenses/mit/)
<!-- badges: end -->

> This is a template repository for research compendiums.

## Overview

`rc.template` is an R package with the research compendium of the
Interdisciplinary Research Group on Biological Rhythms (GIPERBIO)
\[INSERT NAME OF THE PROJECT\] project. Its aim is to facilitate the
research work and to improve reproducibility in research.

The assemble of this package was inspired by Ben Marwick, Carl Boettiger
& Lincoln Mullen’s article [Packaging Data Analytical Work Reproducibly
Using R (and Friends)](https://doi.org/10.1080/00031305.2017.1375986).

## Installation

You can install `rc.template` with:

``` r
# install.packages("remotes")
remotes::install_github("giperbio/rc.template")
```

We don’t intend to publish this package on CRAN.

## Encryption

Some data files were encrypted in order to preserve the anonymity of the
study participants. You can identify those files by the `.encryptr.bin`
extension. Contact the authors if you need access to them.

## License

[![License:
MIT](https://img.shields.io/badge/license-MIT-green)](https://opensource.org/license/mit/)

`rc.template` code is released under the [MIT
license](https://opensource.org/license/mit/). Please note that
`rc.template` data are proprietary and cannot be shared without the
authors’ permission.

## Citation

If you use `rc.template` in your research, please consider citing it. We
put a lot of work to build and maintain a free and open-source R
package. You can find the citation below.

``` r
citation("rc.template")
#> 
#> To cite {rc.template} in publications use:
#> 
#>   Vartanian, D. (2023). {rc.template}: research compendium of the
#>   GIPERBIO [INSERT NAME OF THE PROJECT] project. R package version
#>   0.0.0.9000. https://giperbio.github.io/rc.template/
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Unpublished{,
#>     title = {{rc.template}: research compendium of the GIPERBIO [INSERT NAME OF THE PROJECT] project},
#>     author = {Daniel Vartanian},
#>     year = {2023},
#>     url = {https://giperbio.github.io/rc.template/},
#>     note = {R package version 0.0.0.9000},
#>   }
```
