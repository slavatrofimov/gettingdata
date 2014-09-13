Codebook for the data set produced for the Getting and Cleaning Data Class
=============================

Data source
-----------
This dataset is produced by processing the raw data data collected from the accelerometers from the Samsung Galaxy S smartphones worn by 30 subjects engaged in several predefined activities. A full description of the source data is available at the following site: 
  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The dataset was downloaded from the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description of Data 
-----------------
The dataset contains data that was collected from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. The data was subsequently filtered and pre-processed. Please review the README.txt and features.txt files in the original dataset referenced above to learn more about the raw data contained in this dataset. 

Based on the requirements of this project, I have selected a subset of the original dataset containing means or standard deviations for each observation of the follwing features:
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag
* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The tidy dataset produced by running the run_analysis.R script contains one row for each activity and subject denoted by the following variable names:
* ActivityName
* SubjectId