# load benford.Rdata object with benford distribution
# extracts first digits for the given distribution
left = function (string,char){
  substr(string,1,char)}
distr_digits <- as.numeric(left(abs(data[,2]),1))
# if there are 0 numbers multiply all numbers for 1000 and try again.
#i=0  
#while (length(subset(distr_digits,distr_digits==0))>0) 
#  i=i+1
#  distr_digits <- as.numeric(left(abs(data[,2]*(1000*i),1))
#next

# compute table of frequencies
percent_distr           <- data.frame(table(distr_digits)/length(distr_digits))
colnames(percent_distr) <- c("digit","real_freq")
percent_distr[,1]       <- as.numeric(as.character(percent_distr[,1])) 
percent_distr[,2]       <- round(percent_distr[,2],4)
# compute the ideal table ofr frequencies
digit      <- seq(1:9)
benf_freq  <- round((log(1+(1/ digit),10)),4)

#based on Nigrini (1996), calculate a z-statistic in order to assess the statistical 
# significance of deviations

# first compute standard deviation

dev        <- (((benf_freq))*(1-((benf_freq)))/nrow(data))^(1/2)
benf_distr <- data.frame(digit,benf_freq,dev)
test_table <- merge(benf_distr,percent_distr, by="digit",all.x=TRUE) 

# compute z-statistic
test_table$z <- (abs(test_table$real_freq-test_table$benf_freq)-1/(2*nrow(data)))/dev
test_table$pvalue <- pnorm(-abs(test_table$z))

# match records with difference

data$digit        <- as.numeric(left(abs(data[,2]),1))
data              <- merge( data,test_table, by= "digit",all.x=TRUE) 

# compute score
#remove all added columns excepts score column

data           <- data.frame(data[,2:3],data[,7]) 
colnames(data) <- c("date","value","benford_significance") 
