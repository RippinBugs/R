x<-c("a","b","c","d","e")
x

x[c(1,4)]
x[1]


Games
Games[1:3,6:10]
Games[c(1,10),]
Games[,c("2009","2008")]
is.matrix(Games[1,])
is.vector(Games[1,])

is.matrix(Games[1,"2009",drop=F])
