
?read.csv()

#Method 1: Select the file manually
stats <- read.csv(file.choose())
stats

#Method 2: Set Working Directory and read data
getwd()
#Windows
setwd("G:\\Masters\\Learning\\R Programming\\Section 5")
getwd()
#Mac
setwd("/Users/manish/Desktop/R Programming")

rm(stats)
stats

stats <- read.csv("DemographicData.csv")
stats

#------------------------------------------- Exploring Data

stats
nrow(stats)
ncol(stats)
head(stats)
tail(stats)
head(stats, n=10)
tail(stats, n=8)
str(stats)  #structure
?runif() #random uniform distribution
summary(stats)

#---------------------------------------- using $ sign

stats
head(stats)
stats[3,3]
stats[3, "Birth.rate"]
stats$Internet.users    #use to get single column
stats$Internet.users[2]
stats[,"Internet.users"]
levels(stats$Income.Group)
is.data.frame(stats)

#---------------------------------------- Basic Operations with Data Frame

stats[1:10,]  #subsetting
stats[3:9,]
stats[c(4,100),]

stats[1]    #gave first column
is.data.frame(stats[1])
stats[1,]

is.data.frame(stats[1,])    #no need of drop=F
stats[,1]
is.data.frame(stats[,1])
stats[,1, drop=F]
is.data.frame(stats[,1, drop=F])

#multiply columns 

head(stats)

stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

#adding a column

stats$mycalc <- stats$Birth.rate * stats$Internet.users
head(stats)

#knowledge test

stats$xyz <- 1:5
head(stats, n=12)

#remove a column

head(stats)
stats$xyz <- NULL
stats$mycalc <- NULL
head(stats)

#--------------------Filtering Data Frame

head(stats)
filter <- stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate > 40, ]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2, ]
stats[stats$Income.Group == "High income",]

stats[stats$Country.Name == "Malta",]

#------------------------------ qplot()
install.packages("ggplot2")
library("ggplot2")

?qplot
qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=3)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(10))
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(2), 
      color="blue")
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(2), 
      color=I("blue"))
qplot(data=stats, x=Income.Group, y=Birth.rate, geom="boxplot")
#qplot(data=stats, x=Income.Group, y=Birth.rate, geom="scatterplot")

#------------------------------ Visualizing with qplot()

qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(4))
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(4), 
      color=I("darkgreen"))
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(4), 
      color=Income.Group)

#------------------------------ Creating Data Frames

mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, 
                   Regions_2012_Dataset)
head(mydf)
#colnames(mydf) <- c("Countries", "Codes", "Regions")
#head(mydf)
rm(mydf)

mydf <- data.frame(Countries=Countries_2012_Dataset, Codes=Codes_2012_Dataset, 
                   Regions=Regions_2012_Dataset)

#Line number 133 approach works with cbind and rbind function as well

head(mydf)
tail(mydf)
summary(mydf)

#-------------------------------- Merging Data Frames

head(stats)
head(mydf)

merged_df <- merge(stats, mydf, by.x="Country.Code", by.y="Codes")

head(merged_df)

merged_df$Countries <- NULL
str(merged_df)

#--------------------------------- Visualizing with new split 

qplot(data=merged_df, x=Internet.users, y=Birth.rate, size=I(4), 
      color=Regions)

#1. Shapes
qplot(data=merged_df, x=Internet.users, y=Birth.rate, size=I(4), 
      color=Regions, shape=I(15))
#google R shapes ggplot, you will get the numbers for different shapes

#2. Transparency 
qplot(data=merged_df, x=Internet.users, y=Birth.rate, size=I(4), 
      color=Regions, shape=I(19), alpha=I(0.5))

#3. Title 
qplot(data=merged_df, x=Internet.users, y=Birth.rate, size=I(4), 
      color=Regions, shape=I(19), alpha=I(0.5), 
      main="Birth Rate vs Internet Users")