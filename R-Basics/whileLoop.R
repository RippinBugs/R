a <- 10
while(a>0){
    print(paste("hello ",a))
    a<- a-1
}

counter <-12
counter
while(counter>0){
    print(paste("hello",counter))
    counter<- counter-1
}

#rm(answer)
x<-rnorm(1)
x
if(x>1){
    #answer<-"gt one"
    print("greater than 1")
}else if(x>=-1){
    print("x is in between -1 to 1")
}else{
    print("x is less than -1")
}
