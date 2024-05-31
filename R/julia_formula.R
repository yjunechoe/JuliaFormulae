#' Convert R formula to Julia syntax
#'
#' @param x A formula object
#'
#' @return A Julia-compatible formula object
#' @export
#'
#' @examples
#' julia_formula(y ~ a)
#'
#' julia_formula(y ~ a + I(a ^ 2) + (a || b))
julia_formula <- function(x) {
  stopifnot("`x` must be a formula" = inherits(x, "formula"))
  check_symbols(x)
  x <- x |>
    use_zerocorr() |>
    use_protect() |>
    use_ampersand()
  environment(x) <- globalenv()
  x
}
