#' @keywords internal
use_protect <- function(fm) {
  rrapply(
    fm,
    condition = \(x, .xsiblings) {
      identical(x, quote(I)) &&
        identical(.xsiblings[[1]], quote(I))
    },
    f = \(x) quote(protect),
    how = "replace"
  )
}
