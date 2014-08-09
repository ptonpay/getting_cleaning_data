# Codebook for assignment 
This document describes the project, features and datasets . This is for Coursera's Getting and Cleaning Data course. 

## Data source for the data:
The data to be used for this project is available at the link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Description of the project: 
There are essentially 2 directories in the data-set provided. One for training ( 70% )and other for testing ( 30%).
Eachi directory contains the data sets and two additional file called X_test/X_train AND subject_train/subject_test 
which are basically "Activities" and "Subject". 
Also there are files called "feature_info.txt that gives details about the several features in the data-set.
There is another file called "activity_labels.txt" that has a mapping from label-id with the description.

The intent of this project is  to create one R script called run_analysis.R that does the following. 

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement. 
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names. 
    Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Feature Selection
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and 
tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency 
of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration 
signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals 
(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using 
the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, 
fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ <br />
tGravityAcc-XYZ <br />
tBodyAccJerk-XYZ <br />
tBodyGyro-XYZ <br />
tBodyGyroJerk-XYZ <br />
tBodyAccMag <br />
tGravityAccMag <br />
tBodyAccJerkMag <br />
tBodyGyroMag <br />
tBodyGyroJerkMag <br />
fBodyAcc-XYZ <br />
fBodyAccJerk-XYZ <br />
fBodyGyro-XYZ <br />
fBodyAccMag <br />
fBodyAccJerkMag <br />
fBodyGyroMag <br />
fBodyGyroJerkMag <br />

The set of variables that were estimated from these signals are: 

mean(): Mean value <br />
std(): Standard deviation <br />
mad(): Median absolute deviation <br />
max(): Largest value in array <br />
min(): Smallest value in array <br />
* <br />
* <br />
*<br />

Since the scope of this exercise is only for mean and std-deviation, we would limit out analysis to that.
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean <br />
tBodyAccMean <br />
tBodyAccJerkMean <br />
tBodyGyroMeant <br />
fBodyGyroJerkMean <br />
