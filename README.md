
<!-- README.md is generated from README.Rmd. Please edit that file -->

# JuliaFormulae

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/yjunechoe/JuliaFormulae/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/yjunechoe/JuliaFormulae/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/yjunechoe/JuliaFormulae/branch/main/graph/badge.svg)](https://app.codecov.io/gh/yjunechoe/JuliaFormulae?branch=main)
<!-- badges: end -->

``` r
# install.packages("devtools")
devtools::install_github("yjunechoe/JuliaFormulae")
```

## Supported conversions

- Zero correlation: `(term || group)` -\> `zerocorr()`
- Protection: e.g., `I(term^2)` -\> `protect(term^2)`
- Interaction terms: `a:b` -\> `a&b`

## Example

``` r
library(JuliaFormulae)
```

``` r
julia_formula(y ~ a + I(a^2) + b + a:b  + (a || g) + (b | g))
#> y ~ a + protect(a^2) + b + (a & b) + zerocorr(a | g) + (b | g)
```
