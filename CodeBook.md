---
title: "CodeBook"
author: "Artyom Gapchenko"
date: "21.01.2015"
output: html_document
---

This document describes the transformations which are performed by `run_analysis.R` script to get a tidy data set required by the Programming Assignment in the 'Getting and Cleaning Data' course. To understand how you can invoke this script to build the desired tidy data set, read the `README.md` file located in this repository.
The transformations are based on the requirements for this assignment. I've changed the order of operations, though, to the one that looks more natural to me:

1. Merge the training and the test sets to create one data set and label the data set with descriptive variable names. 
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. From the data set in step 3, create a second, independent tidy data set with the average of each variable for each activity and each subject.
4. Assign descriptive activity names to name the activities in the resulting data set.

In the end the script stores the resulting data set in the file called `tidy_data.txt`.

========
Variables description
========
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
