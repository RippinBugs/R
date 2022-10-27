 #exercise one
 sum<-0
 n<-1000
 cnt<-0
 for(i in rnorm(n)){
    if(i<1 & i>-1){
     #sum<-sum+i
     cnt<-cnt+1
    }
 }
 avg<-cnt/n
 print(avg)
 
 if(mod(avg-68.2)<0.5){
     print("on track")
 }else{
     print("not in track")
 } 