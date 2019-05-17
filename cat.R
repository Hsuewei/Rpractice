library(xlsx)
library(tidyverse)
library(dplyr)
?read.xlsx2()
#yo
test <- read.xlsx2("C:/Users/Student/Desktop/Rpractice/data/cat_done.xlsx",1,colClasses = c('character','numeric'))

colnames(test)[2] <- 'result'
cat <- test[,c(1,2)]
str(cat)
View(cat)
cat %>%
  group_by(result) %>%
  count()
cat[cat$result == 9,]
cat[cat$categories=='Drive-In Theater',][2] <- c(0,0)
cat[cat$categories=='Drive-In Theater',]
cat[cat$categories=='Golf',]


restaurant_cat <- cat[cat$result == 1,]
restaurant_cat[restaurant_cat$categories=="Pretzels(æ¤’é¹½??†é??)",][1] <- 'Pretzels'
unique(restaurant_cat$categories)
lst <- as.list(as.character(unique(restaurant_cat$categories)))

sub <- function(data){
  if (grepl(data,pattern = "&",useBytes = FALSE))
    {
    print("")}
  if (grepl(data,pattern = "/",useBytes = FALSE))
    {
    print("")
    }
    else{
      gsub(data,pattern = " ",replacement = ".")}
}  
  
  
lst2 <- sapply(lst,sub)
               
               


df <- 'asfasf&///'
contains(df,match = '//')




library(GetoptLong)
qq('@{restaurant_cat$categories}')
index <- c()
index <- c(index,as.character(unique(restaurant_cat$categories)))



catgory <- read.csv("C:/Users/Student/Desktop/Rpractice/data/catwithid.csv")
colnames(catgory)
revised_catwithid <- catgory %>% select("Drive-In.Theater")
View(head(revised_catwithid)) 

View(head(catgory))

revised_catwithid[is.na(revised_catwithid)] <- 0
View(head(revised_catwithid))
