
# data cleaning script, taking user-data.frame and giving a data.frame usable for afraus score
# read file, CSV only
path  <-  "data.csv"
data <- read.csv(path,sep = ";", header = TRUE)
# check file properties raising appropriate exception
  #two columns?
if(colnums(data)!=2){
  stop(paste("the loaded dataset has ",ncol," columns. Please load a two columns dataset" )
}
    #dates on first column?
if(is.number(data[,2])=FALSE|is.date(data[,2])=FALSE|){
  stop(paste("the loaded dataset doestn't contain numbers on the second column. 
Please provide a dataset with numbers on that column"))
}
    #numbers on second column?
if(is.number(data[,2])=FALSE){
  stop(paste("the loaded dataset doestn't contain numbers on the second column. 
Please provide a dataset with numbers on that column"))
}
#do some wrangling  
  # sort descending

e <- simpleError("test error")
## Not run: 
stop(e)
tryCatch(stop(e), finally = print("Hello"))