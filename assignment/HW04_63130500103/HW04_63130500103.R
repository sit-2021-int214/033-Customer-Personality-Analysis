#ทำการ add library
library(dplyr)
library(readr)
library(stringr)
library(DescTools)
library(ggplot2)


#Base R
hist(starwars$height)
plot(x=starwars$height,y=starwars$mass)


#Load Data set
Top_ComSci_Prog_Books <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

View(Top_ComSci_Prog_Books)

#________________________________________________

#Explore data set
glimpse(Top_ComSci_Prog_Books)
  #พบว่า มี rows: 271 , columns: 7

#ตรวจสอบชื่อคอลัมน์
colnames(Top_ComSci_Prog_Books)
  #ชื่อคอลัมน์แต่ละชื่อมีความเหมาะสม และเป็นระเบียบ 
  #แต่มีเพียงคอลัมน์ "Book_title" ที่อยากปรับตรงคำว่า "title" ให้เป็น "Title" (ให้ทุกคอลัมน์มีความเป็น PascalCase เพื่อความเป็น pattern เดียวกัน)

#ตรวจสอบข้อมูลของแต่ละ column โดย Logical Checking
is.numeric(Top_ComSci_Prog_Books$Rating) #ค่า Rating เป็น numeric เป็นจริง
is.numeric(Top_ComSci_Prog_Books$Reviews) #***พบว่าไม่เป็น numeric คาดว่าเป็นเพราะ "หลักพันใส่เครื่องหมาย [,] ทำให้ข้อมูลไม่เป็น numeric อย่างที่ควรจะเป็น"
is.character(Top_ComSci_Prog_Books$Book_title)#Book_title เป็น character เป็นจริง
is.character(Top_ComSci_Prog_Books$Description)#Description เป็น character เป็นจริง
is.numeric(Top_ComSci_Prog_Books$Number_Of_Pages)#Number_Of_Pages เป็น numeric เป็นจริง
is.character(Top_ComSci_Prog_Books$Type) #Type เป็น character เป็นจริง
is.numeric(Top_ComSci_Prog_Books$Price) #Price เป็น numeric เป็นจริง

  #จากการตรวจสอบคอลัมน์โดย Logical Checking พบว่า คอลัมน์ที่ควรต้อง clean คือ "Reviews"


#ตรวจสอบข้อมูลของแต่ละคอลัมน์ ว่ามี row ในคอลัมน์ใดที่ไม่ได้มีการให้ข้อมูลเอาไว้
which(is.na(Top_ComSci_Prog_Books$Rating),arr.ind = T) #ตรวจสอบว่ามี row ไหนบ้างที่ไม่ได้ระบุ Rating
which(is.na(Top_ComSci_Prog_Books$Reviews),arr.ind = T) #ตรวจสอบว่ามี row ไหนบ้างที่ไม่ได้ระบุ Reviews
which(is.null(Top_ComSci_Prog_Books$Book_title),arr.ind = T) #ตรวจสอบว่ามี row ไหนบ้างที่ไม่ได้ระบุ Book_title
which(is.null(Top_ComSci_Prog_Books$Description),arr.ind = T) #ตรวจสอบว่ามี row ไหนบ้างที่ไม่ได้ระบุ Description
which(is.na(Top_ComSci_Prog_Books$Number_Of_Pages),arr.ind = T) #ตรวจสอบว่ามี row ไหนบ้างที่ไม่ได้ระบุ Number_Of_Pages
which(is.null(Top_ComSci_Prog_Books$Type),arr.ind = T) #ตรวจสอบว่ามี row ไหนบ้างที่ไม่ได้ระบุ Type
which(is.na(Top_ComSci_Prog_Books$Price),arr.ind = T) #ตรวจสอบว่ามี row ไหนบ้างที่ไม่ด้ระบุ Price

  #จากการตรวจสอบสรุปได้ว่า "ไม่พบข้อมูลในคอลัมน์ที่ไม่ได้ระบุตัวเลข และไม่พบข้อมูลในคอลัมน์ที่มีค่าว่าง"


