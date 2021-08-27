#EXERCISE 1
x <- c(10.4, 5.6, 3.1, 6.4, 21.7)

#FIND AVERAGE
ave(x)
print(ave(x))
mean(x) ##9.44

#FIND SUM
sum(x) #47.2

#FIND MEDIAN
median(x) #6.4

#FIND SD
sd(x) #7.33846

#FIND VARIANCE
var(x) #53.853

summary(x)

#EXERCISE 2

# List of Marvel movies (Order by Marvel Phase released)

names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
           "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
           "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
           "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
           "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
           "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")

# List of released year of Marvel movies
years <- c(2008,2008,2010,2011,2011,2012,rep(2013:2016,each=2),
           rep(2017,4),rep(2018,2),rep(2019,3),rep(2021,4))

#2.1
#Use a data frame to sort data and display it as a table
marvel_movies <-data.frame(names,years)
View(marvel_movies)

#2.2
length(names) #27
names[19] #"Avengers: Infinity War"
print("2017 and 2021 are most released movies")
library(DescTools)

Mode(marvel_movies)
