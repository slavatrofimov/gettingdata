# # The purpose of this script is to prepare tidy data that can be used for later analysis based on the the data 
# collected from the accelerometers from the Samsung Galaxy S smartphone. 
# A full description is available at the following site: 
#   
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# 
# The dataset was downloaded from the following URL:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# The data file was unzipped into a local directory.
# The "root" directory of this data set was configured as the working directory within R.
# 
# This script performs the following functions:
# 1  Merges the training and the test sets to create one data set.
# 2  Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3  Uses descriptive activity names to name the activities in the data set
# 4  Appropriately labels the data set with descriptive variable names. 
# 5  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# 
# The output of step 5 is saved as a txt file created with write.table() function using row.name=FALSE. 
# 
# Load two libraries required for the analysis
library(reshape)
library(reshape2)

#Retrieve a list of features with their index position and name
features <- read.csv(file = "features.txt", sep="", header = FALSE, col.names = c("FeatureIndex", "FeatureName"))

##Get a subset of features that are related to means or standard deviations
relevantFeatures <- features[grepl(glob2rx("*-mean()*"), features$FeatureName) | grepl(glob2rx("*-std()*"), features$FeatureName), ]

#Initialize a variable that will be eventually used to store the combined set of observations,
#which will encompass both the train set and the test set
combinedObservations <- numeric(0)

#Loop through the train set and the test set
for (setType in c("train", "test")) 
  {
    ##Get the list of activities for each observation
    activities <- read.csv(file = paste(setType, "/y_", setType, ".txt",  sep = "", collapse=""), header = FALSE, col.names = "ActivityId")
    
    ##Get the list of subjects for each observation
    subjects <- read.csv(file = paste(setType, "/subject_", setType, ".txt",  sep = "", collapse=""), header = FALSE, col.names = "SubjectId")
    
    ##Get a vector of feature measurements for each observations
    observations <- read.csv(file = paste(setType, "/x_", setType, ".txt",  sep = "", collapse=""), sep = "", header = FALSE, col.names = features[,2])
  
    ##Combine activity and subject identifiers with relevant observations 
    combinedObservations <- rbind(combinedObservations, cbind(activities, subjects, observations[,relevantFeatures[,1]]))
  }

#Retrieve a list of activity codes
activityCodes <- read.csv(file = "activity_labels.txt", sep="", header = FALSE, col.names = c("ActivityId", "ActivityName"))

#Merge the combined set of observations with descriptive activity codes
finalObservations <- merge(x=activityCodes, y = combinedObservations, by.x = "ActivityId", by.y = "ActivityId", all.y = TRUE)[,2:69]

#Uncomment the line below to write the intermediary output as a table
#write.table(x = finalObservations, file = "TidyDataset.txt", append = FALSE, row.name=FALSE)

#Melt the combined set of observations into a normalized dataset with 1 observation per row
finalObservationsUnpivot <- melt(data = finalObservations, id.vars = c("ActivityName", "SubjectId"))

#Summarize the observations by calculating the mean for each combination of each variable, activity and subject
finalObservationsSummarized <- dcast(finalObservationsUnpivot, ActivityName + SubjectId ~ variable, value.var = 'value', fun.aggregate = mean)

#Write out the final results as a text file
write.table(x = finalObservationsSummarized, file = "TidyDatasetSummarized.txt", append = FALSE, row.name=FALSE)
