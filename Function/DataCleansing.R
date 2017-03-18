AggregateByCase<-function(group,x){tapply(x,group,length)}
lenunique<-function(x){length(unique(x))}
UniqueAggregate<-function(group,x){tapply(x,group,lenunique)}
