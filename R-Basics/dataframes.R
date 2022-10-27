#manually select a file

stats <- read.csv(file.choose())
stats


#set working directory and read data
getwd()
setwd("D:\\Rcodes")
getwd()

rm(stats) #to remove stats object
stats <- read.csv("P2-Demographic-Data.csv")
stats

#Exploring data =========================
stats
nrow(stats)  #basicallly returns the number of rows
ncol(stats)  #returns the number of columns 
head(stats,n=10) #gives the values of first 10 rows
tail(stats,n=8) # 8 from last 
str(stats) #quick debrief 
summary(stats)

# using the $ sign


stats
head(stats)
stats[3,3]
stats[4,"Birth.rate"]

typeof(stats$Country.Name) #give the entire country name col
stats$Country.Code[2]

#identical operations
#both(things) work exactly like
stats$Country.Name
stats[,"Country.Name"]
is.vector(levels(stats$Income.Group))

#basic operations with data frames
stats[1:10,] #subsetting
is.data.frame(stats[1,])
is.data.frame(stats[,1,drop=F])


#multiply cols ,pretty useless but we can do multiply xD
head(stats)
stats$Internet.users * stats$Birth.rate

#how to add a col
head(stats)
stats$newCol <- stats$Internet.users * stats$Birth.rate
stats

#test of knowledge

stats$xyz <- 1:5
head(stats,n=12) #vector is recylced ,multiple of 5 fact

#remove a col
stats$xyz <-NULL
stats
stats$newCol<-NULL
stats

#filtering a data frame


head(stats)
filter <- stats$Internet.users < 2
stats[filter,]


stats[stats$Birth.rate > 40 & stats$Internet.users <2,]
stats[stats$Income.Group == "High income",]

levels(stats$Income.Group)


stats[stats$Country.Name == "Malta",]

#qplot
library(ggplot2)
?qplot
qplot(data = stats,x=Internet.users)
qplot(data = stats,x=Income.Group,y=Birth.rate)
qplot(data = stats,x=Income.Group,y=Birth.rate,size = I(10),colour =I("blue"))
qplot(data = stats,x=Income.Group,y=Birth.rate,geom="boxplot")




#visualize what we need 
qplot(data=stats,x=Internet.users,y=Birth.rate)

qplot(data=stats,x=Internet.users,y=Birth.rate,size=I(4),color=I("orange"))

qplot(data=stats,x=Internet.users,y=Birth.rate,size=I(5),color=Income.Group)
 

#creating data frames 
#data.frame function combine vectors to create data frame
mydf <- data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
mydf

#renaming the col names 
#colnames(mydf) <- c("country","codes","regions")
#head(mydf)


rm(mydf)
#name(treated as name) = data(treated as data)
mydf <- data.frame(country = Countries_2012_Dataset,codes = Codes_2012_Dataset,regions = Regions_2012_Dataset)
mydf

head(mydf)
tail(mydf)
summary(mydf)

#merging data frames 
head(stats)
head(mydf)
#qplot(data = mydf,x=country,y=regions,color=regions,size=I(2))

merged <- merge(stats,mydf,by.x = "Country.Code",by.y = "codes")
head(merged)
merged$country <- NULL #country names appear twice in two different columns so deleted one
head(merged)

str(merged)

#visualizing with new split 
qplot(data=merged,x=Internet.users,y=Birth.rate,size=I(4),color=regions,shape=I(15),alpha=I(0.7),main = "Birth rate vs Internet users")


#how to change the shapes 

#shape = I(4) :from 1 to 25

#use transparency
#alpha = I(0 to 1) : 0 means fully transparent and 1 means fully opaque

#how to put a title on top










