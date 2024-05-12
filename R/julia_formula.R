#' Convert R formula to Julia syntax
#'
#' @param fm A formula object
#'
#' @return A Julia-compatible formula object
#' @export
#'
#' @examples
#' julia_formula(y ~ a)
#'
#' julia_formula(y ~ a + I(a ^ 2) + (a || b))
julia_formula <- function(fm) {
  stopifnot(inherits(fm, "formula"))
  fm <- fm |>
    use_zerocorr() |>
    use_protect() |>
    use_ampersand()
  environment(fm) <- globalenv()
  fm
}
