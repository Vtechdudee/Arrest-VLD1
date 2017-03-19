rm(list=ls())
setwd("C:/Users/dengj/Desktop/2016-2017 Spring/R/data")
dat=read.csv("ArrestMini.csv")
dat1<-na.omit(dat)
dat1[,1]<-substr(dat1[,1], 1,10)

lenunique<-function(x){
  length(unique(x))
}
AggregateByCase<-function(group,x){
  tapply(x,group,lenunique)
}

TheSpreadofCrime<-data.frame(sort(unique(as.Date(dat1$ARRESTTIME))),as.numeric(AggregateByCase(dat1$ARRESTTIME,dat1$COUNCIL_DISTRICT)))
names(TheSpreadofCrime)[1] <- "time"
names(TheSpreadofCrime)[2] <- "NumbersofCD"

PlotByTime<-function(time,count){
plot(count,time,xlab = "time",ylab = "Numbers of Council Districts",col="red",lwd=2,type="l",main="The Spread of Crime")  
}

PlotByTime(TheSpreadofCrime$NumbersofCD,TheSpreadofCrime$time)
