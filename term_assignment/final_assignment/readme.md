#  Hypothesis Testing | Customer Posonality Analysis Dataset
### Step to do:

0. Assign variables:
    - μ0 or p0
    - x̄ or P̅
    - n
    - sd
    - α
1. State the hypothesis
2. Select Level of significance
3. Select Test statistic
    - z <- (xbar - u0) / (sd/sqrt(n))
4. Finding P-value approach or Critical Value approach
    - P-value for Z: pvalue <- pnorm(z)
    - Critical Value for Z: zalpha <- qnorm(alpha)
    - P-value for T: pvalue <- pt(q, df,lower.tail = TRUE)
    - talpha for T: talpha <- qt(p, df, lower.tail = TRUE)
5. Compare
6. Conclusion
## Define a question

ตั้งสมมติฐานว่า 
"จากการสุ่มตั่วอย่างลูกค้าจำนวน 100 คน พบว่าค่าเฉลี่ยรายได้ของลูกค้าในช่วงอายุ <1963 (baby boomers) 
เมื่อเทียบกับค่าเฉลี่ยรายได้ของลูกค้าในช่วงอายุ 1963-1980(genX) จะมีตั้งแต่ 53000$ ขึ้นไป
ในขณะที่ลูกค้า genX จะมีค่าเฉลี่ยเงินเดือนน้อยกว่า 53000$ "
  - กำหนดระดับนัยสำคัญ(alpha)ไว้ที่ 1% 
  - sd = 20979.76
  - u0 = 53000$
  - xbar = 52003.29$

## Steps
Step 0: Assign variables 
```ruby
n <- 100
sd <- 20979.76
xbar <- 52003.29
u0 <- 53000
```

Step 1: State the hypothesis
```ruby
#   h0: u>=53000, ha: u<53000
```

Step 2: Level of significance
```ruby
#level of significant(alpha) = 1%
alpha <- 1/100; alpha
```

Step 3: Test statistic
```ruby
z <- (xbar - u0) / (sd/sqrt(n));z
```

Step 4: Finding P-value approach or Critical Value approach
```ruby
# P-value approach
pvalue <- pnorm(z); pvalue

# Critical Value approach
zalpha <- qnorm(alpha);zalpha
```

Step 5: Compare
```ruby
#pval approach
pval <- pnorm(z); pval
#cri val app
zal <- qnorm(alpha); zal;

#compare 

#using pval app
pvalAppr <- if(pval<=alpha){
  print("Reject h0")
}else{
  print("Accept h0")
}

#using zal app
zalAppr <-  if(z<=zal){
  print("Reject h0")
}else{
  print("Accept h0")
}

pvalAppr
zalAppr
```
Step 6: Conclusion

accepted h0 ทั้งสองวิธี: สรุปได้ว่า "ยอมรับ h0 เงินเดือนเฉลี่ยลูกค้าจากการสุ่มตัวอย่าง 100 คนที่เป็น genX นั้น ไม่ได้แตกต่างจาก genBeb เท่าไหร่
จึงหมายความได้ว่าเงินเดือนเฉลี่ยลูกค้า genX ที่น้อยกว่า 53000$ นั้น ไม่เป็นความจริง"

ทำให้เราสามารถวิเคราะห์กลุ่มลูกค้าใน genBeb - X เลยทราบได้ว่าพวกเขายังมีรายได้ที่ไม่แตกต่างกันมาก ทำให้ทีมงานการตลาดอย่างพวกเรานั้น
นำข้อมูลเหล่านี้มาทำการประเมินความเป็นไปได้ในการจัดทำสินค้าหรือผลิตภัณฑ์หรือการบริการ ที่สามารถตอบโจทย์กับลูกค้ากลุ่มอายุเหล่านี้ได้
โดยไม่ส่งผลกระทบต่อฐานะการเงินของพวกเขา


