use_ampersand <- function(fm) {
  rrapply(
    fm,
    condition = \(x) identical(x, quote(`:`)),
    f = \(x) quote(`&`),
    how = "replace"
  )
}
