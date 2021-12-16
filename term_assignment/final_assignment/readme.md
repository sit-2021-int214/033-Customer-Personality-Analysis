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
"จากการสุ่มตั่วอย่างลูกค้า`จำนวน 100 คน` พบว่าค่าเฉลี่ยรายได้ครัวเรือนต่อปีของลูกค้าที่มี`ปีเกิดน้อยกว่า 1963 (baby boomers)` 
เมื่อเทียบกับค่าเฉลี่ยรายได้ครัวเรือนต่อปีของลูกค้าในช่วงปีเกิด 1963-1980(genX) แต่เดิมนั้น`มีตั้งแต่ 53000$` ขึ้นไป 
ในขณะที่ลูกค้า genX ที่มี<br>`ปีเกิดตั้งแต่ 1963 ขึ้นไปจนถึง 1980` จะมีค่าเฉลี่ยรายได้ครัวเรือนต่อปี`น้อยกว่า 53000$ (ซึ่งก็คือ 52003.29$)`
หาส่วนเบี่ยงเบนมาตรฐานของข้อมูลเหล่านี้ได้เท่ากับ <b>20979.76$</b> และตั้งสมมติฐานคาดการณ์ได้ว่า `"ลูกค้า genX จะมีรายได้ฯ น้อยกว่า 53000$ เมื่อเทียบกับ genBab"`

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

accepted h0 ทั้งสองวิธี: สรุปได้ว่า "ยอมรับ h0 รายได้ครัวเรือนต่อปีโดยเฉลี่ยของลูกค้าจากการสุ่มตัวอย่าง 100 คนพบว่ารายได้ครัวเรือนต่อปีโดยเฉลี่ยของลูกค้า genX ที่น้อยกว่า 53000$ นั้น ไม่เป็นความจริง หรือก็คือมีรายได้ครัวเรือนต่อปีมากกว่า genBab"

ทำให้เราสามารถวิเคราะห์กลุ่มลูกค้าใน genBab - X เลยทราบได้ว่าลูกค้าgenX มีรายได้ครัวเรือนต่อปีที่มากกว่า genBab ทำให้ทีมงานการตลาดอย่างพวกเรานั้น
นำข้อมูลเหล่านี้มาทำการประเมินความเป็นไปได้ในการจัดทำสินค้าหรือผลิตภัณฑ์หรือการบริการ ที่สามารถตอบโจทย์กับลูกค้ากลุ่มอายุเหล่านี้ได้
โดยไม่ส่งผลกระทบต่อฐานะการเงินของพวกเขา


