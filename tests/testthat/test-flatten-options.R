test_that("Options can be flattened",{

  library(tidyverse)

  ## flatten options

  expect_null(options_flatten(NULL))
  expect_equal(options_flatten(list()), list())

  x <- list(a = 1, b = list(b1name = "b1", b2name = "b2"),
            c = list(c1name = "c", c2name = c("c2a","c2b")))
  expect_equal(names(options_flatten(x)),c("a","b1name","b2name","c1name","c2name"))
  expect_false(is_flat_list(x))
  expect_true(is_flat_list(flatten(x)))
  x <- list(a = 1, b = list(b1name = "b1", b2name = NULL),
            c = list(c1name = "c", c2name = c("c2a","c2b")))

  expect_equal(options_flatten(x),
               list(a = 1, b1name = "b1", b2name = NULL,
                    c1name = "c", c2name = c("c2a","c2b")))
  expect_equal(names(options_flatten(x)),c("a","b1name","b2name","c1name","c2name"))

  # flatten takes the last value provided
  x <- list(a = "a", bg = 0, opts = list(bg = 1, theme = list(bg = 3)))
  expect_equal(options_flatten(x), list(a = "a", bg = 3))


  opts <- dsviz_default_opts()
  opts_flat <- options_flatten(opts)

  ## Pull group

  opts <- dsviz_defaults(flat = TRUE)
  expect_equal(dsviz_default_opts()$summarize, pull_opt_group(opts, "summarize"))
  expect_error(pull_opt_group(opts, "stylesss"))
  expect_equal(dsviz_default_opts()$style, pull_opt_group(opts, "style"))


})

