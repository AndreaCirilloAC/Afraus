
# values
seed <- as.double(1)
RANDU <- function() {
  seed <<- ((2^16 + 3) * seed) %% (2^31)
  seed/(2^31)
}

data <- data.frame()
for(i in 1:1000) {
  data <- rbind(data, round(RANDU(),4))
}
# record date ( as integers, just for ordering)
record_seq <- seq(1:1000)
dataset <- data.frame("record_date" = record_seq, "values" = data)
colnames(dataset) <- c("record_date", "values")

write.table(dataset,file = "data.csv",sep= ";", na="NA", dec=".",row.names=FALSE,col.names= TRUE)
?write.table



