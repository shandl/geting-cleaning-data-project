# geting-cleaning-data-project

this descripes the run_analyis.R from my github-repo

##
first the original dataset is downloaded from the original link 
    posted from the course instructions

##
    the meta data is read in
     features: the parameters in the original data 
        match: picks only the parameters which are mean or standard deviation
     act.lab: activity labels in the origninal data
## 
    test and train measurements are read in, 
    subseted with match (picks only mean and std),
    merged with the the activity (and named accordently) and 
    merged with the subject (performing test/train-person)
    to create the measurements-data.frame
##
avergaemeasurements is produced by aggregating the measurements-data.frame
    by subject and activity
it is writen in a .txt-file in the working directory.