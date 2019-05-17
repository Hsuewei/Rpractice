library(jsonlite)
library(lubridate)
library(tidyverse)
library(nnet)
library(dplyr)
library(plyr)
#yo
#yoyoyoyoyo

#YOOYOOYOYOY
checkin <- stream_in(file("C:/Users/Student/Desktop/Rpractice/data/checkin.json"))

colnames(checkin)
View(head(checkin))



split <- function(data){
  strsplit(data, split = ',')
}

date_split_list <- lapply(checkin$date, split)
?unlist

library(lubridate)
year(date_split_list[[1]][[1]][1])
month(date_split_list[[1]][[1]][1])
day(date_split_list[[1]][[1]][1])
hour(date_split_list[[1]][[1]][1])
minute(date_split_list[[1]][[1]][1])

length(date_split_list[[1]][[1]])
length(date_split_list[[2]][[1]])
class(date_split_list[[2]][[1]])

test <- list()
test[[1]] <- 1
test[[1]][[1]][1] <- 1
test[[2]]
test[2] <- 2
test

?list
for (i in 1:length(date_split_list)){
  for (j in 1:length(date_split_list[[i]][[1]])){
  year <- list(year(date_split_list[[i]][[1]][j]))
  month <- list(month(date_split_list[[i]][[1]][j]))
  day <- list(day(date_split_list[[i]][[1]][j]))
  hour <- list(hour(date_split_list[[i]][[1]][j]))
  biglist[i] <- list(year,month,day,hour)
  print('%')
  }
}


