#financial statement analysis using r

monthExpenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)
monthRevenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
monthExpenses
monthRevenue

profit <- monthRevenue - monthExpenses
for(i in 1:12){
    print(profit[i])
}

profit2<- round((profit - profit*0.3),2)
profit2


profitMargin <- round((profit2 / monthRevenue),2)*100
profitMargin

x <- mean(profit2)
x
for(i in 1:12){
    if(profit2[i]>x){
        print(paste("good months",i))
    }else{
        print(paste("bad months",i))
    }
}

best <- max(profit2)
worst <- min(profit2)

for(i in 1:12){
    if(profit2[i] == best){
        print(paste("best month",i))
    }else if(profit2[i] == worst){
        print(paste("worst month",i))
    }else{
        
    }
}







