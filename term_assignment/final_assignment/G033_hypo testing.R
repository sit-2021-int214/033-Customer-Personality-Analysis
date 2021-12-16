#*ทำการตั้งสมมติฐานว่า "โดย จากการสุ่มตั่วอย่างลูกค้าจำนวน 100 คน พบว่าค่าเฉลี่ยรายได้ของลูกค้าในช่วงอายุ <1963 (baby boomers) 
#*เมื่อเทียบกับค่าเฉลี่ยรายได้ของลูกค้าในช่วงอายุ 1963-1980(genX) จะมีตั้งแต่ 53000$ ขึ้นไป
#*ในขณะที่ลูกค้า genX จะมีค่าเฉลี่ยเงินเดือนน้อยกว่า 53000$

#*กำหนดระดับนัยสำคัญ(alpha)ไว้ที่ 1% 
#*   •sd = 20979.76
#*   •u0 = 53000$
#*   •xbar = 52003.29$
#*   
#*จะสรุปได้ว่าข้อมูลนี้สามารถทำการปฏิเสธ h0 ได้หรือไม่(ก็จะหมายความว่า "ค่าเฉลี่ยเงินเดือนลูกค้า genX นั้นน้อยกว่าเดิมจริง ถ้าหากปฏิเสธ h0")

View(CPA)
meanGenBeb <- CPA %>% sample_n(100) %>% filter(YearBirth<1963) %>% 
                summarise(avg_income=mean(Income,na.rm = T)) %>% pull()
meanGenBeb

meanGenX <- CPA %>% sample_n(100) %>% filter(YearBirth>=1963 || YearBirth<=1980) %>% 
  summarise(avg_income=mean(Income,na.rm = T)) %>% pull()

meanGenX

#เปรียบเทียบจากการสุ่มตัวอย่าง 100 คนของ 2 gen นี้
meanGenBeb #54948.67
meanGenX   #52003.29

#--------------------------------------------------------------
#Hypothesis Testing
#Step 0: Assign variables
n <- 100
sd <- 20979.76
xbar <- 52003.29
u0 <- 53000

#state hypo 
#   h0: u>=53000, ha: u<53000

#level of significant(alpha) = 1%
alpha <- 1/100; alpha

#test stat
z <- (xbar - u0) / (sd/sqrt(n));  z

#finding p-value apporoch or critical val approch
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

#accepted ทั้งสองวิธี: สรุปได้ว่า "ยอมรับ h0 เงินเดือนเฉลี่ยลูกค้าจากการสุ่มตัวอย่าง 100 คนที่ีเป็น genX นั้น ไม่ได้แตกต่างจาก genBeb เท่าไหร่
#จึงหมายความได้ว่าเงินเดือนเฉลี่ยลูกค้า genX ที่น้อยกว่า 53000$ นั้น ไม่เป็นความจริง"

#ทำให้เราสามารถวิเคราะห์กลุ่มลูกค้าใน genBeb - X เลยทราบได้ว่าพวกเขายังมีรายได้ที่ไม่แตกต่างกันมาก ทำให้ทีมงานการตลาดอย่างพวกเรานั้น
#นำข้อมูลเหล่านี้มาทำการประเมินความเป็นไปได้ในการจัดทำสินค้าหรือผลิตภัณฑ์หรือการบริการ ที่สามารถตอบโจทย์กับลูกค้ากลุ่มอายุเหล่านี้ได้
#โดยไม่ส่งผลกระทบต่อฐานะการเงินของพวกเขา
