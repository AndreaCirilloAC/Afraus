# scoring rules
# Benford
  #outlier if p-value between 0 and 0.05 ( 95% confidence interval)
  # 0.05 : 1 = 0:100
# Local Outlier Factor
  # outlier for lof equal or greater then 1
  # 1: 1 = 100: max(lof)
# Control Chart
  # outlier if greater than UCL or less than LCL
  # for x > UCL
    # 1: UCL = 100:max(X)
  # for x < LCL
    # 1: LCL = 100:min(X)

# for non outlier values , 0 is assigned

# define scoring functions
# benford

benford_scorer <- function(number){
    #if pvalue is more than 0.005 0 is assigned
    result <- c()
    if(number>0.05|is.na(number)){
    result <- 0
        }else{
          result <- abs((number-0.05)/(0-0.05))
              }
    return(result)
}

# control chart
control_scorer <- function(number,UCL,LCL,maxnum,minnum){
  result <- c()
  if(number<=UCL&number>=LCL|is.na(number)){
    result <- 0} else{
      if(number>UCL){result <- abs((number-UCL)/(maxnum-UCL))}else{
       result <-  abs((number-LCL)/(minnum-LCL))
      }
    }
  return(result)
  }
# lof_score

lof_scorer <- function(number){
  maxnum <- max(subset(data$lof,is.infinite(data$lof)==FALSE&is.nan(data$lof)==FALSE&
                         is.na(data$lof)==FALSE))
  result <- c()
  if(number<1|is.na(number)|is.nan(number)|is.infinite(number)){
    result <- 0

  }else{result <- abs((number-1)/(maxnum-1))}
  return(result)
}
#compute scores
data$benford_score <- sapply(data$benford_significance,benford_scorer)
data$control_score <- sapply(data$value,control_scorer,UCL,LCL,max(data$value, na.rm=TRUE),
                             min(data$value,na.rm=TRUE))
data$lof_score     <- sapply(data$lof,lof_scorer)
# define afraus_score as weighted mean of three models scores
data$afraus_score <- data$benford_score*0.4+data$control_score*0.4+data$lof_score*0.2
# define which records has afraus_score greater than 0.5
data$score_filter <- data$afraus_score>0.5
