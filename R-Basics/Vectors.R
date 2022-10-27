MyFirstVector <- c(3L,45L,56L,732L)
MyFirstVector
is.numeric(MyFirstVector)
is.double(MyFirstVector)

v2<- c(2,3,5)
is.integer(v2)
is.double(v2)
is.numeric(v2)


#this 6 will convert into character
v3<-c('a',"33","fdf",6)
is.character(v3)
is.numeric(v3)
v3

#sequence - like ":"
seq(1,15,2) #with sequence you can add step
1:13 #wiht colon you can't add step

z<-seq(1,15,4)
z

rep(2,12) #replicate 2 ,12 times
rep("a",4)

x<-c(1,2,3)
y<-rep(x,10)
y


aum <- c(1,123,323,524,2,12) #combine
om <- seq(201,240,11) #sequence
mi <- rep("Hi!",4) #replicate


w<-c("a","b","c","d","e")

w[3]
 
w[-2] #print all except 2
w[1:3]

#both are same

w[c(1,2,5)]
w[c(-3,-4)]








