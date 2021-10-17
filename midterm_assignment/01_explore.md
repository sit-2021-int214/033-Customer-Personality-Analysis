## Define a question

1.
1.
1.
1.
1.


## Step 0 : Library and Dataset

```ruby
#library ใช้ไม่ใช้อันไหนเดี๋ยวค่อยเอาออก
library(dplyr)
library(assertive)
library(readr)
library(stringr)
library(DescTools)
#dataset
CPA <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/033-Customer-Personality-Analysis/main/midterm_assignment/CPA_cleaned.csv")
```


## Question 1 : ข้อมูลรายได้ของลูกค้าในแต่ละระดับการศึกษา 

```ruby
summary(CPA$Income)

outlier <- 68522 +1.5*IQR(CPA$Income,na.rm = T)
outlier

CPA %>% group_by(Education) %>% select(Income) %>% 
  filter(Income < outlier) %>%
  summarise(max_income = max(Income,na.rm = T),
            avg_income = mean(Income,na.rm = T),
            min_income = min(Income,na.rm = T))
```

### Result

```ruby
>outlier
118350.5

>summary(CPA$Income)
 Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
   1730   35303   51382   52247   68522  666666      24 

Education  max_income avg_income min_income
  <chr>           <int>      <dbl>      <int>
1 2n Cycle        96547     47633.       7500
2 Basic           34445     20306.       7500
3 Graduation     105471     51984.       1730
4 Master          98777     52630.       6560
5 PhD            113734     55280.       4023
```

### Explain here :
จากชุดข้อมูลลูกค้าพบว่ามีข้อมูลรายได้มีข้อมูลที่เป็น outlier อยู่จึงไม่นำข้อมูลเหล่านั้นมาหาค่าเฉลี่ย

## Question 2 : รายได้โดยเฉลี่ยของลูกค้าทั้งหมด

```ruby
CPA %>% select(Income) %>% 
  filter(Income < outlier) %>%
  summarise(avg_income = mean(Income,na.rm = T))            

```

### Result

```ruby
avg_income
1   51633.64
```
### Explain here :
อธิบายเกี่ยวกับ Problem Statement กับ Result

## Question 3 : 

```ruby
```

### Result

```ruby
52247.25
```
### Explain here :
อธิบายเกี่ยวกับ Problem Statement กับ Result

## Question 4 : 

```ruby
```

### Result

```ruby
52247.25
```
### Explain here :
อธิบายเกี่ยวกับ Problem Statement กับ Result

## Question 5 : 

```ruby
```

### Result

```ruby
52247.25
```
### Explain here :
อธิบายเกี่ยวกับ Problem Statement กับ Result

