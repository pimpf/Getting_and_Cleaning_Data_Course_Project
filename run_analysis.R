###############################################################################
# Course: Getting and Cleaning Data
# Peer Assessment: Getting and Cleaning Data Course Project
# Author: Milen Angelov
# Source: run_analysis.R
#
# Objectives:
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for 
#    each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
#
###############################################################################

dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip";

# check if the directory with working data is available
if(!file.exists("./UCI HAR Dataset")){
    # Download source, on Mac OS X method should be specified
    download.file(dataUrl, destfile="./dataset.zip", method="curl");
    
    # Unzip it
    unzip("./dataset.zip");
}

## Function to read train and test subject data, label the column names and 
## return merged both dataset
getSubjectData <- function(){
    subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",
                                   header = FALSE);
    
    subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                                  header = FALSE);
    
    subject <- rbind(subject_train, subject_test);
    
    colnames(subject) <- c("Subject");
    
    subject;
}

## Function to read, name activities, merge and set column names of activity data
getActivityData <- function(){
    
    activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                                  header = FALSE);
    
    y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",
                          header = FALSE);
    
    y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",
                         header = FALSE);
    
    activities <- rbind(y_train, y_test);
    
    #Uses descriptive activity names to name the activities in the data set
    activities$V1 <- factor(activities$V1, levels = activity_labels$V1);
    
    colnames(activities) <- c("Activity");
    
    activities;
}

## Function to read, name columns and return merged both train and test 
## features data
getFeaturesData <- function(){
    X_train <- read.table("./UCI HAR Dataset/train/X_train.txt",
                          header = FALSE);
    X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",
                         header = FALSE);
    
    featuresColNames <- read.table("./UCI HAR Dataset/features.txt");
    
    features <- rbind(X_train, X_test);
    colnames(features) <- featuresColNames$V2;
    
    features;
    
}

## Merges the training and the test sets to create one data set.
mergedData <- cbind(getFeaturesData(),
                    getSubjectData(),
                    getActivityData());

## Extracts only the measurements on the mean and standard deviation for 
## each measurement.
columnsWithMeasurement <- grep(".*mean.*|.*std.*", 
                               names(mergedData), 
                               ignore.case = TRUE);


## Create a second, independent tidy data set with the average of each 
## variable for each activity and each subject.
#secondData <- data.frame(mergedData);
cleanedData <- mergedData[,columnsWithMeasurement];

## File with the tidy data set created above to be uploaded as a txt file 
## created with write.table() using row.name=FALSE
write.table(cleanedData,
            file = "tidydataset.txt",
            sep = ",",
            row.names = FALSE);
