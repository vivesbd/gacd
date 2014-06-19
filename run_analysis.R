# Brian Vives
#Getting and Cleaning Data Assignment

#have all working files in same directory as this script
#assumes reshape package is installed

#this is working directory for my system, remove or modify for yours
setwd("~/Documents/coursera/getting_and_cleaning_data/assignment")

# Data Directories to use
data <- "./UCI HAR Dataset/"
test_data <-"./UCI HAR Dataset/test/"
train_data <- "UCI HAR Dataset/train/"

activities <- read.table(paste0(data, "activity_labels.txt"), header=FALSE, 
                         stringsAsFactors=FALSE)
features <- read.table(paste0(data, "features.txt"), header=FALSE, 
                       stringsAsFactors=FALSE)


# imports and sets up test data
subject_test <- read.table(paste0(test_data, "subject_test.txt"), header=FALSE)
x_test <- read.table(paste0(test_data, "X_test.txt"), header=FALSE)
y_test <- read.table(paste0(test_data, "y_test.txt"), header=FALSE)
set_test <- data.frame(Activity = factor(y_test$V1, labels = activities$V2))
testdata <- cbind(set_test, subject_test, x_test)


# imports and sets up train data
subject_train <- read.table(paste0(train_data, "subject_train.txt"), header=FALSE)
x_train <- read.table(paste0(train_data, "X_train.txt"), header=FALSE)
y_train <- read.table(paste0(train_data, "y_train.txt"), header=FALSE)
set_train <- data.frame(Activity = factor(y_train$V1, labels = activities$V2))
traindata <- cbind(set_train, subject_train, x_train)


# creates and save tidy date to a file in working directory

set_tidydata <- rbind(testdata, traindata)
names(set_tidydata) <- c("Activity", "Subject", features[,2])
select <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
tidydata <- set_tidydata[c("Activity", "Subject", select)]
write.table(tidydata, file="./tidydata_p1.txt", row.names=FALSE)


# creates a second tidy data set based on running averages and saves to file in wd
tidydata_melt <- melt(tidydata, id=c("Activity", "Subject"), measure.vars=select)
tidydata_mean <- dcast(tidydata_melt, Activity + Subject ~ variable, mean)
write.table(tidydata_mean, file="./tidydata_p2_avg.txt", row.names=FALSE)
