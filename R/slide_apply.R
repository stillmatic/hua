##########
#' Applies a function to subsets of a given dataset.
#' Note: sets values without sufficient data to NA.
#' Using 'step' is particularly useful for leave-one-out analysis.
#'
#' @export
#' @name slide_apply
#' @author \href{https://github.com/stillmatic}{Chris Hua}
#' @title Use apply over a sliding window of data
#' @param data Array of data to apply the function over.
#' @param window Numeric. Number of data points in each window.
#' @param step Numeric. Number of indices to step through data by.
#' @param fun Function to apply over each window.
#' @return Array of the results from the function.
#' @examples
#' toy <- runif(150, min=0, max=20)
#' slide_apply(toy, 30, 1, sd) # calculates 30 day moving standard deviation
slide_apply <- function (data, window, step = 1, fun)
{
    fun <- match.fun(fun)
    total <- length(data)
    window <- abs(window)
    spots <- seq(from = 1, to = (total - window + 1), by = abs(step))
    result <- rep(NA, length(spots))
    for (i in 1:length(spots)) {
        result[window + i - 1] <- fun(data[spots[i]:(spots[i] +
                                                         window - 1)])
    }
    return(result)
}
