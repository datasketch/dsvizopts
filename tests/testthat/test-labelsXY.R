test_that("Vertical Orientation labels", {

  axis_names <- labelsXY(
    hor_title = "Transport classification",
    ver_title = "Total units",
    nms = c("transport", "units"),
    orientation = "ver")
  expect_equal(axis_names, c("Transport classification", "Total units"))

})

test_that("Horizontal Orientarion labels", {
  axis_names <- labelsXY(
    hor_title = "Total units",
    ver_title = "Transport classification",
    nms = c("transport", "units"),
    orientation = "hor")
  expect_equal(axis_names, c("Transport classification", "Total units"))

})
