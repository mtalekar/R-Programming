
#Vector - is like an array which contains elements of same 
          #type 
# A single number is also a vector in R

myfirstvector <- c(3, 54, 75, 321)
typeof(myfirstvector)
is.numeric(myfirstvector)
is.integer(myfirstvector)
is.double(myfirstvector)

v2 <- c(3L, 12L, 45L, 0L)
is.numeric(v2)
is.integer(v2)
is.double(v2)

#cannot convert character to number but can convert number 
#to character
v3 <- c("a", "b23", "Hello", 7)
is.character(v3)
is.numeric(v3)

seq()  #sequence - like ":"
rep()  #replicate function 

seq(1,15)
1:15
#above two are same, except seq function gives more flexibility 
#of adding a step and much more 
seq(1,15,2)

seq(1:15) #don't use colon in the function

z <- seq(1,15,4)
z

rep(3, 50)
d <- rep(2, 50)
d
rep("a", 5)

x <- c(18,20)
y <- rep(x, 5)
y