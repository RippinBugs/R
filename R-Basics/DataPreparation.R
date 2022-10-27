?options()
options(max.print = 99999)
getwd()
setwd("D:\\Rcodes")
getwd()

#basic : fin <- read.csv("P3-Future-500-The-Dataset.csv")
#giving missing data NA to fill the spreadshits data
fin <- read.csv("P3-Future-500-The-Dataset.csv",na.strings = c(""))
head(fin)
str(fin)
summary(fin)

#factor refresher
#changing from non-actor to factor
fin$ID <- factor(fin$ID)
str(fin)
fin$Profit <- factor(fin$Profit)
fin$Profit <- as.numeric(as.character(fin$Profit))

fin$Inception <- factor(fin$Inception)
str(fin)

summary(fin)

#The factor variable trap (FVT)
#converting into numerics from characters(this part has nothing to do with the fvt)
a <- c("1","2","3","3","5")
a
typeof(a)

b <- as.numeric(a) #converts into numerical values
b
typeof(b)

#converting into numerics from factors
z <- factor(c("12","22","33","33","15")) #factorizing
z #provides factors 12,22,15,33 which are cagtegories

levels(z) #provides us the number of levels  12,22,15,33 with quotes
typeof(z) #integer because it's factorized i.e 12 as 1,22 as 3,33as 4,15 as 2 (more like indexing the unique items)

y <- as.numeric(z) #this z is already categorized so as.numeric fn converts z into category like 1,2,3.... and puts into y
y #it gives the (kind of)index of factors
typeof(y)

#correct way fact->char->numeric
x <- as.numeric(as.character(z))
x
typeof(x) #double 

#FVT example
head(fin)
str(fin)
fin$Profit <- factor(fin$Profit)

str(fin)

#fin$Profit <- as.numeric((fin$Profit) #dangerous
str(fin)
head(fin)


#Gsub() and sub()
fin$Revenue <- gsub("\\$","",fin$Revenue)  #escape sequence 
fin$Revenue <- gsub(",","",fin$Revenue)
head(fin)


fin$Expenses <- gsub(",","",fin$Expenses)
fin$Expenses <- gsub(" Dollars","",fin$Expenses)
head(fin)

str(fin)
fin$Revenue <- as.numeric(fin$Revenue)
fin$Expenses <- as.numeric(fin$Expenses)

str(fin)

fin$Growth <- gsub("%","",fin$Growth)
str(fin)

fin$Growth <- as.numeric(fin$Growth)
str(fin)

summary(fin)

#dealing with missing data
#missing values are represented by NA's


#TRUE 1
#FALSE 0
#NA means don't know (third type of logical variable)
#NA == NA #will give the result NA

#An elegent way to locate missing data
#updated import to fin <- read.csv("P3-Future-500-The-Dataset.csv",na.strings = c(""))
head(fin,24)
fin[!complete.cases(fin),]
str(fin)

#which() for non-missing data
fin[fin$Revenue == 9746272,] #filtering (though some incorrect results might pop up)

fin[which(fin$Revenue == 9746272),] #only return the true value even if there is a NA


#working with employees
head(fin)
fin[which(fin$Employees == 45),]



#filtering : using is.na() for missing data
is.na()

a <- c(1,2,3,NA,3,33,NA)
is.na(a)


#finding the number of rows which has missing values in expenses column
is.na(fin$Expenses)

fin[is.na(fin$Expenses),]

#finding the rows which has missing states
head(fin)
fin[is.na(fin$State),]

#Removing records with missing data 

fin_backup <- fin
fin[!complete.cases(fin),]
fin[is.na(fin$Industry),]
fin[!is.na(fin$Industry),] #taking the opposites

fin <- fin[!is.na(fin$Industry),]
fin

#Resetting the data frame index
fin
rownames(fin) <- 1:nrow(fin) #giving rownames for actual number of rows 
fin

#Replacing missing data : factual analysis method

fin[!complete.cases(fin),] #the rows with missing values

fin[is.na(fin$State),]
fin[is.na(fin$State) & fin$City == "New York","State"] <- "NY"
fin

