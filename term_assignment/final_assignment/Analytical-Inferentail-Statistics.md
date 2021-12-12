#  Hypothesis Testing | Customer Posonality Analysis Dataset
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


