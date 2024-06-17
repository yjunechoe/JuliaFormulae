#' Utilities for formula random effects structure
#'
#' @param x A formula object
#' @param type One of `"both"`, `"single"`, or `"double"`. Defaults to `"both"`.
#'
#' @return A modified formula object
#' @export
#'
#' @examples
#' has_bars(y ~ x)
#' has_bars(y ~ x + (x | g))
#' has_bars(y ~ x + (x | g), type = "double")
#'
#' find_bars(y ~ x)
#' find_bars(y ~ x + (x | g))
#'
#' no_bars(y ~ x)
#' no_bars(y ~ x + (x | g))
has_bars <- function(x, type = c("both", "single", "double")) {
  type <- match.arg(type)
  bars <- switch(type, both = c("|", "||"), single = c("|"), double = "||")
  any(bars %in% all.names(x))
}

#' @rdname has_bars
#' @export
find_bars <- function(x) {
  if (has_bars(x)) {
    rrapply(
      x,
      classes = "language",
      condition = \(x) list(x[[1]]) %in% expression(`|`, `||`),
      how = "flatten"
    )
  } else {
    NULL
  }
}

#' @rdname has_bars
#' @export
no_bars <- function(x) {
  if (has_bars(x)) {
    intercept <- attr(stats::terms(x), "intercept")
    x <- rrapply(
      x,
      classes = "language",
      condition = \(x) {
        identical(x[[1]], quote(`(`)) &&
          list(x[[2]][[1]]) %in% expression(`|`, `||`)
      },
      f = \(x) intercept,
      how = "replace"
    )
    x <- stats::update(x, ~ .)
    environment(x) <- globalenv()
  }
  x
}
