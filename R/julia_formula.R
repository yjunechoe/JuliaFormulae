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
  stopifnot(
    "`x` must be formula or string" = inherits(x, "formula") || is.character(x)
  )
  if (is.character(x)) {
    x <- stats::as.formula(x, env = parent.frame())
  }
  check_symbols(x)
  e <- environment(x)
  x <- x |>
    use_zerocorr() |>
    use_protect() |>
    use_ampersand()
  environment(x) <- e
  x
}
