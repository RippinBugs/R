
mydata<- 1:20
mydata

a<-matrix(mydata,4,5)
a
a[2,3]

#rbind
r1<-1:3
r2<-c("i","am","happy")
r3<-c("lost","for","words")

row<-rbind(r1,r2,r3)

row

col<-cbind(r1,r2,r3)
col 


#naming vectors
charlie<-1:5
charlie

#give names
names(charlie) <- c("a","b","c","d","e")
charlie

charlie["d"]
names(charlie)

#clear names
names(charlie) <-NULL
charlie

#naming matrix dimensions 1
temp.vec <- rep(c("a","D","zd"),each=3)
temp.vec

bravo <- matrix(temp.vec,3,3)
bravo

rownames(bravo) <- c("amit","ani","sad")
colnames(bravo) <- c("life","hits","hard")
bravo

bravo["amit","life"] <- "lala"
bravo











