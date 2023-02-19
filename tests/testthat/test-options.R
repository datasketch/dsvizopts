
test_that("Options are merged correctly", {

  library(tidyverse)

  ## Merge options

  defaults <- list(a = "AAA", b = "BBB", sub = list(sub1 = "S"))


  flat_defaults <- options_flatten(defaults)

  myfun <- function(x, ...){
    args <- list(...)
    #message("... args")
    #str(args)
    opts <- mergeOptions(args, defaults = options_flatten(defaults))
    opts
  }

  # if I provide an option not in the list, it will ignore it
  myfun_opts <- myfun(x = 0)

  expect_equal(myfun_opts, flat_defaults)

  myfun_opts <- myfun(x = 0, a = "a", b = "b")
  expect_equal(myfun_opts, list(a = "a", b = "b",sub1 = "S"))

  myfun_opts <- myfun(x = 0, agg = "MyAgg")
  # expect_true(is_flat_list(myfun_opts))
  expect_equal(myfun_opts$agg,"MyAgg")
  expect_equal(myfun_opts, c(flat_defaults, list(agg = "MyAgg")))

  opts <- list(agg = "MyAgg2", title = "New Title")
  myfun_opts <- myfun(x = 0, opts = opts)


  expect_true(is_flat_list(myfun_opts))
  expect_equal(myfun_opts$agg,"MyAgg2")
  expect_equal(myfun_opts$title,"New Title")
  expect_equal(myfun_opts, c(flat_defaults, list(agg = "MyAgg2", title =  "New Title")))

  myfun_opts <- myfun(x = 0, agg = "MyAgg", opts = list(agg = "MyAggOpts"))
  expect_true(is_flat_list(myfun_opts))
  expect_equal(myfun_opts$agg,"MyAggOpts")

  # Merge dsviz Options

  opts_defaults <- dsvizopts:::dsviz_defaults()
  fun <- function(...){merge_dsviz_options(...)}
  opts_dsviz <- fun()
  expect_equal(sort(names(opts_dsviz)), sort(names(opts_defaults)))
  purrr::walk(names(opts_dsviz), function(x){
    #message(x)
    expect_equal(opts_dsviz[[x]], opts_defaults[[x]])
  })

  expect_equal(opts_dsviz, opts_defaults)

  opts_dsviz <- fun(background_color = "#000000")
  expect_equal(opts_dsviz$theme$background_color, "#000000")

  opts_dsviz <- fun(opts = list( background_color = "#000000" ))
  expect_equal(opts_dsviz$theme$background_color, "#000000")

  expect_equal(opts_dsviz$theme$logo,opts_defaults$theme$logo)

  myopts <- list(branding_text = "Braning text heeeere",
                 background_color = "#F0F0F0")
  opts_dsviz <- fun(opts = myopts)
  expect_equal(opts_dsviz$theme$branding_text, myopts$branding_text)
  expect_equal(opts_dsviz$theme$background_color, myopts$background_color)

  # Merge theme options and prioritize them

  opts_dsviz <- merge_dsviz_options(background_color = "#000000")
  expect_equal(opts_dsviz$theme$background_color, "#000000")

  opts_dsviz <- merge_dsviz_options(background_color = "#000000",
                                    opts = list(background_color = "#000001"))
  expect_equal(opts_dsviz$theme$background_color, "#000001")

  opts_dsviz <- merge_dsviz_options(background_color = "#000000",
                                    opts = list(background_color = "#000001"),
                                    theme = list(background_color = "#000002"))
  expect_equal(opts_dsviz$theme$background_color, "#000002")

  opts_dsviz <- merge_dsviz_options(background_color = "#000000",
                                    opts = list(background_color = "#000001",
                                                theme = list(background_color = "#000003")
                                    ))
  expect_equal(opts_dsviz$theme$background_color, "#000003")

  opts_dsviz <- merge_dsviz_options(background_color = "#000000",
                                    opts = list(background_color = "#000001",
                                                theme = list(background_color = "#000003")
                                    ),
                                    theme = list(background_color = "#000005")
                                    )
  expect_equal(opts_dsviz$theme$background_color, "#000005")

  opts_dsviz <- merge_dsviz_options(background_color = "#000000",
                                    opts = list(background_color = "#000001",
                                                theme = list(background_color = "#000003")
                                    ),
                                    theme = list(background_color = "#000005"),
                                    background_color = "#000006"
                                    )
  expect_equal(opts_dsviz$theme$background_color, "#000006")

})

test_that("Filter extra options",{

  opts <- dsvizopts:::dsviz_defaults()
  pie_extra <- get_extra_opts(opts, pattern = "pie")
  expect_equal(pie_extra, list(pie_dataLabels_pos = 1.1))
})



