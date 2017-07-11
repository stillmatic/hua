#' Convert text to sentence case
#'
#' @param x phrase/word that should only have 1 uppercase
#'
#' @return sentence case output
#' @export
#'
#' @examples
#' sentence_case("SDklfJSKLDF")
#' sentence_case("OMG")
#' sentence_case("This is OKAY")
sentence_case <- function(x) {
    stringr::str_to_title(x) # lol
    # sub("(.)", ("\\U\\1"), tolower(x), perl = TRUE)
}

#' Convert numbers with commas in them to numeric
#'
#' @param x character or factor
#'
#' @return numeric representation of input
#' @export
#'
#' @examples
#' nums <- c("123,456,789", "313,214.03")
#' comma_to_numeric(nums)
comma_to_numeric <- function(x) {
    as.numeric(gsub(",", "", x))
}
