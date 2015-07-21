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

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"