# function shape_info ----------------------------------------------------------------------------------

test_that("shape_info() works with geoname or geocode", {

  out <- shape_info(map_name = "col_departments", ftype = "Gnm-Num", by_col = "name")
  expect_true(all(class(out) %in% c("sf", "tbl_df", "tbl", "data.frame")))

  out <- shape_info(map_name = "col_municipalities", ftype = "Gnm-Num", by_col = "name")
  expect_true(all(class(out) %in% c("sf", "tbl_df", "tbl", "data.frame")))

  out <- shape_info(map_name = "col_municipalities", ftype = "Gnm-Num", by_col = "id")
  expect_true(all(class(out) %in% c("sf", "tbl_df", "tbl", "data.frame")))

  expect_error(shape_info(map_name = NULL, ftype = "Gnm-Num", by_col = "name"))
  expect_error(shape_info(map_name = "blabla", ftype = "Gnm-Num", by_col = "name"))

})
