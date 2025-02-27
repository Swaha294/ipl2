library(dplyr)
library(testthat)

test_that("check fours", {
  expect_length(fours("SK Raina", 2012), 3)
})

test_that("check for invalid input types", {
  expect_error(
    fours(00),
    regexp = "be a character"
  )
})

test_that("check for when data not found", {
  expect_error(
    fours("Suresh"),
    regexp = "Invalid player name"
  )
})
