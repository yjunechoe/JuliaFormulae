
<!-- README.md is generated from README.Rmd. Please edit that file -->

# JuliaFormulae

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

``` r
# install.packages("devtools")
devtools::install_github("yjunechoe/JuliaFormulae")
```

## Example

``` r
library(JuliaFormulae)
```

``` r
julia_formula(y ~ a + I(a^2) + b + a:b  + (a || g) + (b | g))
#> y ~ a + protect(a^2) + b + (a & b) + zerocorr(a | g) + (b | g)
```

## Supported conversions

- Zero correlation: `(term || group)` -\> `zerocorr()`
- Protection: e.g., `I(term^2)` -\> `protect(term^2)`
- Interaction terms: `a:b` -\> `a&b`

TBD: - `Symbol()` protection for invalid variable names
