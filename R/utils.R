formula_parse_data <- function(fm) {
  getParseData(parse(text = deparse1(fm)))
}

formula_symbols <- function(fm) {
  parsedata <- formula_parse_data(fm)
  unique(parsedata[parsedata$token == "SYMBOL", "text"])
}

check_symbols <- function(fm) {
  invalid <- grep("[.]", formula_symbols(fm), value = TRUE)
  if (length(invalid) > 0) {
    stop("Invalid Julia symbols: ", toString(invalid), call. = FALSE)
  }
}
