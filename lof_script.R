
# calculate lof for the quantitative variable
data$lof <- lofactor(data[,2],2)
#data$lof <- mclapply(data[,2],lofactor,k=2,mc.core=2)

#library(parallel)
#fun <- function(cl, x,k) {
#  parSapply(cl, 1:5, function(x) lofcator(X))
#}
#cl <- makeCluster(2)
#fun(cl, 1:10)
#stopCluster(cl)

#data$lof <- parCapply(cl,data[,2],lofactor,2)
#data$lof <- apply(data,2,function(x) (lofactor))
#data$lof <- parApply(cl,data,2,function(x) lofactor(k=2))
#registerDoParallel(cores=8)
#foreach(i= 1:nrow(data)) %dopar% data$lof <- sapply(data[,2],lofactor,2)

# for lof > 1 outlier
# for lof < 1 no outlier
# assign score depending on lof
# assign 0 if no outlier

ex.df <- data.frame(a=seq(1,100,1),b=seq(10,1000,10),c=runif(100))
clus <- makeCluster(3)
lofac <- function(x,k){
  lofcator(x,k)
}
clusterExport(clus,"lofac","lofacto")
aa <- parRapply(clus,ex.df, function(x) lofac(x[2],k=2))
