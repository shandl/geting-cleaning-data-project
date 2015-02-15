# Downoad and unzip raw-data ----
url.source <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url.source, "Dataset.zip", method="curl")
unzip(zipfile = "Dataset.zip")
rm(url.source)
# read in meta - data
# features - Parameter
features <- read.table("UCI HAR Dataset/features.txt")
# just take mean or standard deviation 
match <- grep("mean|std", features[,2])
# aktivity labels - aktivitäten Tabelle
act.lab <- read.table("UCI HAR Dataset/activity_labels.txt",
                      stringsAsFactors=F)
names(act.lab) <- c("act.id", "activity")

# read in measurements
files <- c("test", "train")
measurements <- data.frame()
for (i in files){
    tmp <- read.table(paste0("UCI HAR Dataset/", i, "/X_", i, ".txt"), 
                      col.names = as.character(features[,2]))
    tmp <- tmp[,match]   # just take mean and std - measurements
    activity <- read.table(paste0("UCI HAR Dataset/", i, "/y_", i, ".txt"),
                           col.names = "act.id")
    activity <- factor(activity$act.id, levels=act.lab$act.id, labels=act.lab$activity)
    tmp <- cbind(subject=i, activity, tmp)
    measurements <- rbind(measurements, tmp)
}
rm(tmp, files, i, match)
# aggregate measurements by activity and the subjects
averagemeasurements <- aggregate(.~subject + activity, data=measurements, FUN=mean)