fin[is.na(fin$State) & fin$City == "San Francisco","State"] <- "CA"

#check
fin[c(11,377),]


fin[c(82,265),]

#replacing median data: median imputation method (part 1)
fin[!complete.cases(fin),]

med_employee_retail <- median(fin[fin$Industry == "Retail","Employees"],na.rm = TRUE)
med_employee_retail


fin[is.na(fin$Employees) & fin$Industry == "Retail",]

fin[is.na(fin$Employees) & fin$Industry == "Retail","Employees"] <- med_employee_retail

fin[c(3),]
fin[3,]


#finding the NA for financial services and then find the median for financial services and lastly assign the median to that 
#employees column with the median 
#fin[fin$Industry == "Financial Services",]  #checking on how many FS industries are there
fin[!complete.cases(fin),]
med_employee_FinancialServices <- median(fin[fin$Industry == "Financial Services","Employees"],na.rm = TRUE)
med_employee_FinancialServices

fin[is.na(fin$Employees) & fin$Industry == "Financial Services","Employees"] <- med_employee_FinancialServices
fin[330,]


fin[!complete.cases(fin),]

#replacing median data: median imputatio n method (part 2)
#finding the rows with missing values 
fin[!complete.cases(fin),]
#finding the median value
med_growth_construction <- median(fin[fin$Industry == "Construction","Growth"],na.rm = TRUE)
med_growth_construction

fin[is.na(fin$Growth) & fin$Industry == "Construction","Growth"] <- med_growth_construction
fin[8,]

fin[!complete.cases(fin),]

#replacing median data: median imputation method (part 3)

#mini exercise revenue
med_rev_cons <- median(fin[fin$Industry == "Construction","Revenue"],na.rm = TRUE)
med_rev_cons

fin[is.na(fin$Revenue) & fin$Industry == "Construction","Revenue"] <- med_rev_cons
fin[c(8,42),]

#mini exercise 
#be careful here , only for certain ones
#we don't want to replace that one that's by itself (because then that row won't add up)


fin[!complete.cases(fin),] 

med_exp_cons <- median(fin[fin$Industry =="Construction","Expenses"],na.rm = TRUE)
med_exp_cons

#additional checking for profit to be na 
#is.na(fin$Profit) 
#fin[is.na(fin$Expenses) & is.na(fin$Profit),] 

fin[is.na(fin$Expenses) & fin$Industry == "Construction" & is.na(fin$Profit),"Expenses"] <- med_exp_cons
fin[c(8,42),]

fin[!complete.cases(fin),]


#Replacing missing data: Deriving values method 
#revenue = expenses - profit
#expenses = revenue - profit
#factorizing profit and then turn it into numeric values
fin$Profit <- factor(fin$Profit)
fin$Profit <- as.numeric(as.character(fin$Profit))
fin[is.na(fin$Profit),"Profit"] <- fin[is.na(fin$Profit),"Revenue"] - fin[is.na(fin$Profit),"Expenses"] #it doesn't work for my approach cause there is <NA>
fin[c(8,42),]
 
fin[is.na(fin$Expenses),"Expenses"] <- fin[is.na(fin$Expenses),"Revenue"] - fin[is.na(fin$Expenses),"Profit"]
fin[15,]
str(fin)


fin[!complete.cases(fin),]


#visualizing section

library(ggplot2)
#A scatterplot classified by industry showing revenue ,expenses , profit

p <- ggplot(data = fin)
p + geom_point(aes(x=Revenue,y=Expenses,colour = Industry,size=Profit)) #mapping them not setting

#A scotterplot that includes industry trends for the expenses~revenue relationship
d <- ggplot(data = fin,aes(x=Revenue,y=Expenses,colour = Industry))
    
d + geom_point() +
    geom_smooth(fill=NA,size=1.2)

#BoxPlots showing growth by industry

f <- ggplot(data = fin,aes(x=Industry,y=Growth,colour=Industry))
f + geom_jitter() +
    geom_boxplot(size=1,alpha = 0.5,outlier.colour = NA)














