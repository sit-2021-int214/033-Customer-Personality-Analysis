# Library
library(dplyr)
library(ggplot2)
library(DescTools)
library(readr)
library(forcats)
library(stringr)
# Dataset

PROG_BOOK <- read.csv("C:/Users/User/Desktop/INT214/prog_book.csv")
View(PROG_BOOK)
glimpse(PROG_BOOK)

PROG_BOOK %>% filter(duplicated(PROG_BOOK))

is.na(PROG_BOOK) %>% summary()

PROG_BOOK$Number_Of_Pages %>% is.numeric()

avg_num_of_pages <- PROG_BOOK$Number_Of_Pages %>% mean(na.rm = T)

PROG_BOOK %>% filter(Number_Of_Pages > avg_num_of_pages) %>% group_by(Type) %>% count(sort = T)


PROG_BOOK %>% group_by(Type) %>% 
  summarise(max_price = max(Price,na.rm = T),
            avg_price = mean(Price,na.rm = T),
            min_price = min(Price,na.rm = T))

PROG_BOOK %>% filter(str_detect(Book_title,"Game")) %>% 
  group_by(Type) %>% select(Book_title,Rating,Price,Type) %>%
  arrange(desc(Rating))

avg_price <- PROG_BOOK$Price %>% mean(na.rm = T)

PROG_BOOK %>% group_by(Type) %>% select(Book_title,Rating,Price,Type) %>%
  filter(Price < avg_price) %>% 
  arrange(desc(Rating)) %>% head(10)


PROG_BOOK %>% group_by(Type) %>% filter(Price < (avg_price/2)) %>% count(sort = T)

PROG_BOOK %>% filter(str_detect(Book_title,"Java")) %>% group_by(Type) %>% count()

PROG_BOOK %>% filter(Rating > 4.00) %>% group_by(Type) %>% arrange(desc(Price)) %>% head(5)

PROG_BOOK$Rating %>%mean(na.rm = T)
PROG_BOOK$Price %>% mean(na.rm = T)

scat_plot <- PROG_BOOK %>% ggplot(aes(x=Rating,y=Price))  + 
  geom_point(aes(color=Type)) + geom_smooth() + 
  labs(title = "Relation between rating and price", 
       subtitle = "The books priced below $100 have a greater variety of ratings.",
       caption = "Dataset by Thomas Konstantin", color = "Book's Type")

scat_plot

test <- as.data.frame(table(PROG_BOOK$Type))
test

count_type <- PROG_BOOK %>% group_by(Type) %>% count()
count_type

bar_plot <- count_type %>% ggplot(aes(x =Type,y = n, fill = Type)) +
  geom_bar(stat = "identity") + geom_text(aes(label = n)) +
  labs(title = "Bar chart of the books of each type",
       subtitle = "The Paperback is the most type of book.", x = "Type" ,y = "Amount",
       caption = "Dataset by Thomas Konstantin",
       fill = "Book's Type")


bar_plot



