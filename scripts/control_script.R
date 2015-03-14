# calculate the central limit for the numeric 
variable as the records average
central_limit <- mean(data[,2])

n_1           <- data[-1,2]
n             <- data[-nrow(data),2]
ranges        <- n_1-n
moving_range  <- sum(ranges)/(ncol(data)-1) 
  # calculate upper limit
UCL  <-   central_limit +3*(moving_range/1.128)
#calculate the lower limit
LCL  <-   central_limit -3*(moving_range/1.128)