#ผลสรุปจากการสำรวจข้อมูล: คอลัมน์ทุกคอลัมน์ มีการตั้งชื่อของคอลัมน์ที่เป็น pattern เดียวกันมีความเป็นระเบียบ เว้นแต่คอลัมน์ชื่อ "Book_title" ที่ควรต้องปรับชื่อเล็กน้อย
#ทุกๆคอลัมน์และทุก row มีข้อมูลที่ได้ระบุครบถ้วนสมบูรณ์ และเป็น pattern เดียวกัน ยกเว้นคอลัมน์ "Reviews" ที่พบว่าไม่ได้เป็นค่า numeric ทั้งหมด เนื่องจาก "หลักพันใส่เครื่องหมาย [,] ทำให้ข้อมูลไม่เป็น numeric อย่างที่ควรจะเป็น"


#________________________________________________

#Data Cleaning and Data Transformation

#ปรับชื่อคอลัมน์ "Book_title" ให้เป็น "Book_Title"
Top_ComSci_Prog_Books <- Top_ComSci_Prog_Books %>% rename(Book_Title=Book_title)

colnames(Top_ComSci_Prog_Books) 
  #"Book_Title" เปลี่ยนชืิ่อเรียบร้อยแล้ว


#แก้ข้อข้อมูล row หลักพันของคอลัมน์ "Reviews" ให้เป็น format เดียวกัน และให้เป็น numeric
Top_ComSci_Prog_Books$Reviews <- Top_ComSci_Prog_Books$Reviews %>% str_remove(',')
Top_ComSci_Prog_Books$Reviews <- as.numeric(Top_ComSci_Prog_Books$Reviews) #ทำการแปลงให้ column 'Reviews' เป็น numeric

View(Top_ComSci_Prog_Books) #ตรวจสอบ data frame 
glimpse(Top_ComSci_Prog_Books$Reviews)

is.numeric(Top_ComSci_Prog_Books$Reviews) #ตรวจสอบว่าคอลัมน์ Reviews เป็น numeric หรือไม่


  #ผลจากการ clean: ทำการแก้ไขชื่อคอลัมน์ให้เป็น pattern เดียวกันแล้ว อีกทั้งข้อมูลเลขหลักพันไม่มี ',' แล้ว และสามารถแปลงให้ coulumn Reviews เก็บข้อมูลในรูปแบบของ numeric ได้แล้ว

#________________________________________________

#Learning functions from Tidyverse

#string-r: str_detect()
#ทำการตรวจสอบว่่าในคอลัมน์ที่ระบุ มีข้อมูล string ดังกล่าวที่พบอยู่ในแต่ละ row ของคอลัมน์นั้นๆ โดยเมื่อเทียบกับ SQL ก็จะเหมือนคำสั่yง 'LIKE'ที่ทำการตรวจสอบว่า String 'Python' นี้พบได้ใน row ใดบ้าง
Top_ComSci_Prog_Books %>% filter(str_detect(Book_Title,"Python")) %>% group_by(Type) %>% count()

#dplyr: arrange(desc()), select()
#arrange(desc()) =  orders the rows of a data frame by the values of selected columns. ในแบบมากไปหาน้อย
#select() = picks variables based on their names.
Top_ComSci_Prog_Books %>% filter(Reviews < 100) %>% group_by(Type) %>% select(Book_Title,Type,Rating,Reviews) %>% arrange(desc(Rating)) %>% head(3)

#________________________________________________

#Finding insight 

#1. rating น้อยที่สุด 6 อันดับ
Top_ComSci_Prog_Books %>%  filter(Reviews > 100,str_detect(Book_Title,
  paste(c("JavaScript", "Python"),collapse = '|'))) %>% 
  group_by(Type) %>% select(Book_Title,Type,Rating) %>% arrange(Rating) %>% head(6)

Top_ComSci_Prog_Books %>% summarise(max_rating)
#2.
Top_ComSci_Prog_Books %>% group_by(Type) %>%
  summarise(max_rating = max(Rating,na.rm = T),
            min_rating = min(Rating,na.rm = T),
            max_price = max(Price,na.rm = T),
            min_price = min(Price,na.rm = T))

#3.จำนวนหน้ากระดาษของหนังสือแต่ละประเภทที่มากที่สุดและน้อยที่สุด
Top_ComSci_Prog_Books %>% group_by(Type) %>%
    summarise(max_pages = max(Number_Of_Pages,na.rm = T),
              min_pages = min(Number_Of_Pages,na.rm = T))


