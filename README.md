### Peer Assessment: Getting and Cleaning Data Course Project

#### Overview
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

#### Content of this repository
1. run_analysis.R - R script which does the following  
  1. Merges the training and the test sets to create one data set.  
  2. Extracts only the measurements on the mean and standard deviation for each measurement.   
  3. Uses descriptive activity names to name the activities in the data set  
  4. Appropriately labels the data set with descriptive variable names.   
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
  
  
2. codebook.md - a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data. It is generated using knitr from R studio from codebook.Rmd together with codebook.html    

3. README.md - this file

4. tidydataset.txt - File with the tidy data set created with write.table() using row.name=FALSE by running run_analysis.R script.
   
Working set of data is not included. It will be downloaded and unzipped when run_analysis.R is executed for the first time. It could obtain from [Human Activity Recognition Using Smartphones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  
For more information please visit: [Human Activity Recognition Using Smartphones Data Set ](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

#### How to run the script
In order to run the script run the following command in the shell:
```
Rscript run_analysis.R
```
The script will download data from the web in the current working directory and will create tidydataset.txt 
Also it could be opened in RStudio and runned from there.
