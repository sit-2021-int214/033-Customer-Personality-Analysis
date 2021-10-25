#ทำการ add library
library(dplyr)
library(readr)
library(assertive)

#Base R
hist(starwars$height)
plot(x=starwars$height,y=starwars$mass)


#Load Data
Top_ComSci_Prog_Books <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

View(Top_ComSci_Prog_Books)

#________________________________________________

#Explore data set
glimpse(Top_ComSci_Prog_Books)
  #พบว่า มี rows: 271 , columns: 7

#ตรวจสอบข้อมูลของแต่ละ column โดย Logical Checking
is.numeric(Top_ComSci_Prog_Books$Rating) #ค่า Rating เป็น numeric เป็นจริง
is.character(Top_ComSci_Prog_Books$Reviews) #***พบว่าไม่เป็น numeric คาดว่าเป็นเพราะ "หลักพันใส่เครื่องหมาย [,] ทำให้ข้อมูลไม่เป็น numeric อย่างที่ควรจะเป็น"
is.character(Top_ComSci_Prog_Books$Book_title)#Book_title เป็น character เป็นจริง
is.character(Top_ComSci_Prog_Books$Description)#Description เป็น character เป็นจริง
is.numeric(Top_ComSci_Prog_Books$Number_Of_Pages)#Number_Of_Pages เป็น numeric เป็นจริง
is.character(Top_ComSci_Prog_Books$Type) #Type เป็น character เป็นจริง
is.numeric(Top_ComSci_Prog_Books$Price) #Price เป็น numeric เป็นจริง

  #จากการตรวจสอบคอลัมน์โดย Logical Checking พบว่า คอลัมน์ที่ควรต้อง clean คือ "Reviews"






































#________________________________________________

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






