กลุ่ม 033 ได้ทำการตรวจสอบ data ของข้อมูลที่เลือกมา ซึ่งพบว่ามีบางคอลัมน์และบางค่าของข้อมูลอาจมี pattern ที่ไม่เหมือนกัน ซึ่งอาจส่งผลให้ข้อมูลไม่มีความสวยงาม ไม่เป็นระบบ และไม่สอดคล้องกันกับข้อมูลอื่นๆ ดังนั้น กลุ่ม 033 จึงเล็งเห็นว่าควรต้องทำ Data Cleaning เพื่อให้ผลลัพธ์ของข้อมูลเป็นไปอย่างถูกต้อง,สมบูรณ์ และไม่เกิดความผิดพลาดใดๆ โดยต่อจากนี้จะเป็นกระบวณการ การทำ Data Cleaning & Transformation
## #Data Cleaning and Data Transformation
ก่อนเริ่มต้นการทำ Data Cleaning & Transformation จะต้องทำการ "ตรวจสอบ library" โดยการใช้คำสั่ง ```library(ชื่อไลบรารี่นั้นๆ)``` เพื่อให้สามารถใช้งานคำสั่งบางคำสั่งได้
```ruby
library(dplyr)
library(readr)
library(DescTools)
library(assertive)
library(stringr)
```

หลังจากการตรวจสอบ library แล้ว จากนั้นก็ทำการ "บันทึก dataset file.csv" ลงใน variable ใหม่ที่ชื่อ "CPA_NEW"
```ruby
CPA_NEW <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/033-Customer-Personality-Analysis/main/midterm_assignment/CPA_original.csv")
```
ทำการตรวจสอบตารางโดยคำสั่ง
```ruby
View(CPA_NEW)
glimpse(CPA)
```
ผลลัพธ์ที่ได้จากการ View

![image](https://user-images.githubusercontent.com/73602900/138119437-a1aac7d5-ba0a-4b43-b22e-d77afccdd5a6.png)

และ glimpse

![image](https://user-images.githubusercontent.com/73602900/138119807-d4b3c6ed-aed9-47cb-bd9c-f3bfe6914006.png)

เตรียมการเสร็จแล้วก็เริ่มต้นทำ Data Cleaning ได้
```ruby
## #เริ่มต้นการทำ Data Cleaning & Data Transformation

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

## จัดการกับ column ที่ไม่จำเป็น
ใช้ Microsoft Excel ในการลบ column A ออก เพราะว่า เลขที่แสดงของแต่ละ row นั้นคือเลขบรรทัด จึงไม่มีความจำเป็นที่ต้องเก็บเป็นอีกหนึ่ง attribute
### Steps
1. เปิดไฟล์ CSV
2. เลือกทั้ง column A
3. คลิ๊กขวา แล้วเลือก Delete

![Alt Text](https://github.com/sit-2021-int214/033-Customer-Personality-Analysis/blob/main/midterm_assignment/excelsolv.JPG)










