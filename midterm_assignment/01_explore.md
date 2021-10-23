## Define a question

1. ข้อมูลรายได้ของลูกค้าในแต่ละระดับการศึกษา
2. รายได้โดยเฉลี่ยของลูกค้าทั้งหมด
3. จำนวนของลูกค้าในแต่ละระดับการศึกษา
4. ผลรวมของแต่ละผลิตภัณฑ์ที่จ่ายไป ตลอด 2 ปีที่ผ่านมาเป็นเท่าไหร่ แสดงผลรวมของแต่ละผลิตภัณฑ์ที่สูงที่สุดไปยังน้อยที่สุด
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

### 1.3.1) Question 3 : จำนวนของลูกค้าในแต่ละระดับการศึกษา

```ruby
CPA %>% group_by(Education) %>% summarise(count=n())
```

### 1.3.2) Result

```ruby
> CPA %>% group_by(Education) %>% summarise(count=n())
# A tibble: 5 x 2
  Education  count
  <chr>      <int>
1 2n Cycle     203
2 Basic         54
3 Graduation  1127
4 Master       370
5 PhD          486
```
### 1.3.3) Explain here :
ต้องการทราบถึงจำนวนของลูกค้าในแต่ละระดับการศึกษาว่ามีเท่าไหร่ และมีระดับการศึกษาอะไรบ้าง ซึ่งผลลัพธ์ที่ได้พบว่ามีระดับการศึกษาอยู่ 5 ระดับ อันได้แก่
1.) 2n Cycle: พบว่ามีจำนวนลูกค้าในระดับการศึกษานี้    203 คน
2.) Basic: พบว่ามีจำนวนลูกค้าในระดับการศึกษานี้        54 คน
3.) Graduation: พบว่ามีจำนวนลูกค้าในระดับการศึกษานี้ 1127 คน
4.) Master: พบว่ามีจำนวนลูกค้าในระดับการศึกษานี้      370 คน
5.) PhD: พบว่ามีจำนวนลูกค้าในระดับการศึกษานี้         486 คน

### 1.4.1) Question 4 : ผลรวมของแต่ละผลิตภัณฑ์ที่จ่ายไป ตลอด 2 ปีที่ผ่านมาเป็นเท่าไหร่ / แสดงชื่อของผลิตภัณฑ์ที่มีผลรวมมากที่สุด

```ruby
#Step1
CPA_SumMntProd <- CPA %>% select(MntWines,MntFruits,MntMeatProducts,MntFishProducts,MntSweetProducts,MntGoldProds)%>% 
  summarise(sum_MntWines = sum(MntWines,na.rm = T),
            sum_MntFruits = sum(MntFruits,na.rm = T),
            sum_MntMeatProducts = sum(MntMeatProducts,na.rm = T),
            sum_MntFishProducts = sum(MntFishProducts,na.rm = T),
            sum_MntSweetProducts = sum(MntSweetProducts,na.rm = T),
            sum_MntGoldProds = sum(MntGoldProds,na.rm = T))

#Step2
glimpse(CPA_SumMntProd)                 

#Step3 find max
CPA_MaxProdName <- CPA_SumMntProd %>% colnames() %>% max()
#แสดงชื่อ product ที่มีผลรวมมากที่สุด
CPA_MaxProdName
#Step4 find min
CPA_MinProdName <- CPA_SumMntProd %>% colnames() %>% min()
#แสดงชื่อ product ที่มีผลรวมน้อยที่สุด
CPA_MinProdName
```

### 1.4.2) Result

```ruby
#ข้อมูลผลรวมของแต่ละผลิตภัณฑ์ที่จ่ายไป
glimpse(CPA_SumMntProd)                 
Rows: 1
Columns: 6
$ sum_MntWines         <int> 680816
$ sum_MntFruits        <int> 58917
$ sum_MntMeatProducts  <int> 373968
$ sum_MntFishProducts  <int> 84057
$ sum_MntSweetProducts <int> 60621
$ sum_MntGoldProds     <int> 98609

#แสดงผลชื่อของผลิตภัณฑ์ที่มีผลรวมมากที่สุด
> CPA_MaxProdName <- CPA_SumMntProd %>% colnames() %>% max()
> #แสดงชื่อ product ที่มีผลรวมมากที่สุด
> CPA_MaxProdName
[1] "sum_MntWines"



```

### 1.4.3) Explain here :
ใช้คำสั่ง select เพื่อทำการเลือกคอลัมน์ที่ต้องการ จากนั้นทำการ summarise เพื่อกำหนดชื่อคอลัมน์ใหม่สำหรับเก็บค่าผลรวม(sum) ของแต่ละผลิตภัณฑ์ เพื่อทำการเก็บไว้เป็น data frame ใหม่ชื่อว่า "CPA_SumMntProd" จากนั้นได้ทำการ glimpse เพื่อให้ตรวจสอบข้อมูลใน data frame นั้นได้ง่ายขึ้น เพื่อใช้เปรียบเทียบค่าด้วยตาเปล่าของแต่ละคอลัมน์ของผลรวมผลิตภัณฑ์นั้นๆ / เมื่อได้ข้อมูลตามที่ต้องการแล้ว ทำการ ใช้คำสั่ง "colnames() %>% max()" เพื่อให้แสดงชื่อของคอลัมน์ที่มีค่ามากที่สุด เก็บไว้ในตัวแปรใหม่ที่ชื่อว่า "CPA_MaxProdName" 

### 1.5.1) Question 5 : จำนวนสถานภาพสมรสของลูกค้าทั้งหมด

```ruby
CPA %>% group_by(Marital_Status) %>% Summarise(count=n()) %>%
```

### 1.5.2) Result

```ruby
Married     864
Together    580
Single      480
Divorced    232
Widow        77
Alone         3
Absurd        2
YOLO          2
```
### 1.5.3) Explain here :
จากชุดข้อมูลพบว่าสถานภาพสมรสของลูกค้ามีทั้งหมด 8 ประเภท ประกอบด้วยมีลูกค้าที่อยู่ในสถานะ Married 864 คน สถานะ Together 580 คน สถานะ Single 480 คน สถานะ Divorced 232 คน สถานะ Widow 77 คน สถานะ Alone 3 คน สถานะ Absurd 2 คน และ สถานะ YOLO 2 คน

### 1.6.1) Question 6 : 

```ruby

```

### 1.6.2) Result

```ruby

```
### 1.6.3) Explain here :
อธิบายเกี่ยวกับ Problem Statement กับ Result  

