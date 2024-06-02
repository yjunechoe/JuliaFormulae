expect_formula_eq <- function(x, y) {
  expect_equal(x, y, ignore_formula_env = TRUE)
}
