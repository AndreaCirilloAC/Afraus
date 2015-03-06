library(benford.analysis)
# values
seed <- as.double(1)
RANDU <- function() {
  seed <<- ((2^16 + 3) * seed) %% (2^31)
  (seed/(2^31))+10
}

random_v1 <- data.frame()
for(i in 1:1000) {
  random_v1 <- rbind(random_v1, round(RANDU(),4))
}


random_v2 <- data.frame()
for(i in 1:1000) {
  random_v2 <- rbind(random_v2, round(RANDU(),4))
}

random_v <- random_v1*random_v2
# record date ( as integers, just for ordering)
record_seq <- seq(1:1000)
dataset <- data.frame("record_date" = record_seq, "values" = random_v)
colnames(dataset) <- c("record_date", "values")
plot(dataset)
write.table(dataset,file = "data.csv",sep= ";", na="NA", dec=".",row.names=FALSE,col.names= TRUE)
data(corporate.payment)
payments <- data.frame(corporate.payment[,2],corporate.payment[,4])
write.table(payments,file = "data.csv",sep= ";", na="NA", dec=".",row.names=FALSE,col.names= TRUE)
# benford distribution generator
digit <- seq(1:9)
Probability <-  round((log(1+(1/ digit),10))*100,0)
Probability_text <- paste(Probability,"%",sep=" ")
benf <- data.frame(digit,Probability)



