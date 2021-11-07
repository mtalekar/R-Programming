
myplot <- function(criteria, rows){
  data <- criteria[rows,, drop=F]
  matplot(t(data), type='b', pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,5), 
         pch=15:18, horiz=F)
}

myplot(Salary,1:2)


myplot1 <- function(criteria, rows=1:10){
  data <- criteria[rows,, drop=F]
  matplot(t(data), type='b', pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,5), 
         pch=15:18, horiz=F)
}

myplot1(Salary/MinutesPlayed)