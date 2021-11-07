
x <- c("a", "b","c","d","e")
x
x[c(1,5)]
x[1]

Games
Games[1:3, 6:10]
Games[-2:-9,]     #another way Games[c(1,10),]
Games[,c("2008","2009")]
Games[1,]

is.matrix(Games[1,])
is.vector(Games[1,])

Games[2,5]
Games[1,5]

Games[2,5, drop=F]
Games[1,5, drop=F]

#for single digit argument in square brackets eg line number 16/17
#R by default drops another axis and converts the matrix into a 
#vector; using a drop argument will disable that 