## Data Cleaning and Data Transformation

กลุ่ม 033 ได้ทำการตรวจสอบ data ของข้อมูลที่เลือกมา ซึ่งพบว่ามีบางคอลัมน์และบางค่าของข้อมูลอาจมี pattern ที่ไม่เหมือนกัน ซึ่งอาจส่งผลให้ข้อมูลไม่มีความสวยงาม ไม่เป็นระบบ และไม่สอดคล้องกันกับข้อมูลอื่นๆ ดังนั้น กลุ่ม 033 จึงเล็งเห็นว่าควรต้องทำ Data Cleaning เพื่อให้ผลลัพธ์ของข้อมูลเป็นไปอย่างถูกต้อง,สมบูรณ์ และไม่เกิดความผิดพลาดใดๆ โดยต่อจากนี้จะเป็นกระบวณการ การทำ Data Cleaning & Transformation
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
### ทำการตรวจสอบตารางโดยคำสั่ง
```ruby
View(CPA_NEW)
glimpse(CPA_NEW)
```
### ผลลัพธ์ที่ได้จากการ View

![image](https://user-images.githubusercontent.com/73602900/138119437-a1aac7d5-ba0a-4b43-b22e-d77afccdd5a6.png)

และ glimpse

![image](https://user-images.githubusercontent.com/73602900/138119807-d4b3c6ed-aed9-47cb-bd9c-f3bfe6914006.png)
#
## เตรียมการเสร็จแล้วก็เริ่มต้นทำ Data Cleaning ได้
```ruby
#ทำการเปลี่ยนชื่อ column "Kidhome" เป็น "KidAtHome" โดยใช้คำสั่ง "rename(ชื่อคอลัมน์ใหม่=ชื่อคอลัมน์เดิม)"
CPA_NEW <- CPA %>% rename(KidAtHome=Kidhome)
```
![image](https://user-images.githubusercontent.com/73602900/138387540-53558178-b706-4407-b3d9-eace674324f1.png)

```ruby
#ทำการเปลี่ยนชื่อ column "TeenHome" เป็น "TeenAtHome" โดยใช้คำสั่ง "rename(ชื่อคอลัมน์ใหม่=ชื่อคอลัมน์เดิม)"
CPA_NEW <- CPA %>% rename(TeenAtHome=Teenhome)
```
![image](https://user-images.githubusercontent.com/73602900/138388123-11d9aaa9-d2c3-412c-91ea-53807fa8532b.png)

```ruby
#ทำการปรับเปลี่ยนเคสของทุกคอลัมน์เป็น "PascalCase" ***ยกเว้น! "Z_CostContact" และ "Z_Revenue"
#โดยใช้คำสั่ง "rename(ชื่อคอลัมน์ใหม่=ชื่อคอลัมน์เดิม)"
CPA_NEW <- CPA %>% rename(YearBirth=Year_Birth,MaritalStatus=Marital_Status,
                      DtCustomer=Dt_Customer)
```
![image](https://user-images.githubusercontent.com/73602900/138388287-c478894b-074b-49a5-b2be-08b64e40c12a.png)

```ruby
#ทำการเปลี่ยนชื่อ column "Z_CostContact" เป็น "CostContact" โดยใช้คำสั่ง "rename(ชื่อคอลัมน์ใหม่=ชื่อคอลัมน์เดิม)"
CPA_NEW <- CPA %>% rename(CostContact=Z_CostContact)
```
![image](https://user-images.githubusercontent.com/73602900/138394179-b8ea1fd4-bfef-461e-9eaa-19291dcc8871.png)

```ruby
#ทำการเปลี่ยนชื่อ column "Z_Revenue" เป็น "Revenue" โดยใช้คำสั่ง "rename(ชื่อคอลัมน์ใหม่=ชื่อคอลัมน์เดิม)"
CPA_NEW <- CPA %>% rename(Revenue=Z_Revenue)
```
![image](https://user-images.githubusercontent.com/73602900/138394226-68d6fa7d-c6f4-45bd-b05b-811f7ecc7be8.png)

```ruby
#ทำการจัดเรียงคอลัมน์ให้ผลลัพธ์เป็นไปตามต้องการ โดยใช้คำสั่ง "select(คอลัมน์ที่เลือกตามลำดับ)"
CPA_NEW <- CPA %>% select(ID,YearBirth,Education,MaritalStatus,Income,KidAtHome,TeenAtHome,
                      DtCustomer,Recency,MntWines,MntFruits,MntMeatProducts,
                      MntFishProducts,MntSweetProducts,MntGoldProds,NumDealsPurchases,
                      NumWebPurchases,NumCatalogPurchases,NumStorePurchases,
                      NumWebVisitsMonth,AcceptedCmp1,AcceptedCmp2,AcceptedCmp3,AcceptedCmp4,
                      AcceptedCmp5,Complain,CostContact,Revenue,Response)
```
#### #คอลัมน์ก่อนจัดเรียง
![image](https://user-images.githubusercontent.com/73602900/138394485-30c7a425-b03d-46d6-baa5-38f0caf14c95.png)

#### #คอลัมน์หลังจากจัดเรียง
![image](https://user-images.githubusercontent.com/73602900/138394367-6d2a5d93-420f-45fa-b53b-c0550919a0ba.png)
#
```ruby
#ทำการปรับ format ของ DtCustomer ให้มีข้อมูลเป็น pattern เดียวกันทั้งหมด
#โดยใช้คำสั่ง mutate(คอลัมน์ที่ต้องการ = str_replace_all(คอลัมน์ที่ต้องการ,'ค่าที่ต้องการ mutate','ค่าที่จะมาแทนค่าที่ถูก mutate'))
CPA_NEW <- CPA %>% mutate(DtCustomer = str_replace_all(DtCustomer,'/','-'))
```
#### #ก่อนปรับ format ให้เป็น pattern เดียวกัน
![image](https://user-images.githubusercontent.com/73602900/138395194-997ff34b-afc9-4867-bf1f-51cafe6a17a4.png)

#### #หลังจากปรับ format ให้เป็น pattern เดียวกัน
![image](https://user-images.githubusercontent.com/73602900/138395231-e4a2ced9-93db-429e-a2d9-119ede8af7b8.png)

```ruby
#ทำการจัดการกับ column ที่ไม่จำเป็นด้วย "write.csv(ชื่อตัวแปร,"path-data file",row.names = F)"
write.csv(CPA_NEW,"C:/Users/User/Desktop/INT214/033-Customer-Personality-Analysis/midterm_assignment/CPA_cleaned.csv",row.names = F)
```
#
## จัดการกับ column ที่ไม่จำเป็น
ใช้ Microsoft Excel ในการลบ column A ออก เพราะว่า เลขที่แสดงของแต่ละ row นั้นคือเลขบรรทัด จึงไม่มีความจำเป็นที่ต้องเก็บเป็นอีกหนึ่ง attribute
### Steps
1. เปิดไฟล์ CSV
2. เลือกทั้ง column A
3. คลิ๊กขวา แล้วเลือก Delete

![Alt Text](https://github.com/sit-2021-int214/033-Customer-Personality-Analysis/blob/main/midterm_assignment/excelsolv.JPG)










