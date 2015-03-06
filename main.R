library(lubridate)
library(assertthat)
# main script calling all other scripts

#run data_cleaning
source("data_cleaning.R")
#run benford_script
source("benford_script.R")
#run control_script

#run lof_script
source("lof_script.R")
#run afraus_score
source("afraus_score.R")