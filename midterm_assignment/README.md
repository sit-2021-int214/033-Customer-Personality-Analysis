## Search datasets from Kaggle
Datasets from: [customer-personality-analysis-dataset](https://www.kaggle.com/imakash3011/customer-personality-analysis)

## Explore the dataset from the original dataset
### About this Dataset
Customer Personality Analysis is a detailed analysis of a company’s ideal customers. It helps a business to better understand its customers and makes it easier for them to modify products according to the specific needs, behaviors and concerns of different types of customers.

Customer personality analysis helps a business to modify its product based on its target customers from different types of customer segments. For example, instead of spending money to market a new product to every customer in the company’s database, a company can analyze which customer segment is most likely to buy the product and then market the product only on that particular segment.

เป็นชุดข้อมูลที่มีข้อมูลค่อนข้างเยอะ ประกอบไปด้วย 2,240 Observations และ 29 Columns
## Content 📌
ความหมายของข้อมูลในแต่ละ Columns

### People 👪

* ID: Customer's unique identifier
* Year_Birth: Customer's birth year
* Education: Customer's education level
* Marital_Status: Customer's marital status
* Income: Customer's yearly household income
* Kidhome: Number of children in customer's household
* Teenhome: Number of teenagers in customer's household
* Dt_Customer: Date of customer's enrollment with the company
* Recency: Number of days since customer's last purchase
* Complain: 1 if customer complained in the last 2 years, 0 otherwise

### Products 📦

* MntWines: Amount spent on wine in last 2 years
* MntFruits: Amount spent on fruits in last 2 years
* MntMeatProducts: Amount spent on meat in last 2 years
* MntFishProducts: Amount spent on fish in last 2 years
* MntSweetProducts: Amount spent on sweets in last 2 years
* MntGoldProds: Amount spent on gold in last 2 years

 ### Promotion 💳

* NumDealsPurchases: Number of purchases made with a discount
* AcceptedCmp1: 1 if customer accepted the offer in the 1st campaign, 0 otherwise
* AcceptedCmp2: 1 if customer accepted the offer in the 2nd campaign, 0 otherwise
* AcceptedCmp3: 1 if customer accepted the offer in the 3rd campaign, 0 otherwise
* AcceptedCmp4: 1 if customer accepted the offer in the 4th campaign, 0 otherwise
* AcceptedCmp5: 1 if customer accepted the offer in the 5th campaign, 0 otherwise
* Response: 1 if customer accepted the offer in the last campaign, 0 otherwise

### Place 📋

* NumWebPurchases: Number of purchases made through the company’s web site
* NumCatalogPurchases: Number of purchases made using a catalogue
* NumStorePurchases: Number of purchases made directly in stores
* NumWebVisitsMonth: Number of visits to company’s web site in the last month

สิ่งที่พบเจอหลังจากการตรวจสอบชุดข้อมูลแล้ว พบว่าชุดข้อมูลชุดนี้ถือได้ว่า clean พอสมควรเลย สังเกตได้ว่าจะมีการจำแนก attributes ต่างๆเป็นหมวดๆเลย เช่น People ก็จะเป็นข้อมูลที่เกี่ยวกับ Personal Information ซึ่งอาจมีลูกค้าบางคนที่ไม่เปิดเผยข้อมูลบ้าง เช่น ข้อมูลรายได้ พบว่ามี NA อยู่ด้วย ซึ่งก็สมเหตุสมผลที่ลูกค้าจะไม่เปิดเผยรายได้

### ทดลองหาว่าลูกค้าคนไหนไม่ได้ให้ข้อมูลรายได้ไว้บ้าง
```ruby
which(is.na(CPA$Income),arr.ind = T)
```
ผลลัพธ์ : `11   28   44   49   59   72   91   92   93  129  134  313  320 1380 1383 1384 1387 2060 2062 2079 2080 2082 2085 2229`\
โดยที่ตัวเลขที่แสดงผลออกมาหมายถึงเลข columns ของชุดข้อมูล เช่น column ที่ 11 คือลูกค้าที่ไม่เปิดเผยรายได้

จากการสำรวจชุดข้อมูลพบว่า ข้อมูลส่วนใหญ่ถูกเก็บเป็น Numeric เช่นใน AcceptedCmp1 ที่เก็บข้อมูลเกี่ยวกับว่าลูกค้าคนนั้นยอมรับข้อเสนอ Campaign หรือไม่ ก็เก็บเป็นตัวเลข เช่น ถ้ายอมรับเก็บเป็น 1 ไม่เก็บเป็น 0 ทำให้ไม่ต้องกังวลเก็บ letter case สำหรับการทำขั้นตอนต่อไป

### ทดลองดู Data Type ใน Dataset
```ruby
glimpse(CPA)
```
```ruby
Rows: 2,240
Columns: 29
$ ID                  <int> 5524, 2174, 4141, 6182, 5324, 7446, 965, 6177, 4855~
$ Year_Birth          <int> 1957, 1954, 1965, 1984, 1981, 1967, 1971, 1985, 197~
$ Education           <chr> "Graduation", "Graduation", "Graduation", "Graduati~
$ Marital_Status      <chr> "Single", "Single", "Together", "Together", "Marrie~
$ Income              <int> 58138, 46344, 71613, 26646, 58293, 62513, 55635, 33~
$ Kidhome             <int> 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, ~
$ Teenhome            <int> 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, ~
$ Dt_Customer         <chr> "4/9/2012", "8/3/2014", "21-08-2013", "10/2/2014", ~
$ Recency             <int> 58, 38, 26, 26, 94, 16, 34, 32, 19, 68, 11, 59, 82,~
$ MntWines            <int> 635, 11, 426, 11, 173, 520, 235, 76, 14, 28, 5, 6, ~
$ MntFruits           <int> 88, 1, 49, 4, 43, 42, 65, 10, 0, 0, 5, 16, 61, 2, 1~
$ MntMeatProducts     <int> 546, 6, 127, 20, 118, 98, 164, 56, 24, 6, 6, 11, 48~
$ MntFishProducts     <int> 172, 2, 111, 10, 46, 0, 50, 3, 3, 1, 0, 11, 225, 3,~
$ MntSweetProducts    <int> 88, 1, 21, 3, 27, 42, 49, 1, 3, 1, 2, 1, 112, 5, 1,~
$ MntGoldProds        <int> 88, 6, 42, 5, 15, 14, 27, 23, 2, 13, 1, 16, 30, 14,~
$ NumDealsPurchases   <int> 3, 2, 1, 2, 5, 2, 4, 2, 1, 1, 1, 1, 1, 3, 1, 1, 3, ~
$ NumWebPurchases     <int> 8, 1, 8, 2, 5, 6, 7, 4, 3, 1, 1, 2, 3, 6, 1, 7, 3, ~
$ NumCatalogPurchases <int> 10, 1, 2, 0, 3, 4, 3, 0, 0, 0, 0, 0, 4, 1, 0, 6, 0,~
$ NumStorePurchases   <int> 4, 2, 10, 4, 6, 10, 7, 4, 2, 0, 2, 3, 8, 5, 3, 12, ~
$ NumWebVisitsMonth   <int> 7, 5, 4, 6, 5, 6, 6, 8, 9, 20, 7, 8, 2, 6, 8, 3, 8,~
$ AcceptedCmp3        <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ~
$ AcceptedCmp4        <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ~
$ AcceptedCmp5        <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, ~
$ AcceptedCmp1        <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, ~
$ AcceptedCmp2        <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ~
$ Complain            <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ~
$ Z_CostContact       <int> 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, ~
$ Z_Revenue           <int> 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,~
$ Response            <int> 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, ~
```
จากที่สำรวจชุดข้อมูลและชนิดของข้อมูลต่างๆแล้ว ก็จะพบส่วนที่ต้องจัดการอยู่คือ format ของ Dt_Customer นั้นแตกต่างกัน ซึ่งก็ควรปรับให้มี format เดียวกันทั้งหมด
ต่อมาพวก column AccpetedCmp ไม่ได้เรียงลำดับกันเป็นระเบียบและส่วนของชื่อ column name ที่อาจปรับให้สื่อความหมายได้ยิ่งขึ้น


