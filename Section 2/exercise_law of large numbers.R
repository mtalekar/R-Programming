rm(counter, sum)
n <- 10000
counter <- 0L
sum <- 0
x <- rnorm(n)

for(i in x){
  if(i < 1 & i > -1){
    counter <- counter + 1
    #sum <- sum`` + i
  }
}

#mean = (sum / counter)
mean = (counter / n)
mean 