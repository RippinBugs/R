 myfn <-function(data,rows=1:10){ #1:10 here is default value
     Data<-data[rows,,drop=F] #making it a matrix drop = f
     matplot(t(Data),type="b",pch=15:18,col=c(1:4,6))
     legend("bottomleft",inset = 0.0001,legend = Players[rows],col=c(1:4,6),pch=15:18,horiz = F)
 }
 
 #salary
 myfn(Salary)  
 myfn(Salary/Games)
 myfn(Salary/FieldGoals)
 
 #in-game metrices
 myfn(MinutesPlayed)
 myfn(Points)
 
 #ingame metrices normalized
 myfn(FieldGoals/Games)
 myfn(FieldGoals/FieldGoalAttempts)
 myfn(FieldGoalAttempts/Games)
 myfn(Points/Games)
 
 
 myfn(MinutesPlayed/Games)
 myfn(Games)
 
 myfn(Points/FieldGoals)
 