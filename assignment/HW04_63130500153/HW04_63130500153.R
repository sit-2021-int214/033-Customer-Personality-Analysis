library(dplyr)
library(readr)
library(ggplot2)
library(stringr) 
library(assertive) 

SuperStore <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")

#1
SuperStore %>% View()

#2
SuperStore %>% filter(SuperStore$Category == "Furniture") %>% filter(SuperStore$Country == "United States")

SuperStore %>% filter(Category == "Technology") %>% filter(between(format(as.Date(Ship.Date,"%d/%m/%Y"),"%Y"),2015,2017)) 

SuperStore %>% summary()  

SuperStore %>% distinct(Country,City)

SuperStore %>% select(Product.Name,Sales) %>% filter(Sales >= 10000)

SuperStore %>% count(Region) %>% filter(Region == "Central")

#3
SuperStore %>% ggplot(aes(x=Category)) + geom_bar()

SuperStore %>%  filter(Sales > 5000)%>% ggplot(aes(x=Postal.Code,y=Sales)) + geom_point() 

#4
install.packages("tidyverse")
install.packages("tibble")
library(tibble)
tibble(x = 1:5, y = 1, z = x ^ 2 + y)

