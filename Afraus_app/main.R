
# main script calling all other scripts

#run data_cleaning

source("scripts/data_cleaning.R",local=TRUE)
gc()
#run benford_script

source("scripts/benford_script.R",local=TRUE)
gc()
#run control_script

source("scripts/control_script.R",local=TRUE)
gc()
#run lof_script

source("scripts/lof_script.R",local=TRUE)
gc()
#run afraus_score

source("scripts/afraus_score.R", local=TRUE)
gc()


