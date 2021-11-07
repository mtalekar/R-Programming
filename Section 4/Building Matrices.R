#matrix contains elements of same data type

Salary
Games
MinutesPlayed

#3 ways of creating matrix
?rbind #combine by rows and columns 
?matrix
?cbind

#matrix
mydata <- 1:20
mydata

A <- matrix(mydata, 4, 5)
A
B <- matrix(mydata, 4, 5, byrow = TRUE)
B

A[2,3]
B[2,5]


#rbind

r1 <- c("I", "am", "happy")
r2 <- c("what", "a","day")
r3 <- c(1,2,3)

C <- rbind(r1, r2, r3)
C

#cbind

c1 <- 1:5
c2 <- -1:-5

D <- cbind(c1, c2)
D