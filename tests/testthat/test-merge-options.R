test_that("Merge options", {



  defaults <- list(a = "A", b = "B", sub = list(sub1 = "S"))
  merged <- mergeOptions(a = "A2", defaults = options_flatten(defaults))

  expect_equal(merged$a, "A2")


  opts <- list(a = "A", title = "New Title")

  mergeOptions(list(a = "A2"), defaults = options_flatten(defaults))


  # Merge options

  viz_fun <- function(...){
    titles_opts <- merge_dsviz_options(...)
    titles_opts$titles
  }

  expect_equal(viz_fun(title = "Hello"),
               viz_fun(opts = list(title = "Hello")))



})
