expect_formula_eq <- function(x, y) {
  expect_equal(x, y, ignore_formula_env = TRUE)
}

test_that("errors on invalid inputs", {

  expect_formula_eq(y ~ x, julia_formula(y ~ x))

  expect_error(julia_formula(1))

  expect_error(check_symbols(y ~ a.x))
  expect_error(julia_formula(y ~ a.x))

})

test_that("zerocorr", {

  expect_formula_eq(
    julia_formula(y ~ x + 1 | a),
    y ~ x + 1 | a
  )
  expect_formula_eq(
    y ~ x + (1 | a),
    julia_formula(y ~ x + (1 | a))
  )

  expect_error(julia_formula(y ~ x + 1 || a)) # not supported without parens
  expect_formula_eq(
    julia_formula(y ~ x + (1 || a)),
    y ~ x + zerocorr(1 | a)
  )

})

test_that("protect", {

  expect_formula_eq(
    julia_formula(y ~ x + I),
    y ~ x + I
  )

  expect_formula_eq(
    julia_formula(y ~ x + (z | I)),
    y ~ x + (z | I)
  )

  expect_formula_eq(
    julia_formula(y ~ x + (I | z)),
    y ~ x + (I | z)
  )

  expect_formula_eq(
    julia_formula(y ~ x + I(x + 100)),
    y ~ x + protect(x + 100)
  )

})

test_that("interaction &", {

  expect_formula_eq(
    julia_formula(y ~ a:b),
    y ~ a & b
  )

})
