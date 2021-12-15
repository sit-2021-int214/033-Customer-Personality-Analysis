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

///ตั้งสมมติฐาน


## Steps
Step 0: Assign variables 
```ruby
// code here
```

Step 1: State the hypothesis
```ruby
Ho : μ ≥ 69420
Ha : μ < 69420
```

Step 2: Level of significance
```ruby
alpha <- 
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
# Using p-value approach
if(pvalue<=alpha){
  print("Reject H0")
}else{
  print("Accept H0")
}

# Using critical value
if(z<=zalpha){
  print("Reject H0")
}else{
  print("Accept H0")
}
```
Step 6: Conclusion
//explain


