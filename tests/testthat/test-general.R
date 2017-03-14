context("test general.R")

# initialize

df_tbl <- dplyr::data_frame(
    x = c(1, 4, NA),
    y = c(Inf, 3,  5)
)


test_that("inf_to_na works, tibble", {
    df_tbl %>%
        inf_to_na %>%
        sum(na.rm = T) %>%
        expect_equal(13)
})

test_that("inf_to_na works, df", {
    df <- as.data.frame(df_tbl)
    df %>%
        inf_to_na %>%
        sum(na.rm = T) %>%
        expect_equal(13)
})

test_that("inf_to_na works, matrix", {
    mat <- as.matrix(df_tbl)
    mat %>%
        inf_to_na %>%
        sum(na.rm = T) %>%
        expect_equal(13)
})

test_that("inf_to_na works, list", {
    l <- as.list(c(1, NA, 2, 5, Inf, -Inf, 4, 5))
    l[[4]] <- c(Inf, NA, -Inf)
    l_list <- inf_to_na(l)

    expect_false(any(is.infinite(l_list)))
})

test_that("inf_to_na works, vector", {
    l <- c(1, NA, Inf, -Inf, 4, 5)
    l %>%
        inf_to_na %>%
        sum(na.rm = T) %>%
        expect_equal(10)
})
