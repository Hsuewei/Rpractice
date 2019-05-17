library(lubridate)
x <- ymd("2012-03-26")
month(x)
month(x) <- 1
month(x) <- 13
month(x) > 3

month()

Y <- c("2009-01-01", "2009-01-02", "2009-01-03")
ymd(Y)
class(Y[1])
month(Y[1])
year(Y[1])
