if(!require(testthat)) {
    install.packages("testthat")
}

library(testthat)
library(magrittr)
library(hua)

test_check("hua")
