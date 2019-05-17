library(plyr)
library(ggplot2)
library(data.table)
View(diamonds)
diamondsDT<- data.table(diamonds)
colnames(diamondsDT)
  #####data.table可以向資料庫一樣索引################
            # 類似select 欄位 , 用character指定欄位要把 with=FALSE
diamondsDT[,list(color,clarity,depth)]
diamondsDT[,c('color','clarity','depth'),with=FALSE]
            # 兩種寫法都可以
            
            #索引 分群
            #針對欄位下條件選取,依什麼欄位的什麼分群
            #對cut選出Ideal
            #對color選出E
            #而select的欄位有cut,color.carat,price
setkey(diamondsDT, cut, color)
diamondsDT[J("Ideal","E"),list(cut,color,carat,price)]
             
             #而分群也可多次,只要用C()帶入即可
diamondsDT[J("Ideal",c("E","D")),list(cut,color,carat,price)]

             #data.table的 select() sum,mean,MaX.......
            # select cut , mean(price) as price
            # from diamondsDT 
            # group by cut
diamondsDT[,list(price=mean(price)),by=cut]

            #group by cut,color ,的Price做mean, 的carat也做mean
            #用list將想要select的東西包起來
            #最後包成dataframe
df <- diamondsDT[,
           list(price.mean=mean(price),carat.mean=mean(carat)),
           by=list(cut,color)] %>% 
  data.frame(stringsAsFactors = FALSE)
str(df)


