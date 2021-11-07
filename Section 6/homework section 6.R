getwd()
setwd("G:\\Masters\\Learning\\R Programming\\Section 6")
hw_movies <- read.csv("Section6-Homework-Data.csv")

head(hw_movies)
tail(hw_movies)
str(hw_movies)

hw_movies$Day.of.Week <- factor(hw_movies$Day.of.Week)
hw_movies$Director <- factor(hw_movies$Director)
hw_movies$Genre <- factor(hw_movies$Genre)
hw_movies$Studio <- factor(hw_movies$Studio)

colnames(hw_movies) <- c("DayofWeek", "Director", "Genre", "Title", "ReleaseDate",
                         "Studio", "AdjustedGrossMillions", "BudgetMillions",
                         "GrossMillions", "IMBDrating", "MovieLensRating",
                         "OverseasMillions", "OverseasPercent", "ProfitMillions", 
                         "ProfitPercent", "RuntimeMinutes", "USmillions", 
                         "GrossPercentUS")

data_action <- subset(hw_movies, Genre == "action")
data_adventure <- subset(hw_movies, Genre == "adventure")
data_animation <- subset(hw_movies, Genre == "animation")
data_comedy <- subset(hw_movies, Genre == "comedy")
data_drama <- subset(hw_movies, Genre == "drama")

data_genre <- do.call("rbind", list(data_action, data_adventure, 
                                    data_animation, data_comedy, data_drama))

studio_bvs <- subset(data_genre, Studio == "Buena Vista Studios")
studio_fox <- subset(data_genre, Studio == "Fox")
studio_pp <- subset(data_genre, Studio == "Paramount Pictures")
studio_sony <- subset(data_genre, Studio == "Sony")
studio_universal <- subset(data_genre, Studio == "Universal")
studio_wb <- subset(data_genre, Studio == "WB")

data_studio <- do.call("rbind", list(studio_bvs, studio_fox, studio_pp, 
                                     studio_sony, studio_universal, studio_wb))


v <- ggplot(data=data_studio, aes(x=Genre, y=GrossPercentUS))

q <- v + geom_jitter(aes(color=Studio, size=BudgetMillions)) + 
  geom_boxplot(alpha=0.7, outlier.colour = NA) + 
  xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre") +
  theme(axis.title.x = element_text(color="darkblue", size=30), 
        axis.title.y = element_text(color="darkblue", size=30),
        axis.text.x = element_text(size=20), 
        axis.text.y = element_text(size=20),
        
        plot.title = element_text(color="black",
                                  size=40,
                                  family="Comic Sans MS"))

q$labels$size = "Budget $M"
q