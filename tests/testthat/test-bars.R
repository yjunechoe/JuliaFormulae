test_that("bars utilities work", {

  expect_null(find_bars(y ~ x))
  expect_formula_eq(
    find_bars(y ~ x + (1 | a)),
    list(quote(1 | a))
  )
  expect_formula_eq(
    find_bars(y ~ x + (1 || a)),
    list(quote(1 || a))
  )

  expect_formula_eq(
    no_bars(y ~ x),
    y ~ x
  )
  expect_formula_eq(
    no_bars(y ~ x + (1 | a)),
    y ~ x
  )
  expect_formula_eq(
    no_bars(y ~ x + (1 | a) + (1 + x || b)),
    y ~ x
  )

  expect_formula_eq(
    no_bars(y ~ 0 + x + (1 | a)),
    y ~ x - 1
  )

})
