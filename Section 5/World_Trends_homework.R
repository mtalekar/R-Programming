#read data from CSV
getwd()
world_trends_df <- read.csv("P2-Section5-Homework-Data.csv")

head(world_trends_df)
tail(world_trends_df)

d1960 <- world_trends_df[world_trends_df$Year=="1960",] #another option of spliting
head(d1960)
rm(d1960)

#split data based on the years 1960 and 2013
data1 <- subset.data.frame(world_trends_df, Year=="1960")
is.data.frame(data1)
tail(data1)
head(data1)

data2 <- subset.data.frame(world_trends_df, Year=="2013")
is.data.frame(data2)
tail(data2)
head(data2)

#create new data frames of life expectancy 
newdf_1960 <- data.frame(Code=Country_Code, 
                    Life_Expectancy=Life_Expectancy_At_Birth_1960)
is.data.frame(newdf_1960)
head(newdf_1960)

newdf_2013 <- data.frame(Code=Country_Code, 
                         Life_Expectancy=Life_Expectancy_At_Birth_2013)

#merge data frames of life expectancy and fertility 
merged_1960 <- merge.data.frame(data1, newdf_1960, by.x="Country.Code",
                                by.y="Code")
head(merged_1960)

merged_2013 <- merge.data.frame(data2, newdf_2013, by.x="Country.Code",
                                by.y="Code")
head(merged_2013)

#plot scatterplot for 1960
qplot(data=merged_1960, x=Fertility.Rate, y=Life_Expectancy, size=I(4), 
      color=Region, shape=I(19), alpha=I(0.5), 
      main="Fertility Rate vs Life Expectancy")

#plot scatterplot for 2013
qplot(data=merged_2013, x=Fertility.Rate, y=Life_Expectancy, size=I(4), 
      color=Region, shape=I(19), alpha=I(0.5), 
      main="Fertility Rate vs Life Expectancy")