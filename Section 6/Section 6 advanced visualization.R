getwd()
setwd("G:/Masters/Learning/R Programming/Section 6")

movies <- read.csv("P2-Movie-Ratings.csv")
head(movies)

colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", 
                      "BudgetMillions", "Year")
head(movies)
tail(movies)
str(movies)
summary(movies)

factor(movies$Year)  #converted to factors
movies$Year <- factor(movies$Year)
movies$Genre <- factor(movies$Genre)
movies$Film <- factor(movies$Film)

summary(movies)
str(movies)

#-------------------------- Aesthetics

library(ggplot2)

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

#add geometry

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) + 
  geom_point()

#add colours

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre)) + 
  geom_point()

#add size

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre,
                        size=Genre)) + 
  geom_point()

#add size - better way

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre,
                        size=BudgetMillions)) + 
  geom_point()

#-------------------------------- plotting with layers 

p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre,
                             size=BudgetMillions))

p 

#point
p + geom_point()

#lines

p + geom_line()

#multiple layers

p + geom_point() +geom_line()
p + geom_line() +geom_point()

#ggplot works in layers, that is why this is how we plot

#------------------------------ Overriding Aesthetics 

q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre,
                             size=BudgetMillions))

#add geom layer
q + geom_point()

#overriding aesthetics
#ex1
q + geom_point(aes(size=CriticRating))

#ex2
q + geom_point(aes(color=BudgetMillions))

#q remains the same 
q + geom_point()

#ex3
q + geom_point(aes(x=BudgetMillions))
#x label won't change because of q
q + geom_point(aes(x=BudgetMillions)) +     #mapping aesthetics 
  xlab("Budget Millions $$$")

#ex4
q + geom_line() +geom_point()
#reduce line size
q + geom_line(size=1) +geom_point()         #setting 

#--------------------------- Mapping vs Setting 

r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

#add colour
#1. Mapping(what we have done above)
r + geom_point(aes(color=Genre))
#2. Setting
r + geom_point(color="Darkgreen")
#ERROR
r + geom_point(aes(color="Darkgreen"))    #this is actually mapping the "Darkgreen"
                                          #to the variable color - check plot legend

#1. Mapping 
r + geom_point(aes(size=BudgetMillions))
#2. Setting
r + geom_point(size=10)
#ERROR
r + geom_point(aes(size=10))

#------------------------------ Histograms and Density Charts

s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth = 10)

#add color
s + geom_histogram(binwidth = 10, fill="green")    #setting

s + geom_histogram(binwidth = 10, aes(fill=Genre))  #mapping

#add border
s + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black")

#density chart

s + geom_density()
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position="stack")

#----------------------------- Starting Layer Tips

t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth = 10, color="blue", fill="white")

#another way

t <- ggplot(data=movies)
t + geom_histogram(binwidth = 10, 
                   aes(x=AudienceRating), 
                   color="blue", fill="white")

t + geom_histogram(binwidth = 10, 
                   aes(x=CriticRating), 
                   color="blue", fill="white")

#----------------------------- Statistical Transformation

?geom_smooth

u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                             color=Genre))
u + geom_point() + geom_smooth()
u + geom_point() + geom_smooth(fill=NA)

#boxplots
u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating, 
                              color=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()

#tip/hack
u + geom_boxplot(size=1.2) + geom_jitter()
#another way
u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)   #alpha is for transperency 

#--------------------------- Using Facets

v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill=Genre), 
                   color="Black")

#facets
v + geom_histogram(binwidth = 10, aes(fill=Genre), 
                   color="Black") + 
  facet_grid(Genre~.)     #all the subgraphs are having same scales
#which makes few plots too small, ti fix this add argument scales to 
#facet grid that will let the individual subgraph to have their own scales

v + geom_histogram(binwidth = 10, aes(fill=Genre), 
                   color="Black") + 
  facet_grid(Genre~., scales="free")

#scatterplots

w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                             color=Genre))
w + geom_point(size=3)

#facets
w + geom_point(size=3) + 
  facet_grid(Genre~.)

w + geom_point(size=3) + 
  facet_grid(.~Year)

w + geom_point(size=3) + 
  facet_grid(Genre~Year)

w + geom_point(size=3) + 
    geom_smooth() +
    facet_grid(Genre~Year)

w + geom_point(aes(size=BudgetMillions)) + 
  geom_smooth(fill=NA) +
  facet_grid(Genre~Year)

#-------------------------- Coordinates

m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                             size=BudgetMillions, color=Genre))
m + geom_point()

m + geom_point() +
  xlim(50,100)

m + geom_point() +
  xlim(50,100) + ylim(50,100)

#won't work well always

n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth = 10, aes(fill=Genre), 
                   color="Black")

n + geom_histogram(binwidth = 10, aes(fill=Genre), 
                   color="Black") +
  ylim(0, 50)       #above data has been cutoff

#instead zoom

n + geom_histogram(binwidth = 10, aes(fill=Genre), 
                   color="Black") +
  coord_cartesian(ylim=c(0,50))

w + geom_point(size=3) + 
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0,100))

#---------------------------- Theme

o <- ggplot(data=movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black")

h

#axes label

h + xlab("Money axis") +
  ylab("Number of Movies") 

#label formatting 
h + xlab("Money axis") +
  ylab("Number of Movies") +
  theme(axis.title.x=element_text(color="Darkgreen", size=30), 
        axis.title.y=element_text(color="red", size=30))

#tick mark formatting 
h + xlab("Money axis") +
  ylab("Number of Movies") +
  theme(axis.title.x=element_text(color="Darkgreen", size=30), 
        axis.title.y=element_text(color="red", size=30),
        axis.text.x = element_text(size=20), 
        axis.text.y = element_text(size=20))

?theme  

#legend formatting 
h + xlab("Money axis") +
  ylab("Number of Movies") +
  theme(axis.title.x=element_text(color="Darkgreen", size=30), 
        axis.title.y=element_text(color="red", size=30),
        axis.text.x = element_text(size=20), 
        axis.text.y = element_text(size=20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1))


#Title formatting 
h + xlab("Money axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x=element_text(color="Darkgreen", size=30), 
        axis.title.y=element_text(color="red", size=30),
        axis.text.x = element_text(size=20), 
        axis.text.y = element_text(size=20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(color="darkblue",
                                  size=40,
                                  family="Courier"))