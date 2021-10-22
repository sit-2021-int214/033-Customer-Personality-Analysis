## Define a question

1. ข้อมูลรายได้ของลูกค้าในแต่ละระดับการศึกษา
2. รายได้โดยเฉลี่ยของลูกค้าทั้งหมด
3. จำนวนของลูกค้าในแต่ละระดับการศึกษา
4. (เด่วมา clean โจทย์) ค่าใช้จ่ายที่ใช้ไปของแต่ละผลิตภัณฑ์ "โดยเฉลี่ย" ตลอด 2 ปีที่ผ่านมาเป็นเท่าไหร่บ้าง และผลิตภัณฑ์ใดที่มีค่าใช้จ่าย "สูงที่สุด" 
5.
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
## Step 1 : Data Exploration
```ruby
```
## Step 2 : Data Cleaning and Data Transformation

```ruby
#ตรวจสอบ library
library(dplyr)
library(readr)
library(DescTools)
library(assertive)
library(stringr)
#--------------------------------------
#save into new variable
CPA_NEW <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/033-Customer-Personality-Analysis/main/midterm_assignment/CPA_original.csv")
#CPA <- marketing_campaign_original
View(CPA_NEW)
glimpse(CPA)
#--------------------------------------
#Data Cleaning

#Rename column name "Kidhome" to "KidAtHome"
CPA_NEW <- CPA %>% rename(KidAtHome=Kidhome)

#Rename column name "TeenHome" to "TeenAtHome"
CPA_NEW <- CPA %>% rename(TeenAtHome=Teenhome)

#Rename every column to "PascalCase" ***Except! "Z_CostContact and Z_Revenue"
CPA_NEW <- CPA %>% rename(YearBirth=Year_Birth,MaritalStatus=Marital_Status,
                      DtCustomer=Dt_Customer)

#Rename column name "Z_CostContact" to "CostContact"
CPA_NEW <- CPA %>% rename(CostContact=Z_CostContact)


#Rename column name "Z_Revenue" to "Revenue"
CPA_NEW <- CPA %>% rename(Revenue=Z_Revenue)

#Sorting column
CPA_NEW <- CPA %>% select(ID,YearBirth,Education,MaritalStatus,Income,KidAtHome,TeenAtHome,
                      DtCustomer,Recency,MntWines,MntFruits,MntMeatProducts,
                      MntFishProducts,MntSweetProducts,MntGoldProds,NumDealsPurchases,
                      NumWebPurchases,NumCatalogPurchases,NumStorePurchases,
                      NumWebVisitsMonth,AcceptedCmp1,AcceptedCmp2,AcceptedCmp3,AcceptedCmp4,
                      AcceptedCmp5,Complain,CostContact,Revenue,Response)

#ทำการปรับ format ของ DtCustomer ให้เป็น pattern เดียวกันทั้งหมด

CPA_NEW <- CPA %>% mutate(DtCustomer = str_replace_all(DtCustomer,'/','-'))

View(CPA_NEW)
glimpse(CPA)

write.csv(CPA_NEW,"C:/Users/User/Desktop/INT214/033-Customer-Personality-Analysis/midterm_assignment/CPA_cleaned.csv",row.names = F)
```
## Step 3 : Data Analysis with Descriptive Statistics
### 3.1.1) Question 1 : ข้อมูลรายได้ของลูกค้าในแต่ละระดับการศึกษา 

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

###  3.1.2) Result

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

### 3.1.3) Explain here :
จากชุดข้อมูลลูกค้าพบว่ามีข้อมูลรายได้มีข้อมูลที่เป็น outlier อยู่จึงไม่นำข้อมูลเหล่านั้นมาหาค่าเฉลี่ย

### 3.2.1) Question 2 : รายได้โดยเฉลี่ยของลูกค้าทั้งหมด

```ruby
CPA %>% select(Income) %>% 
  filter(Income < outlier) %>%
  summarise(avg_income = mean(Income,na.rm = T))            

```

### 3.2.2) Result

```ruby
avg_income
1   51633.64
```
### 3.2.3) Explain here :
อธิบายเกี่ยวกับ Problem Statement กับ Result

### 3.3.1) Question 3 : จำนวนของลูกค้าในแต่ละระดับการศึกษา

```ruby
CPA %>% group_by(Education) %>% summarise(count=n())
```

### 3.3.2) Result

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
### 3.3.3) Explain here :
ต้องการทราบถึงจำนวนของลูกค้าในแต่ละระดับการศึกษาว่ามีเท่าไหร่ และมีระดับการศึกษาอะไรบ้าง ซึ่งผลลัพธ์ที่ได้พบว่ามีระดับการศึกษาอยู่ 5 ระดับ อันได้แก่

1.) 2n Cycle: พบว่ามีจำนวนลูกค้าในระดับการศึกษานี้    203 คน

2.) Basic: พบว่ามีจำนวนลูกค้าในระดับการศึกษานี้        54 คน

3.) Graduation: พบว่ามีจำนวนลูกค้าในระดับการศึกษานี้ 1127 คน

4.) Master: พบว่ามีจำนวนลูกค้าในระดับการศึกษานี้      370 คน

5.) PhD: พบว่ามีจำนวนลูกค้าในระดับการศึกษานี้         486 คน


### 3.4.1) Question 4 : 

```ruby

```

### 3.4.2) Result

```ruby

```

### 3.4.3) Explain here :
อธิบายเกี่ยวกับ Problem Statement กับ Result

### 3.5.1) Question 5 : 

```ruby

```

### 3.5.2) Result

```ruby

```
### 3.5.3) Explain here :
อธิบายเกี่ยวกับ Problem Statement กับ Result  

### 3.6.1) Question 6 : 

```ruby

```

### 3.6.2) Result

```ruby

```
### 3.6.3) Explain here :
อธิบายเกี่ยวกับ Problem Statement กับ Result  

