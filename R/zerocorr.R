#' @keywords internal
use_zerocorr <- function(fm) {
  if (has_bars(fm, "double")) {
    fm <- rrapply(
      fm,
      condition = function(x, .xparents, .xsiblings) {
        is_parens_outside_doublebar(x, .xsiblings) ||
          is_doublebar_inside_parens(x, .xparents, n = 2)
      },
      f = \(x) switch(toString(x), "(" = quote(zerocorr), "||" = quote(`|`)),
      how = "replace"
    )
  }
  fm
}

#' @keywords internal
is_parens_outside_doublebar <- function(x, .xsiblings) {
  identical(x, quote(`(`)) &&
    identical(.xsiblings[[2]][[1]], quote(`||`))
}

#' @keywords internal
is_doublebar_inside_parens <- function(x, .xparents, n = 1) {
  identical(x, quote(`||`)) && {
    object <- evalq(object, parent.frame(n))
    doublebar_parent <- as.integer(utils::head(.xparents, -2))
    list(object[[doublebar_parent]][[1]]) %in% expression(`(`, zerocorr)
  }
}
