test_that("Process data options", {

  d <- data.frame(a = c("Cats", "Cats", NA), b = c(1:3))
  d2 <- preprocessData(d, drop_na = TRUE)
  expect_equal(nrow(d2), 2)
  d <- data.frame(a = factor(c("Cats", "Cats", NA)), b = c(1:3))
  d3 <- preprocessData(d, drop_na = FALSE, na_label = "NoInfo", na_label_cols = "a")
  expect_equal(levels(d3$a), c("Cats","NoInfo"))




})

test_that("Agreggation by groups", {
  d <- data.frame(transport = c("ship", "ship", "ship", "plane", "train"), units = runif(5))
  d2 <- summarizeData(d, "sum", to_agg = units, transport)
  expect_equal(sort(unique(d2$transport)), sort(unique(d$transport)))
})

test_that("Aggs work",{
  library(tidyverse)
  dd <- tibble(x = c("A","A", "B", "C"), y = c("X","Y","Y","Z"), z = c(1,1,3,NA))

  no_na <- preprocessData(dd, drop_na = TRUE)
  expect_false(any(is.na(no_na)))

  d_summ1 <- summarizeData(dd, agg = "sum", to_agg = z, x)
  expect_true(d_summ1$z[d_summ1$x == "A"] == 2)

  d_summ2 <- summarizeData(dd, "sum", to_agg = z, y)
  expect_equal(d_summ2$z, c(1,4,0))


})


