library(ggplot2)
library(dplyr)
library(plyr)
detach(package:plyr) 
library(magrittr)
   ## col roW索引練習
#######欄索引
colnames(diamonds)
diamonds %>% select(carat,price)
diamonds %>% select(starts_with('c'))
diamonds %>% select(-carat,-price)

diamonds %>% filter(cut == 'Ideal')
     ##篩選多個  
diamonds %>% filter(cut  %in% c('Ideal','Good'))
     ##使用運算子篩選
diamonds %>% filter(price>1000)
diamonds %>% filter(carat>2 & price<14000 & clarity =='VS2')
diamonds %>% filter(carat<2 | carat>5)
diamonds %>% filter(cut=="Ideal")



#######列索引                                  #選取元資料的1~5筆與第8筆
diamonds %>% filter(carat>2 & price<14000) %>% slice(1:5,8)
diamonds %>% filter(carat>2 & price<14000) %>% slice(-1)  #不要第一筆


####### 新增一個欄位 mutate
diamond2 <- 
  diamonds %>% 
  select(carat,price) %>% 
  mutate(Ratio=price/carat,Double=Ratio*2)


      ##跟ddply比較一下
      ##針對同id 分群後 ,新增欲計算欄位,並回給你一個新的dataframe
obp <- function(data){
  c(OBP= with(data, sum(h+bb+hbp)/sum(ab+bb+hbp+sf)),
    nothing=with(data,sum(h+bb)/sum(ab+bb)))
  } 
careerOBP <- ddply(baseball, .variables = 'id', .fun = obp)

##### 顯示dataframe的聚合運算結果 summarize ,group by
library(ggplot2)
library(dplyr)
library(plyr)
detach(package:plyr)  #要group by 生效, 記得detach plyr, plyr的summarize 是overall 的summerize
library(magrittr)
diamonds %>% 
  group_by(cut) %>% 
  summarise(avgprice=mean(price),sumcarat=sum(carat)) %>% 
  arrange(desc(sumcarat))

############ group_by 與 do 搭配, 將要對各群資料做的事用 do 包起來
top<- function(x,n){
  x %>% arrange(desc(price)) %>% head(n)
}
diamond2<- diamonds %>% 
  group_by(cut) %>% 
  do(top(.,3))
class(diamond2) #dataframe
str(diamond2)
                      #上下都是dataframe,但是當對do中"要做的事" "命名"
                      # 一個gruop by的分群結果會用一個dataframe包起來
                      #此例中欄位名稱命名為"Top", 將眾多dataframe放進一個list中
                            
diamond3<- diamonds %>% 
  group_by(cut) %>% 
  do(Top=top(.,3))
class(diamond3) #dataframe
str(diamond3)
class(diamond3$Top) #list
class(diamond3$Top[[1]]) #dataframe








