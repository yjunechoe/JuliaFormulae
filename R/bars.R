has_bar <- function(fm, bar = c("both", "single", "double")) {
  bar <- match.arg(bar)
  bars <- switch(bar, both = c("|", "||"), single = c("|"), double = "||")
  all(bars %in% all.names(fm))
}

find_bars <- function(fm) {
  if (has_bar(fm)) {
    rrapply(
      fm,
      class = "language",
      condition = \(x) list(x[[1]]) %in% expression(`|`, `||`),
      how = "flatten"
    )
  }
}

no_bars <- function(fm) {
  if (has_bar(fm)) {
    fm <- rrapply(
      y ~ fm,
      class = "language",
      condition = \(x) {
        identical(x[[1]], quote(`(`)) &&
          list(x[[2]][[1]]) %in% expression(`|`, `||`)
      },
      f = \(x) 0,
      how = "replace"
    )
    fm <- update(fm, ~ .)
    environment(fm) <- globalenv()
  }
  fm
}
