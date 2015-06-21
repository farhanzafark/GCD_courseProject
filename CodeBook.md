<h1>Getting and Cleaning Data</h1>

<h2>Course Project</h2>

<p>The purpose of this project was to create a tidy dataset from a source dataset containing raw data.</p>

<p>The source of the dataset was obtained from the following link.</p>

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


<p>A full description of the data is provided in the link below:</p>

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

<p>Files read from the directory for the purpose of this project are as follows:</p>

features_file<-"UCI HAR Dataset/features.txt"
activity_file<-"UCI HAR Dataset/activity_labels.txt"
Xtrain_file<-"UCI HAR Dataset/train/X_train.txt"
ytrain_file<-"UCI HAR Dataset/train/y_train.txt"
subjecttrain_file<-"UCI HAR Dataset/train/subject_train.txt"

Xtest_file<-"UCI HAR Dataset/test/X_test.txt"
ytest_file<-"UCI HAR Dataset/test/y_test.txt"
subjecttest_file<-"UCI HAR Dataset/test/subject_test.txt"


<p>The following steps were taken to get the data from raw format to the tidy data format.</p>

1.Merges the training and the test sets to create one data set.

2.Extracts only the measurements on the mean and standard deviation for each measurement. 

3.Uses descriptive activity names to name the activities in the data set

4.Appropriately labels the data set with descriptive variable names. 

5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.