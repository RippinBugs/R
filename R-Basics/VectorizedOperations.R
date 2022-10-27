v1<-c(1,2,3,4) #longer object length is not a multiple of shorter object length
v2<-c(2,4,1,3,5,0,3,12,34,3)

v1+v2
v1-v2
v1*v2
v1/v2
v1>v2
v1<v2


#first-part
x <- rnorm(5)
x
#R-specific pragramming loop
for(i in x){
    print(i)
}
#conventional programming loop
for(j in 1:5){
    print(x[j])
}


#second-part

n <- 100
a <-rnorm(n)
b <-rnorm(n)

#vectorized approach

c<-a*b #much faster
c



#de-vectorized approach
d<-rep(NA,n)
for(i in 1:n){
    d[i]<-a[i]*b[i]
}
d #slower 














