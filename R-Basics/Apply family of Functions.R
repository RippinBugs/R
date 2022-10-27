getwd()
setwd("D:\\Rcodes\\weatherData")
getwd()
setwd(".\\Weather Data") #this . actually means D:\\Rcodes ,just to be more efficient we use dot
getwd()

#just checking before using the row.names =1
Chicago <- read.csv("Chicago-F.csv")
Chicago
Chicago <- read.csv("Chicago-F.csv",row.names = 1) 
Chicago
#row.names = 1 means take the names from the column 1 and set those as row names
NewYork <- read.csv("NewYork-F.csv",row.names = 1) 
Houston <- read.csv("Houston-F.csv",row.names = 1) 
SanFrancisco <- read.csv("SanFrancisco-F.csv",row.names = 1) 

#check
Chicago
NewYork
Houston
SanFrancisco

#check these are data frames or not
is.data.frame(Chicago)

#let's make these matrices
Chicago <- as.matrix(Chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)

#checking these are converted to matrices or not
is.matrix(Chicago)

#lets put all of these in a list
Weather <- list(Chicago = Chicago,NewYork = NewYork,Houston = Houston,SanFrancisco = SanFrancisco)
Weather

#lets try something out 
Weather[3]
Weather[[3]]
Weather$Houston

#What is the apply family 
#apply(Matrix_name,1,mean) #get the mean of everyrows of matrix but here 1 means it will give the rows mean
#apply(Matrix_name,1,max) # and these give a vector
#apply(Matrix_name,2,mean) #get the mean of every columns of matrix but here 1 means it will give the columns mean

#the apply family
####apply - use on a matrix : either on the rows or the columns
#tapply - use on a vector to extract subgroups and apply a function to them
#eapply  - use on an environment (E)
#####lapply -apply a function to elements of a list(L)
#####sapply -   a version of lapply . Can simplify (S) the result so it's not presented as a list
#vapply - has a pre-specified type of return value
#replicate - run a function several times. Usually used with generation of random variables
#by - use on data frames . Same concept as in group by in SQL
#mapply - multivariate (M) version of sapply. Arguments can be recycled
#rapply - Recursive (R) version of lapply 

#using apply()

apply(Weather$Chicago, 1, mean)
#check
mean(Weather$Chicago["DaysWithPrecip",])
#analyze one city

apply(Weather$Chicago,1,max)
apply(Weather$Chicago,1,min)

#for practice #this doesn't make sense logically with the value but still just for practice 
apply(Weather$Chicago,2,min)
apply(Weather$Chicago,2,max)

#compare:
apply(Weather$Chicago,1,mean)
apply(Weather$NewYork,1,mean)
apply(Weather$Houston,1,mean)
apply(Weather$SanFrancisco,1,mean)
                                    #<<<<< (nearly) deliv 1: but there is a faster way

#Recreating the apply function with loops ( advaced topic)
Chicago
#find the mean of every row:
#1. via loop
output <- NULL #preparing an empty vector
for (i in 1:nrow(Chicago)){
    output[i] <- mean(Chicago[i,])
}
output

#give the row names of chicago in output
names(output) <- rownames(Chicago)
output

#2. all these lines can be done by using just a single apply function
apply(Chicago,1,mean)

#####using LAPPLY()
Chicago
t(Chicago) #transpose of chicago
Weather
lapply(Weather, t) #take every elements(chicago,houston,sanfrancisco,newYork) of list weather and then transpose

myNewlist <- lapply(Weather, t)
myNewlist

#example 2
Chicago
rbind(Chicago,newrow = 1:12)  #create another row at chicago
lapply(Weather,rbind,newRow = 1:12)  #create new row at every element of the list

#example 3
rowMeans(Chicago)
lapply(Weather,rowMeans) #identical to apply(Weather,1,mean)
                            #<<<<< (nearly) deliv1: even better , but will improve further


#rowMeans()
#colMeans()
#rowSums()
#colSums()


#combining lapply with [] operator
Weather
#both are same
Weather[[1]][1,1]
Weather$Chicago[1,1]
lapply(Weather,"[",1,1) #get you the first element of list's each component
lapply(Weather,"[",1,) #gives you the first row of list's each component

#test 
Weather
lapply(Weather,"[", ,3) #gives a warning but its okay 


#adding your own functions
lapply(Weather,rowMeans)
lapply(Weather,function(x) x[1,])  #)  body of the function )
lapply(Weather,function(x) x[4,])
lapply(Weather,function(x) x[,12])

#test 
#first two rows difference for each list element
Weather
lapply(Weather,function(x) x[1,] - x[2,])
lapply(Weather,function(x) round( (x[1,] - x[2,]) / x[2,] , 2))  #round takes two arguments 
                                                        #<<<deliv2: temp fluctuations. Will improve
#using sapply()
Weather
#avgHigh_F for july
lapply(Weather,"[",1,7)
sapply(Weather,"[",1,7)  #gives a more simplified version of lapply and it either gives a vector or matrix not a list like lapply

#avgHigh_F for the fourth quarter
lapply(Weather,"[",1,10:12)
sapply(Weather,"[",1,10:12)

#another example
lapply(Weather,rowMeans)
round(sapply(Weather,rowMeans),2)   #<<deliv1: Awesome
#another example
lapply(Weather,function(x) round( (x[1,] - x[2,]) / x[2,] , 2))
sapply(Weather,function(x) round( (x[1,] - x[2,]) / x[2,] , 2))

#by the way
sapply(Weather,rowMeans,simplify = F) #when we use simplify = F then it works just as lapply


#Nesting apply function
Weather
apply(Chicago,1,max)

#apply across whole list
lapply(Weather,apply,1,max)  #preferred approach
#        it takes the elements of weather like chicago ,houston and put in  
#        to apply(chicago/houston/sanfrancisco,1,max) and then get us the desired result 
lapply(Weather,function(x) apply(x,1,max)) #this works exactly like the upper one



#tidy up:

sapply(Weather,apply,1,max) #deliv 3.
sapply(Weather,apply,1,min) #deliv 4.

#which.max() & which.min() 
#advanced topic

which.max(Chicago[1,])  #gets you the maximum value's index from the first row
names(which.max(Chicago[1,])) #gets you the header name of the max value 

#by the sounds of it:
#we will have : apply - to iterate over rows of the matrix
#and we will have : lapply or sapply - to iterate over components of the list

apply(Chicago,1,function(x) names(which.max(x)))  #x works as rows
lapply(Weather,function(z) apply(z,1,function(x) names(which.max(x)))) #z works as row elements
sapply(Weather,function(z) apply(z,1,function(x) names(which.max(x))))



# the end 











