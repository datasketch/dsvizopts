# function format_prep ----------------------------------------------------------------------------------


test_that("format_prep() works changing style of categories", {

  data <- sample_data("Gnm")
  f <- homodatum::fringe(data)
  dic <- f$dic
  names(data) <- dic$id
  out <- format_prep(data, dic, formats = list(sample_cat = "SAMPLE"))
  expect_equal(names(out), c(names(data), paste0(names(data), "_label")))
  expect_identical(out[[2]], as.character(toupper(data[[1]])))

  data <- sample_data("Num")
  f <- homodatum::fringe(data)
  dic <- f$dic
  names(data) <- dic$id
  out <- format_prep(data, dic, formats = list(sample_num = "1.234,",
                                               prefix = NULL,
                                               suffix = NULL))
  out <- format_prep(data, dic, formats = list(sample_num = "1.234,",
                                               prefix = "$",
                                               suffix = NULL))
})
