
<!-- README.md is generated from README.Rmd. Please edit that file -->

# JuliaFormulae

<!-- badges: start -->
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
julia_formula(y ~ x)
#> y ~ x
#> <environment: 0x0000017fbe8af610>

julia_formula(y ~ a + I(a ^ 2) + (a || b))
#> y ~ a + protect(a^2) + zerocorr(a | b)
#> <environment: 0x0000017fbe8af610>
```
