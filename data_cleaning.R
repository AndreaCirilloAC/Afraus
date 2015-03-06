
# data cleaning script, taking user-data.frame and giving a data.frame usable for afraus score
# read file, CSV only
path  <-  "data.csv"
data <- data.frame(read.csv(path,sep = ";", header = TRUE))
data[,1] <- as.Date(data[,1])
# check file properties raising appropriate exception
  #two columns?
if(ncol(data)!=2){
  stop(paste("the loaded dataset has ",ncol," columns. Please load a two columns dataset" ))
}

#dates on first column?
if(is.numeric(data[,1])==FALSE & is.date(data[1,1])==FALSE){
  stop(paste("the loaded dataset doestn't contain neither dates nor numbers 
on the second column. 
Please provide a dataset with numbers on that column"))
}
    #numbers on second column?
if(is.numeric(data[,2])==FALSE){
  stop(paste("the loaded dataset doestn't contain numbers on the second column. 
Please provide a dataset with numbers on that column"))
}
#do some wrangling  
  # sort descending
data <- data[order(data[,1]),]

