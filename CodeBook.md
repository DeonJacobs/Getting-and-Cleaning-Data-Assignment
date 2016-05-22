Code Book
=========

This code book explains the formating changes and filtered variables used for the Getting and Cleaning Data Module assignment. 

A discription of the Human Activity Recognition Using Smartphones Data Set can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The complete data sets can be downloaded here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For Convenience below a copy of the feature measurements and variables estamed from these features:

###Feature Selection from Original Dataset 


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt' 

###Variables Filtered for this Assignment

Only the Standard Deviation and Mean variable calculations where required from all feature measurement calculations listed above.   
These variables were filtered out from data set using the run_analysis.R script

###Operations Performed on Filtered Feature Variable Descriptions/Names to Make Tidy Data Set

* Change descriptions to lower case
* Remove following characters : "(",")","-"
* Remove duplicated phrases such as "bodybody"

###Two Columns Were Added to the Filtered Variable Data Set

* activity (Type of measurement activity: WALKING, WALKING_UPSTRAIRS, WALKING_DOWNSTAIRS, STANDING, SITTING, LAYING)
* subject (Person performing activity: 1-30)

###Final Tidy Variable Result from Above Transformations

*	activity
*	subject
*	tbodyaccstdz
*	tbodyaccjerkstdx
*	tbodygyrostdy
*	tbodygyrojerkstdz
*	tbodygyromagstd
*	fbodyaccstdz
*	fbodygyrostdx
*	fbodyaccjerkmagstd
*	tbodyaccmeany
*	tgravityaccmeanz
*	tbodygyromeanx
*	tbodygyrojerkmeany
*	tbodyaccjerkmagmean
*	fbodyaccmeany
*	fbodyaccmeanfreqz
*	fbodyaccjerkmeanfreqx
*	fbodygyromeany
*	fbodygyromeanfreqz
*	fbodyaccjerkmagmeanfreq
*	fbodygyrojerkmagmeanfreq
*	tgravityaccstdx
*	tbodyaccjerkstdy
*	tbodygyrostdz
*	tbodyaccmagstd
*	tbodygyrojerkmagstd
*	fbodyaccjerkstdx
*	fbodygyrostdy
*	fbodygyromagstd
*	tbodyaccmeanz
*	tbodyaccjerkmeanx
*	tbodygyromeany
*	tbodygyrojerkmeanz
*	tbodygyromagmean
*	fbodyaccmeanz
*	fbodyaccjerkmeanx
*	fbodyaccjerkmeanfreqy
*	fbodygyromeanz
*	fbodyaccmagmean
*	fbodygyromagmean
*	tbodyaccstdx
*	tgravityaccstdy
*	tbodyaccjerkstdz
*	tbodygyrojerkstdx
*	tgravityaccmagstd
*	fbodyaccstdx
*	fbodyaccjerkstdy
*	fbodygyrostdz
*	fbodygyrojerkmagstd
*	tgravityaccmeanx
*	tbodyaccjerkmeany
*	tbodygyromeanz
*	tbodyaccmagmean
*	tbodygyrojerkmagmean
*	fbodyaccmeanfreqx
*	fbodyaccjerkmeany
*	fbodyaccjerkmeanfreqz
*	fbodygyromeanfreqx
*	fbodyaccmagmeanfreq
*	fbodygyromagmeanfreq
*	tbodyaccstdy
*	tgravityaccstdz
*	tbodygyrostdx
*	tbodygyrojerkstdy
*	tbodyaccjerkmagstd
*	fbodyaccstdy
*	fbodyaccjerkstdz
*	fbodyaccmagstd
*	tbodyaccmeanx
*	tgravityaccmeany
*	tbodyaccjerkmeanz
*	tbodygyrojerkmeanx
*	tgravityaccmagmean
*	fbodyaccmeanx
*	fbodyaccmeanfreqy
*	fbodyaccjerkmeanz
*	fbodygyromeanx
*	fbodygyromeanfreqy
*	fbodyaccjerkmagmean
*	fbodygyrojerkmagmean





