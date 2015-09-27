# Code Book for GettingandCleaningData

## Input data:

This code processes data from the "UCI HAR Dataset" as found
and described at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
For a detailed description of the dataset's variables, see:
   UCI HAR Dataset.names

   UCI HAR Dataset\features_info.txt

   UCI HAR Dataset\README.txt

The relevant files and information for this project are:
   UCI HAR Dataset\activity_labels.txt - This file contains the activity code (1..6)
                                         number and activity labels: WALKING, WALKING_UPSTAIRS,
                                                                     WALKING_DOWNSTAIRS, SITTING,
                                                                     STANDING, LAYING

   UCI HAR Dataset\features.txt - This file contains the variable name and order of the
                                  data in the X_*.txt files described below.  In stead of
                                  putting the headers in the file, they put it here instead.

   UCI HAR Dataset\test - This folder contains the test dataset which is 30% of the original
                          dataset.

   UCI HAR Dataset\train - This folder contains the training dataset which is 70% of the
                           original dataset.

   UCI HAR Dataset\(train|test)\subject_*.txt - This file contains the subject IDs for
                                                each of the observations.

   UCI HAR Dataset\(train|test)\y_*.txt - This file contains the activity code that was being
                                          performed during each observation.

   UCI HAR Dataset\(train|test)\X_*.txt - This file contains the observed variables/data.

## Transformations:

In order to recreate the combined dataset, each of the train and test datasets must
be reconsistuted first, then combined together.  The reconsistutation consists of
adding the subject IDs and activity codes as columns onto the observational data.
Reading in the subject IDs and activity codes is done straight forward without any
changes to the data.  Reasonable columns names are assigned to the in-memory
dataframes to make working with the dataframes easier.

To load the X_*.txt observational data required either hardcoding the file's fixed
width format layout, or writing code that would coerce the file into a more easily
read format.  I chose to implement the latter option.  The X_*.txt file is read in
as lines, all double spaces are converted to single spaces, leading spaces are
trimmed, then the modified lines are read in using read.delim().

Once the X_*.txt data is in a dataframe, reasonable columns names are assigned to
the dataframe based on the values in the features.txt file.  While I prefer more
descriptive column names as already exist in features.txt, this course encourages
us to use alllowercasesmashedtogether column names.  They are not pretty and
are harder to understand, but if that is what the instructors wants, that is what
they get.

## Output:

The final output dataset (ie: course_project_results.txt) is a tidy wide
dataset with the average (=mean) of each *mean* or *std* variable for each
activity and each subject.  The following table describes the variables in
the dataset:

   subjid	Subject ID number (integer)

   activity	Activity the subject was performing: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

   tbodyaccmeanx	Average of tBodyAcc-mean()-X.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodyaccmeany	Average of tBodyAcc-mean()-Y.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodyaccmeanz	Average of tBodyAcc-mean()-Z.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodyaccstdx	Average of tBodyAcc-std()-X.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodyaccstdy	Average of tBodyAcc-std()-Y.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodyaccstdz	Average of tBodyAcc-std()-Z.  See UCI HAR Dataset\features_info.txt for description and units.

   tgravityaccmeanx	Average of tGravityAcc-mean()-X.  See UCI HAR Dataset\features_info.txt for description and units.

   tgravityaccmeany	Average of tGravityAcc-mean()-Y.  See UCI HAR Dataset\features_info.txt for description and units.

   tgravityaccmeanz	Average of tGravityAcc-mean()-Z.  See UCI HAR Dataset\features_info.txt for description and units.

   tgravityaccstdx	Average of tGravityAcc-std()-X.  See UCI HAR Dataset\features_info.txt for description and units.

   tgravityaccstdy	Average of tGravityAcc-std()-Y.  See UCI HAR Dataset\features_info.txt for description and units.

   tgravityaccstdz	Average of tGravityAcc-std()-Z.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodyaccjerkmeanx	Average of tBodyAccJerk-mean()-X.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodyaccjerkmeany	Average of tBodyAccJerk-mean()-Y.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodyaccjerkmeanz	Average of tBodyAccJerk-mean()-Z.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodyaccjerkstdx	Average of tBodyAccJerk-std()-X.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodyaccjerkstdy	Average of tBodyAccJerk-std()-Y.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodyaccjerkstdz	Average of tBodyAccJerk-std()-Z.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodygyromeanx	Average of tBodyGyro-mean()-X.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodygyromeany	Average of tBodyGyro-mean()-Y.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodygyromeanz	Average of tBodyGyro-mean()-Z.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodygyrostdx	Average of tBodyGyro-std()-X.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodygyrostdy	Average of tBodyGyro-std()-Y.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodygyrostdz	Average of tBodyGyro-std()-Z.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodygyrojerkmeanx	Average of tBodyGyroJerk-mean()-X.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodygyrojerkmeany	Average of tBodyGyroJerk-mean()-Y.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodygyrojerkmeanz	Average of tBodyGyroJerk-mean()-Z.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodygyrojerkstdx	Average of tBodyGyroJerk-std()-X.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodygyrojerkstdy	Average of tBodyGyroJerk-std()-Y.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodygyrojerkstdz	Average of tBodyGyroJerk-std()-Z.  See UCI HAR Dataset\features_info.txt for description and units.

   tbodyaccmagmean	Average of tBodyAccMag-mean().  See UCI HAR Dataset\features_info.txt for description and units.

   tbodyaccmagstd	Average of tBodyAccMag-std().  See UCI HAR Dataset\features_info.txt for description and units.

   tgravityaccmagmean	Average of tGravityAccMag-mean().  See UCI HAR Dataset\features_info.txt for description and units.

   tgravityaccmagstd	Average of tGravityAccMag-std().  See UCI HAR Dataset\features_info.txt for description and units.

   tbodyaccjerkmagmean	Average of tBodyAccJerkMag-mean().  See UCI HAR Dataset\features_info.txt for description and units.

   tbodyaccjerkmagstd	Average of tBodyAccJerkMag-std().  See UCI HAR Dataset\features_info.txt for description and units.

   tbodygyromagmean	Average of tBodyGyroMag-mean().  See UCI HAR Dataset\features_info.txt for description and units.

   tbodygyromagstd	Average of tBodyGyroMag-std().  See UCI HAR Dataset\features_info.txt for description and units.

   tbodygyrojerkmagmean	Average of tBodyGyroJerkMag-mean().  See UCI HAR Dataset\features_info.txt for description and units.

   tbodygyrojerkmagstd	Average of tBodyGyroJerkMag-std().  See UCI HAR Dataset\features_info.txt for description and units.

   fbodyaccmeanx	Average of fBodyAcc-mean()-X.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodyaccmeany	Average of fBodyAcc-mean()-Y.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodyaccmeanz	Average of fBodyAcc-mean()-Z.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodyaccstdx	Average of fBodyAcc-std()-X.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodyaccstdy	Average of fBodyAcc-std()-Y.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodyaccstdz	Average of fBodyAcc-std()-Z.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodyaccmeanfreqx	Average of fBodyAcc-meanFreq()-X.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodyaccmeanfreqy	Average of fBodyAcc-meanFreq()-Y.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodyaccmeanfreqz	Average of fBodyAcc-meanFreq()-Z.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodyaccjerkmeanx	Average of fBodyAccJerk-mean()-X.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodyaccjerkmeany	Average of fBodyAccJerk-mean()-Y.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodyaccjerkmeanz	Average of fBodyAccJerk-mean()-Z.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodyaccjerkstdx	Average of fBodyAccJerk-std()-X.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodyaccjerkstdy	Average of fBodyAccJerk-std()-Y.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodyaccjerkstdz	Average of fBodyAccJerk-std()-Z.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodyaccjerkmeanfreqx	Average of fBodyAccJerk-meanFreq()-X.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodyaccjerkmeanfreqy	Average of fBodyAccJerk-meanFreq()-Y.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodyaccjerkmeanfreqz	Average of fBodyAccJerk-meanFreq()-Z.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodygyromeanx	Average of fBodyGyro-mean()-X.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodygyromeany	Average of fBodyGyro-mean()-Y.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodygyromeanz	Average of fBodyGyro-mean()-Z.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodygyrostdx	Average of fBodyGyro-std()-X.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodygyrostdy	Average of fBodyGyro-std()-Y.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodygyrostdz	Average of fBodyGyro-std()-Z.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodygyromeanfreqx	Average of fBodyGyro-meanFreq()-X.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodygyromeanfreqy	Average of fBodyGyro-meanFreq()-Y.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodygyromeanfreqz	Average of fBodyGyro-meanFreq()-Z.  See UCI HAR Dataset\features_info.txt for description and units.

   fbodyaccmagmean	Average of fBodyAccMag-mean().  See UCI HAR Dataset\features_info.txt for description and units.

   fbodyaccmagstd	Average of fBodyAccMag-std().  See UCI HAR Dataset\features_info.txt for description and units.

   fbodyaccmagmeanfreq	Average of fBodyAccMag-meanFreq().  See UCI HAR Dataset\features_info.txt for description and units.

   fbodybodyaccjerkmagmean	Average of fBodyBodyAccJerkMag-mean().  See UCI HAR Dataset\features_info.txt for description and units.

   fbodybodyaccjerkmagstd	Average of fBodyBodyAccJerkMag-std().  See UCI HAR Dataset\features_info.txt for description and units.

   fbodybodyaccjerkmagmeanfreq	Average of fBodyBodyAccJerkMag-meanFreq().  See UCI HAR Dataset\features_info.txt for description and units.

   fbodybodygyromagmean	Average of fBodyBodyGyroMag-mean().  See UCI HAR Dataset\features_info.txt for description and units.

   fbodybodygyromagstd	Average of fBodyBodyGyroMag-std().  See UCI HAR Dataset\features_info.txt for description and units.

   fbodybodygyromagmeanfreq	Average of fBodyBodyGyroMag-meanFreq().  See UCI HAR Dataset\features_info.txt for description and units.

   fbodybodygyrojerkmagmean	Average of fBodyBodyGyroJerkMag-mean().  See UCI HAR Dataset\features_info.txt for description and units.

   fbodybodygyrojerkmagstd	Average of fBodyBodyGyroJerkMag-std().  See UCI HAR Dataset\features_info.txt for description and units.

   fbodybodygyrojerkmagmeanfreq	Average of fBodyBodyGyroJerkMag-meanFreq().  See UCI HAR Dataset\features_info.txt for description and units.

   angletbodyaccmeangravity	Average of angle(tBodyAccMean,gravity).  See UCI HAR Dataset\features_info.txt for description and units.

   angletbodyaccjerkmeangravitymean	Average of angle(tBodyAccJerkMean),gravityMean).  See UCI HAR Dataset\features_info.txt for description and units.

   angletbodygyromeangravitymean	Average of angle(tBodyGyroMean,gravityMean).  See UCI HAR Dataset\features_info.txt for description and units.

   angletbodygyrojerkmeangravitymean	Average of angle(tBodyGyroJerkMean,gravityMean).  See UCI HAR Dataset\features_info.txt for description and units.

   anglexgravitymean	Average of angle(X,gravityMean).  See UCI HAR Dataset\features_info.txt for description and units.

   angleygravitymean	Average of angle(Y,gravityMean).  See UCI HAR Dataset\features_info.txt for description and units.

   anglezgravitymean	Average of angle(Z,gravityMean).  See UCI HAR Dataset\features_info.txt for description and units.