#4.จำนวนของหนังสือแต่ละประเภท
Top_ComSci_Prog_Books %>% group_by(Type) %>% count()


#5.แสดง "book title, rating, type และ price" ของหนังสือที่ "ไม่มีผลการ Review" โดยแสดงข้อมูลของหนังสือที่มี 'Rating' มากที่สุด '5 อันดับ' 
Top_ComSci_Prog_Books %>% filter(Reviews == 0) %>% group_by(Type) %>%
  select(Book_Title,Rating,Type,Price) %>% arrange(desc(Rating)) %>% head(5)


#6.แสดง "book title,Rating,type และ price" ของหนังสือที่มีคำว่า "SQL" อยู่ใน title โดยแสดงหนังสือที่มี "ราคาสูงที่สุด"
Top_ComSci_Prog_Books %>% filter(str_detect(Book_Title,"Java")) %>% group_by(Type) %>% 
  select(Book_Title,Rating,Type,Price) %>% arrange(desc(Price)) %>% head(1)


#________________________________________________

#create graphs with ggplot2


#ทำการสร้างกราฟฮิสโตแกรม แสดงข้อมูล "จำนวนของหนังสือแต่ละประเภท ที่มีผล Reviews ตั้งแต่ 1000 ขึ้นไป"
Count_Type <- Top_ComSci_Prog_Books %>% group_by(Type) %>% filter(Reviews >= 1000) %>% count() 
    
Count_Type #ทำการเก็บข้อมูลที่ต้องการไว้เป็น data frame ใหม่ชื่อว่า "Count_Type"

#สร้าง Histogram 
Count_Type_His <- Count_Type %>% ggplot(aes(x = Type,y = n,fill = Type))+ 
  geom_bar(stat = "identity") + geom_text(aes(label = n)) + 
  labs(title = "Amount of books for each type(Reviews are greater than or equal to 1,000)",
       subtitle = "'Hardcover' is the most type of book with reviews greater than or equal to 1,000",
       x = "Type of books",y = "amount of books",
       caption = "Survey results by Ovuvuevuevue Enyetuenwuevue Ugbemugbem Asus",
       fill = "Type of Book")

#ตรวจสอบกราฟ
Count_Type_His

#-----------------------------------------

#เหลืออีกหนึ่งกราฟ...................
#2.2. Example 2: Scatter Plot with starwars dataset

#Step 1: Creating a scatter plot
starwars %>% ggplot(aes(x=height,y=mass))+geom_point()

#Step 2: Using filter data to expand more details
starwars %>% filter(mass<500) %>% ggplot(aes(x=height,y=mass)) + geom_point()

#Step 3: Label gender with color
scat_plot <- starwars %>% filter(mass<500) %>% ggplot(aes(x=height,y=mass))+
  geom_point(aes(color=gender))
#--output--
scat_plot

#Step 4: Adding a line of best fit to a plot
scat_plot+geom_smooth() #default value - loess
scat_plot+geom_smooth(method="lm") #linear model



#กราฟที่สอง
#
scat_plot_ComBooks <- Top_ComSci_Prog_Books %>% select(Rating,Reviews,Book_Title,Description,Number_Of_Pages,Type,Price) %>%
    filter(Rating >= 4.00) 

View(scat_plot_ComBooks)

#Step 1: Creating a scatter plot
scat_plot_ComBooks %>% ggplot(aes(x=Rating,y=Price))+geom_point()

#Step 3: Label [Type] with color
scat_plot_RatingAndPrice <- scat_plot_ComBooks %>% ggplot(aes(x=Rating,y=Price))+
  geom_point(aes(color=Type))

#--output--
scat_plot_RatingAndPrice

#Step 4: Adding a line of best fit to a plot
scat_plot_RatingAndPrice <- scat_plot_RatingAndPrice + geom_smooth() #linear model

#Step 5: Adding other information in this scatter plot graph
scat_plot_RatingAndPrice <- scat_plot_RatingAndPrice + 
  labs(title = "Relation between rating and price (with rating from 4.00 onwards)",
       subtitle = "The largest amount of books with ratings in the range of 4.00-4.50 and priced below 100$",
       caption = "Survey results by Albert I.Love.U")

#--finished--
scat_plot_RatingAndPrice

Count_Type_His

