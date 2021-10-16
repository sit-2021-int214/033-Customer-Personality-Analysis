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
CPA <- read.csv("URL ของ CSV ที่ Clean แล้ว")
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
