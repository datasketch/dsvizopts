test_that("Process data options", {

  d <- data.frame(a = c("Cats", "Cats", NA), b = c(1:3))
  d2 <- preprocessData(d, drop_na = TRUE)
  expect_equal(nrow(d2), 2)

})

test_that("Agreggation by groups", {
  d <- data.frame(transport = c("ship", "ship", "ship", "plane", "train"), units = runif(5))
  d2 <- summarizeData(d, "sum", to_agg = units, transport)
  expect_equal(sort(unique(d2$transport)), sort(unique(d$transport)))
})
