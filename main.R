library(lubridate)
library(assertthat)
library(DMwR)


# main script calling all other scripts

#run data_cleaning

source("scripts/data_cleaning.R")
gc()
#run benford_script

source("scripts/benford_script.R")
gc()
#run control_script

source("scripts/control_script.R")
gc()
#run lof_script

source("scripts/lof_script.R")
gc()
#run afraus_score

source("scripts/afraus_score.R")
gc()

plot(hist(data$afraus_score))
