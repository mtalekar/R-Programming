
x <- rnorm(1:5)
x

#R specific programming loop
for(i in x){
  print(i)
} 

print(x[1])
print(x[2])
print(x[3])
print(x[4])
print(x[5])

#conventional programming loop
for(j in 1:5){
  print(x[j])
}

#-----------------------------------------------
#Compare vectorised operations and De-vectorised operations


n <-1000000
a <- rnorm(n)
b <- rnorm(n)

#vectorised operations - fast in R 
c <- a * b

#De-vectorised operations - Slow in R for large amount
d <- rep(NA, n)  #creating an empty vector of size n
for(i in 1:n){
  d[i] = a[i] * b[i]
}