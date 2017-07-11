#' Convert infinite values to NA
#'
#' @param x data_frame, matrix, etc
#'
#' @return object of original type but with infinite values as NA
#' @export
#' @rdname inf_to_na
#'
#' @examples
#' df <- dplyr::data_frame(
#' x = c(1, 4, NA),
#' y = c(Inf, 3,  5)
#' )
#' inf_to_na(df)
inf_to_na <- function(x, ...) {
    UseMethod("inf_to_na")
}

#' @export
#' @rdname inf_to_na
inf_to_na.default <- function(x) {
    is.na(x) <- do.call(cbind, lapply(x, is.infinite))
    x
}

#' @export
#' @rdname inf_to_na
inf_to_na.list <- function(x) {
    stop("fix your data into not a list lol")
    # if(!is.null(names(x))) {
    #     y <- dplyr::data_frame(names = names(x), x = unname(x))
    # } else {
    #     y <- dplyr::data_frame(x = x)
    # }
    # for(i in 1:length(x)) {
    #     x[[i]] <- inf_to_na(unlist(x[[i]]))
    # }
    # x
}


nan_to_na <- function(x) {
    is.na(x) <- do.call(cbind, lapply(x, is.nan))
    x
}


