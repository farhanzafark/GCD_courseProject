## This script loads a data file and accumulates the training and testing examples into
## a single set. It then creates a tidy dataset from the original data.

setwd("C:/Users/Farhan/Documents/Data_Science_Courses/Getting_and_Cleaning_Data/courseproject")

## Set file names
features_file<-"UCI HAR Dataset/features.txt"
activity_file<-"UCI HAR Dataset/activity_labels.txt"
Xtrain_file<-"UCI HAR Dataset/train/X_train.txt"
ytrain_file<-"UCI HAR Dataset/train/y_train.txt"
subjecttrain_file<-"UCI HAR Dataset/train/subject_train.txt"

Xtest_file<-"UCI HAR Dataset/test/X_test.txt"
ytest_file<-"UCI HAR Dataset/test/y_test.txt"
subjecttest_file<-"UCI HAR Dataset/test/subject_test.txt"

## Read training files
xtrain_data<-read.table(Xtrain_file)
ytrain_data<-read.table(ytrain_file)
subjecttrain_data<-read.table(subjecttrain_file)

## Read testing files
xtest_data<-read.table(Xtest_file)
ytest_data<-read.table(ytest_file)
subjecttest_data<-read.table(subjecttest_file)

## Read activity and feature files
features <- read.table(features_file)
activity <- read.table(activity_file)

## Merge sets
Xdata <- rbind(xtest_data,xtrain_data)
ydata <- rbind(ytest_data,ytrain_data)
subjectdata <- rbind(subjecttest_data,subjecttrain_data)

## Set column names
colnames(Xdata) <- features[,2]
colnames(ydata) <- c("activity")
colnames(subjectdata) <- ("subject")

## Make complete data set
fulldata <- cbind(Xdata,ydata,subjectdata)

## Extract the mean and standard deviation measurements
subdata<-fulldata[,grepl("mean",colnames(fulldata))|grepl("std",colnames(fulldata))|grepl("activity",colnames(fulldata))|grepl("subject",colnames(fulldata))]

## Use descriptive activity names to name the activities in the set
subdata$activity <- factor(subdata$activity,levels = activity[,1],labels=activity[,2])

## Appropriately label the data set with descriptive variable names. 
names(subdata)<-gsub("^t", "time", names(subdata))
names(subdata)<-gsub("^f", "frequency", names(subdata))
names(subdata)<-gsub("Acc", "Accelerometer", names(subdata))
names(subdata)<-gsub("Gyro", "Gyroscope", names(subdata))
names(subdata)<-gsub("Mag", "Magnitude", names(subdata))
names(subdata)<-gsub("BodyBody", "Body", names(subdata))

## Creates a second, independent tidy data set with the average of each variable 
## for each activity and each subject.
subdata2 <- aggregate(. ~subject + activity, subdata, mean)