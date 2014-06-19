##Notes for use of this script

Set working directory to where you prefer.

Download the dataset from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip	

extract the files in the zip file to working directory set above

ensure the r script run_analysis.R is in the working directory as well

This script assumes the reshape2 package is installed and activated

Command to execute is as follows:

source("run_analysis.R")

This script will read in data from the test and training folders in the dataset pulled down above.


As per the guidance of this assignment it will do the following:

Merges the training and the test sets to create one data set.

Extracts only the measurements on the mean and standard deviation for each measurement. 

Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
	please note after execution the file created for tnis will be called
	tidydata_p1.txt

Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
	please not after execution the file created for this will be called
	tidydata_p2_avg.txt

