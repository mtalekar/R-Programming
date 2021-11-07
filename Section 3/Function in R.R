
rnorm()

c()

seq()
rep()

print()

is.numeric()
is.integer()
is.double()
is.character()

typeof()

sqrt()
paste()

#? - Help syntax

?rnorm()

rnorm(8,9,10)
rnorm(n=5, mean = 10, sd = 8)
rnorm(n=5, sd = 8, mean = 10)
rnorm(n=5, sd = 8)

?c()

?seq()

seq(10,20,3)
seq(from=10,to=20,by=3)
seq(from=10,to=20, length.out = 100)

x <- c("a", "b", "c")
seq(from=10,to=20, along.with = x)

?rep()
rep(5:6,10)
rep(5:6,times=10)
rep(5:6,each=10)
rep(x, each=5)
rep(x, times=5)

?sqrt()
a <- seq(from=10,to=20, along.with = x)
b <- sqrt(a)
b