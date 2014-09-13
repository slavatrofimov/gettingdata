Project for the Getting and Cleaning Data Class
===========

This project consists of a single script called run_analysis.R

The purpose of this script is to prepare tidy data that can be used for later analysis based on the the data 
collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the following site: 
  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The dataset was downloaded from the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data file was unzipped into a local directory.
The "root" directory of this data set was configured as the working directory within R.

This script performs the following functions:
1  Merges the training and the test sets to create one data set.
2  Extracts only the measurements on the mean and standard deviation for each measurement. 
3  Uses descriptive activity names to name the activities in the data set
4  Appropriately labels the data set with descriptive variable names. 
5  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The output of step 5 is saved as a txt file created with write.table() function using row.name=FALSE. 