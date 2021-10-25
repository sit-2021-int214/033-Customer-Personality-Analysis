#ทำการ add library
library(dplyr)
library(readr)


#Base R
hist(starwars$height)
plot(x=starwars$height,y=starwars$mass)


#Load Data
Top_ComSci_Prog_Books <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

View(Top_ComSci_Prog_Books)


#Set Data
Count_Type <- table(Top_ComSci_Prog_Books$Type)

Count_Type


#Create Graph from "#Set Data"
barplot(Count_Type)

  #ปรับแต่งให้มีการแสดงรายละเอียดของกราฟ
barplot(Count_Type,
        main = "Number of books of each type", #Title of graphs
        xlab = "Name of books", #X-axis title
        ylab = "Number of books" #Y-axis title
)






