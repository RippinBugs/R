getwd()
setwd("D:\\Rcodes")
getwd()

movies <- read.csv("P2-Movie-Ratings.csv")
head(movies)

colnames(movies)
colnames(movies) <- c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")
head(movies)
tail(movies)
str(movies)
levels(movies$Film)

#Factors
#converting a numerical variable to a factor
summary(movies)
factor(movies$Year)
movies$Year <- factor(movies$Year)
str(movies)
summary(movies)


#Aesthetics
library(ggplot2)
ggplot(data = movies,aes(x=CriticRating,y=AudienceRating,colour = Genre,size=Genre)) +
    geom_point()

#add size in a better way
ggplot(data = movies,aes(x=CriticRating,y=AudienceRating,colour = Genre,size=BudgetMillions)) +
    geom_point()


#plotting with layers

p <- ggplot(data = movies,aes(x=CriticRating,y=AudienceRating,colour = Genre,size=BudgetMillions)) #creating an object
#adding point
p + geom_point()

#adding lines
p + geom_line()

#adding layers
#firstly plots the lines then on top of that plots the dots
p + geom_line() + geom_point()
#first uses point and then overlaps the points with lines
p + geom_point() + geom_line()

#overriding aesthetics
q <- ggplot(data = movies,aes(x=CriticRating,y=AudienceRating,colour=Genre,size=BudgetMillions)) #mapping aesthetics
q + geom_point()

#overriding aes 
#example1
q + geom_point(aes(size=CriticRating))

#example 2
#we are overriding but not changing the objects
q + geom_point(aes(colour = BudgetMillions)) 

#thats why this gives the initial result
q + geom_point()

#example 3
q + geom_point(aes(x=BudgetMillions)) #but this doesn't change the 
#name of the x axis so we need this + xlab("Budget millions $$$")

q + geom_point(aes(x=BudgetMillions)) + xlab("Budget millions $$$")

#example 4 
q + geom_line() + geom_point()
#reducing the line size
q + geom_line(size=0.5) + geom_point() #setting aesthetics

#mapping vs setting
r <- ggplot(data = movies,aes(x=CriticRating,y=AudienceRating))
r
r + geom_point()
r + geom_point(aes(size = Genre))
#mapping
r + geom_point(aes(colour = Genre))

#setting
r + geom_point(colour = "Dark Green",size = 4)
r + geom_point(size = 4)

#history and density charts
head(movies)
s <- ggplot(data = movies ,aes(x=BudgetMillions))
s + geom_histogram(binwidth = 10)

#adding color
#fill uses as filling colors
s + geom_histogram(binwidth = 10,aes(fill = Genre))

#adding a border
s + geom_histogram(binwidth = 10,aes(fill = Genre),colour = "Black")


#density
s + geom_density(aes(fill = Genre),position = "stack")


#starting layer tips 

t <- ggplot(data = movies)
t + geom_histogram(binwidth = 10, 
                   aes(x=AudienceRating),fill ="Green"
                   , colour = "Black")


#statistical layers

u <- ggplot(data = movies,aes(x=CriticRating,y=AudienceRating,colour=Genre))
u + geom_point() + geom_smooth(fill=NA)


#boxplots
u <- ggplot(data = movies,aes(x=Genre,y=AudienceRating,colour = Genre))
u + geom_boxplot()
u + geom_boxplot(size = 1.5) + geom_point()

#tip / hack
#when we use combinational boxplots
u + geom_jitter() + geom_boxplot(size = 1.2,alpha = 0.6)  


ch <- ggplot(data = movies ,aes(x=Genre,y=CriticRating,colour=Genre))
ch + geom_boxplot(size=1.2) + geom_jitter()

#using facets

v<- ggplot(data = movies,aes(x=BudgetMillions))
v + geom_histogram(binwidth =  10,aes(fill = Genre),colour = "Black")

#facets

v + geom_histogram(binwidth =  10,aes(fill = Genre),colour = "Black") +
    facet_grid(Genre~.,scales = "free")

v + geom_histogram(binwidth =  10,aes(fill = Genre),colour = "Black") +
    facet_grid(.~Genre,scales = "free")

#scatterplots

w <-ggplot(data = movies,aes(x=CriticRating,y=AudienceRating,colour = Genre))
w + geom_point()

w + geom_point(size = 2.5) + facet_grid(Genre~.)

w + geom_point(size = 2.5) + facet_grid(.~Year)

w + geom_point(size = 2.5) + geom_smooth() + facet_grid(Genre~Year)

w + geom_point(aes(size = BudgetMillions)) + geom_smooth(fill = NA) + facet_grid(Genre~Year)

w + geom_point(aes(size = BudgetMillions)) + geom_smooth(fill = NA) + facet_grid(Genre~Year,scales = "free")
 
#coordinates

#limits
m <-ggplot(data = movies,aes(x=CriticRating,y=AudienceRating,size = BudgetMillions,colour=Genre))
m + geom_point() + xlim(50,100) + ylim(50,100) #that means 50 to 100 

#wont always work
k <- ggplot(data =movies,aes(BudgetMillions))
k + geom_histogram(binwidth = 10,aes(fill = Genre),colour = "Black")

k + geom_histogram(binwidth = 10,aes(fill = Genre),colour = "Black") + ylim(0,50)


#instead - zoom
#here we are just zoomed in 
k + geom_histogram(binwidth = 10,aes(fill = Genre),colour = "Black") + 
    coord_cartesian(ylim = c(0,50))



#just an exercise xD
w + geom_point(aes(size = BudgetMillions)) +
    geom_smooth(fill = NA) + 
    facet_grid(Genre~Year,scales = "free") +
    coord_cartesian(ylim = c(0,100))



#perfecting by adding themes
o <- ggplot(data =  movies,aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth = 10,aes(fill = Genre), colour ="Black")

#labeling axes
h + 
    xlab("Money Axis") +
    ylab("Number of Movies") 
    

#label formatting
#making things more beautiful 
h + 
    xlab("Money Axis") +
    ylab("Number of Movies") +
    theme(axis.title.x = element_text(colour="DarkGreen",size = 30),
          axis.title.y = element_text(colour="Purple",size = 30),
          axis.text.x = element_text(size = 20),
          axis.text.y = element_text(size = 20),
          legend.title = element_text(size = 15),
          legend.position = c(1,1),
          legend.text = element_text(size = 20),
          legend.justification = c(1,1))



?theme()

#how to add a title

h + 
    xlab("Money Axis") +
    ylab("Number of Movies") +
    ggtitle("Movie Budget Distribution") +
    theme(axis.title.x = element_text(colour="DarkGreen",size = 30),
          axis.title.y = element_text(colour="Purple",size = 30),
          axis.text.x = element_text(size = 20),
          axis.text.y = element_text(size = 20),
          legend.title = element_text(size = 15),
          legend.text = element_text(size = 20),
          legend.position = c(1,1),
          legend.justification = c(1,1),
          plot.title = element_text(colour = "Red",
                                    size = 35,
                                    family = "Courier"))

























