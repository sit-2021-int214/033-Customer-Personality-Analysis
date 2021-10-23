## Define a question

1. ข้อมูลรายได้ของลูกค้าในแต่ละระดับการศึกษา
2. รายได้โดยเฉลี่ยของลูกค้าทั้งหมด
3. จำนวนของลูกค้าในแต่ละระดับการศึกษา
4. ผลรวมของแต่ละผลิตภัณฑ์ที่จ่ายไป ตลอด 2 ปีที่ผ่านมาเป็นเท่าไหร่ และผลิตภัณฑ์ใดที่มีผลรวมมากที่สุด 
5. จำนวนสถานภาพสมรสของลูกค้าทั้งหมด
6.


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

## Step 1 : Data Analysis with Descriptive Statistics

### 1.1.1) Question 1 : ข้อมูลรายได้ของลูกค้า มากที่สุด,โดยเฉลี่ย และ น้อยที่สุด ในแต่ละระดับการศึกษา

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

###  1.1.2) Result

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

### 1.1.3) Explain here :
อยากรู้ข้อมูลต่างๆเกี่ยวกับรายได้ของลูกค้าในแต่ละระดับการศึกษา คือ โดยที่ไม่นำค่า outlier มาคำนวณด้วย ก็จะแสดงออกมาเป็นรายได้โดยเฉลี่ยของแต่ละระดับการศึกษา โดยจะมีทั้งหมด 5 ระดับการศึกษา และข้อมูลรายได้ Maximum,Average และ Minimum ของแต่ละระดับการศึกษา ใช้คำสั่ง `summary` เพื่อดูข้อมูลทางสถิติและใช้ในการหาค่า outlier จากนั้นใช้สูตรในการคำนวณหา outlier เก็บไว้ในตัวแปร `outlier` เพื่อการใช้งานครั้งต่อไป
พอเราทราบค่าของ outlier แล้วก็นำมา `filter` ออกจากการ query

### 1.2.1) Question 2 : รายได้โดยเฉลี่ยของลูกค้าทั้งหมด

```ruby
CPA %>% select(Income) %>% 
  filter(Income < outlier) %>%
  summarise(avg_income = mean(Income,na.rm = T))            

```

### 1.2.2) Result

```ruby
avg_income
1   51633.64
```
### 1.2.3) Explain here :
จากชุดข้อมูลลูกค้าพบว่ามีข้อมูลรายได้มีข้อมูลที่เป็น outlier อยู่จึงไม่นำข้อมูลเหล่านั้นมาหาค่าเฉลี่ย <br>
<b>`พบว่าลูกค้าทั้งหมดมีรายได้ต่อปีโดยเฉลี่ยอยู่ที่ $51633.64`</b>

### 1.3.1) Question 3 : 

```ruby
```

### 1.3.2) Result

```ruby

```
### 1.3.3) Explain here :
อธิบายเกี่ยวกับ Problem Statement กับ Result

### 1.4.1) Question 4 : 

```ruby

```

### 1.4.2) Result

```ruby

```

### 1.4.3) Explain here :
อธิบายเกี่ยวกับ Problem Statement กับ Result

### 1.5.1) Question 5 : 

```ruby

```

### 1.5.2) Result

```ruby

```
### 1.5.3) Explain here :
อธิบายเกี่ยวกับ Problem Statement กับ Result  

### 1.6.1) Question 6 : 

```ruby

```

### 1.6.2) Result

```ruby

```
### 1.6.3) Explain here :
อธิบายเกี่ยวกับ Problem Statement กับ Result  

