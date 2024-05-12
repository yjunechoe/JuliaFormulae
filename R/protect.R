use_protect <- function(fm) {
  rrapply(
    fm,
    condition = \(x) identical(x, quote(I)),
    f = \(x) quote(protect),
    how = "replace"
  )
}
