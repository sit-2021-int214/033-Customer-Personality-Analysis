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

## Question 1 : รายได้โดยเฉลี่ยของลูกค้าทั้งหมด

```ruby
cust_avg_income <- CPA$Income %>% mean(na.rm = T)
cust_avg_income
```

### Result

```ruby
52247.25
```
### Explain here :
อธิบายเกี่ยวกับ Problem Statement กับ Result

## Question 2 : ข้อมูลรายได้ของลูกค้าในแต่ละระดับการศึกษา 

```ruby
CPA %>% group_by(Education) %>% select(Income) %>%
  summarise(max_income = max(Income,na.rm = T),
            avg_income = mean(Income,na.rm = T),
            min_income = min(Income,na.rm = T))
```

### Result

```ruby
Education  max_income avg_income min_income
  <chr>           <int>      <dbl>      <int>
1 2n Cycle        96547     47633.       7500
2 Basic           34445     20306.       7500
3 Graduation     666666     52720.       1730
4 Master         157733     52918.       6560
5 PhD            162397     56145.       4023
```

### Explain here :

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

