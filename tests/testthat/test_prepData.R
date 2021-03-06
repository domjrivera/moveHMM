
context("prepData")

test_that("Exception is thrown",{
    x <- c(1,2,3,4,5,6,7,8,9,10)
    y <- c(1,1,1,2,2,2,1,1,1,2)
    z <- c(1,1,1,2,2,2,1,1,1,2)

    trackData <- data.frame(x)
    expect_that(prepData(trackData),throws_error())

    trackData <- data.frame(x,z)
    expect_that(prepData(trackData),throws_error())

    trackData <- data.frame(x,y)
    expect_that(prepData(trackData),not(throws_error()))
})

test_that("The right slots are defined",{
    x <- c(1,2,3,4,5,6,7,8,9,10)
    y <- c(1,1,1,2,2,2,1,1,1,2)
    trackData <- data.frame(x,y)
    data <- prepData(trackData)

    expect_that(!is.null(data$ID),is_true())
    expect_that(!is.null(data$x),is_true())
    expect_that(!is.null(data$y),is_true())
    expect_that(!is.null(data$step),is_true())
    expect_that(!is.null(data$angle),is_true())
})

test_that("The returned object is of the correct class",{
    x <- c(1,2,3,4,5,6,7,8,9,10)
    y <- c(1,1,1,2,2,2,1,1,1,2)
    trackData <- data.frame(x,y)
    data <- prepData(trackData)

    expect_equal(class(data),c("moveData","data.frame"))
})
