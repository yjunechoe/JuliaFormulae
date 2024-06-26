#' @keywords internal
formula_parse_data <- function(fm) {
  utils::getParseData(parse(text = deparse1(fm), keep.source = TRUE))
}

#' @keywords internal
formula_symbols <- function(fm) {
  parsedata <- formula_parse_data(fm)
  unique(parsedata[parsedata$token == "SYMBOL", "text"])
}

#' @keywords internal
check_symbols <- function(fm) {
  invalid <- grep("[.]", formula_symbols(fm), value = TRUE)
  if (length(invalid) > 0) {
    stop("Invalid Julia symbol(s): ", toString(invalid), call. = FALSE)
  }
}
