## Data Cleaning and Data Transformation
```ruby
#ตรวจสอบ library โดยการใช้คำสั่ง library(ชื่อไลบรารี่นั้นๆ) เพื่อให้สามารถใช้งานคำสั่งบางคำสั่งได้
library(dplyr)
library(readr)
library(DescTools)
library(assertive)
library(stringr)
#--------------------------------------
#save into new variable
#ทำการบันทึก dataset csv file ลงใน variable ใหม่ที่ชื่อ "CPA_NEW"
CPA_NEW <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/033-Customer-Personality-Analysis/main/midterm_assignment/CPA_original.csv")

#เรียกดู/ตรวจสอบข้อมูลที่ใน variable: CPA_NEW โดยคำสั่ง View() และ glimse()
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
