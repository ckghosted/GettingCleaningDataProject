#Data Dictionary - *tidyData.txt*
The data in *tidyData.txt* is produced by the raw data from the link on course website
<br/>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip<br /> which represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
* The experiments have been carried out with a group of **30 volunteers (subjects)** with each performed **6 activities** (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone with embedded **accelerometer** and **gyroscope**.
* The features selected for this database come from the accelerometer and gyroscope 3-axial
raw signals **tAcc-XYZ** and **tGyro-XYZ**. These time-domain signals (prefix 't' to denote time) are captured at a constant rate of 50 Hz. There are also frequency-domain signals **fAcc-XYZ** and **fGyro-XYZ** (prefix 'f' to denote frequency) derived by applying Fast Fourier Transform (FFT) to some of those time-domain signals. Also, the magnitude of these three-dimensional signals were calculated using the Euclidean norm (suffix 'Mag').
* The set of variables that were estimated from these signals are:
> 1. mean(): Mean value
> 2. std(): Standard deviation
* Please refer to *README.txt* and *features_info.txt* from the above link for more details.

This *tidyData.txt* only selects those measurement of mean and standard deviation to calculate the average for each activity and each subject.

### subjectID
An identifier of the subject who carried out the experiment.  
Integer from 1 to 30.

### activity
The activity a subject performed.  
Factors:
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

### tBodyAcc_mean_X
Averaged tBodyAcc-mean()-X for one particular subject performing a certain activity.  
Numeric.

### tBodyAcc_mean_Y
Averaged tBodyAcc-mean()-Y for one particular subject performing a certain activity.  
Numeric.

### tBodyAcc_mean_Z
Averaged tBodyAcc-mean()-Z for one particular subject performing a certain activity.  
Numeric.

### tGravityAcc_mean_X
Averaged tGravityAcc-mean()-X for one particular subject performing a certain activity.  
Numeric.

### tGravityAcc_mean_Y
Averaged tGravityAcc-mean()-Y for one particular subject performing a certain activity.  
Numeric.

### tGravityAcc_mean_Z
Averaged tGravityAcc-mean()-Z for one particular subject performing a certain activity.  
Numeric.

### tBodyAccJerk_mean_X
Averaged tBodyAccJerk-mean()-X for one particular subject performing a certain activity.  
Numeric.

### tBodyAccJerk_mean_Y
Averaged tBodyAccJerk-mean()-Y for one particular subject performing a certain activity.  
Numeric.

### tBodyAccJerk_mean_Z
Averaged tBodyAccJerk-mean()-Z for one particular subject performing a certain activity.  
Numeric.

### tBodyGyro_mean_X
Averaged tBodyGyro-mean()-X for one particular subject performing a certain activity.  
Numeric.

### tBodyGyro_mean_Y
Averaged tBodyGyro-mean()-Y for one particular subject performing a certain activity.  
Numeric.

### tBodyGyro_mean_Z
Averaged tBodyGyro-mean()-Z for one particular subject performing a certain activity.  
Numeric.

### tBodyGyroJerk_mean_X
Averaged tBodyGyroJerk-mean()-X for one particular subject performing a certain activity.  
Numeric.

### tBodyGyroJerk_mean_Y
Averaged tBodyGyroJerk-mean()-Y for one particular subject performing a certain activity.  
Numeric.

### tBodyGyroJerk_mean_Z
Averaged tBodyGyroJerk-mean()-Z for one particular subject performing a certain activity.  
Numeric.

### tBodyAccMag_mean
Averaged tBodyAccMag-mean() for one particular subject performing a certain activity.  
Numeric.

### tGravityAccMag_mean
Averaged tGravityAccMag-mean() for one particular subject performing a certain activity.  
Numeric.

### tBodyAccJerkMag_mean
Averaged tBodyAccJerkMag-mean() for one particular subject performing a certain activity.  
Numeric.

### tBodyGyroMag_mean
Averaged tBodyGyroMag-mean() for one particular subject performing a certain activity.  
Numeric.

### tBodyGyroJerkMag_mean
Averaged tBodyGyroJerkMag-mean() for one particular subject performing a certain activity.  
Numeric.

### fBodyAcc_mean_X
Averaged fBodyAcc-mean()-X for one particular subject performing a certain activity.  
Numeric.

### fBodyAcc_mean_Y
Averaged fBodyAcc-mean()-Y for one particular subject performing a certain activity.  
Numeric.

### fBodyAcc_mean_Z
Averaged fBodyAcc-mean()-Z for one particular subject performing a certain activity.  
Numeric.

### fBodyAccJerk_mean_X
Averaged fBodyAccJerk-mean()-X for one particular subject performing a certain activity.  
Numeric.

### fBodyAccJerk_mean_Y
Averaged fBodyAccJerk-mean()-Y for one particular subject performing a certain activity.  
Numeric.

### fBodyAccJerk_mean_Z
Averaged fBodyAccJerk-mean()-Z for one particular subject performing a certain activity.  
Numeric.

### fBodyGyro_mean_X
Averaged fBodyGyro-mean()-X for one particular subject performing a certain activity.  
Numeric.

### fBodyGyro_mean_Y
Averaged fBodyGyro-mean()-Y for one particular subject performing a certain activity.  
Numeric.

### fBodyGyro_mean_Z
Averaged fBodyGyro-mean()-Z for one particular subject performing a certain activity.  
Numeric.

### fBodyAccMag_mean
Averaged fBodyAccMag-mean() for one particular subject performing a certain activity.  
Numeric.

### fBodyBodyAccJerkMag_mean
Averaged fBodyBodyAccJerkMag-mean() for one particular subject performing a certain activity.  
Numeric.

### fBodyBodyGyroMag_mean
Averaged fBodyBodyGyroMag-mean() for one particular subject performing a certain activity.  
Numeric.

### fBodyBodyGyroJerkMag_mean
Averaged fBodyBodyGyroJerkMag-mean() for one particular subject performing a certain activity.  
Numeric.

### tBodyAcc_std_X
Averaged tBodyAcc-std()-X for one particular subject performing a certain activity.  
Numeric.

### tBodyAcc_std_Y
Averaged tBodyAcc-std()-Y for one particular subject performing a certain activity.  
Numeric.

### tBodyAcc_std_Z
Averaged tBodyAcc-std()-Z for one particular subject performing a certain activity.  
Numeric.

### tGravityAcc_std_X
Averaged tGravityAcc-std()-X for one particular subject performing a certain activity.  
Numeric.

### tGravityAcc_std_Y
Averaged tGravityAcc-std()-Y for one particular subject performing a certain activity.  
Numeric.

### tGravityAcc_std_Z
Averaged tGravityAcc-std()-Z for one particular subject performing a certain activity.  
Numeric.

### tBodyAccJerk_std_X
Averaged tBodyAccJerk-std()-X for one particular subject performing a certain activity.  
Numeric.

### tBodyAccJerk_std_Y
Averaged tBodyAccJerk-std()-Y for one particular subject performing a certain activity.  
Numeric.

### tBodyAccJerk_std_Z
Averaged tBodyAccJerk-std()-Z for one particular subject performing a certain activity.  
Numeric.

### tBodyGyro_std_X
Averaged tBodyGyro-std()-X for one particular subject performing a certain activity.  
Numeric.

### tBodyGyro_std_Y
Averaged tBodyGyro-std()-Y for one particular subject performing a certain activity.  
Numeric.

### tBodyGyro_std_Z
Averaged tBodyGyro-std()-Z for one particular subject performing a certain activity.  
Numeric.

### tBodyGyroJerk_std_X
Averaged tBodyGyroJerk-std()-X for one particular subject performing a certain activity.  
Numeric.

### tBodyGyroJerk_std_Y
Averaged tBodyGyroJerk-std()-Y for one particular subject performing a certain activity.  
Numeric.

### tBodyGyroJerk_std_Z
Averaged tBodyGyroJerk-std()-Z for one particular subject performing a certain activity.  
Numeric.

### tBodyAccMag_std
Averaged tBodyAccMag-std() for one particular subject performing a certain activity.  
Numeric.

### tGravityAccMag_std
Averaged tGravityAccMag-std() for one particular subject performing a certain activity.  
Numeric.

### tBodyAccJerkMag_std
Averaged tBodyAccJerkMag-std() for one particular subject performing a certain activity.  
Numeric.

### tBodyGyroMag_std
Averaged tBodyGyroMag-std() for one particular subject performing a certain activity.  
Numeric.

### tBodyGyroJerkMag_std
Averaged tBodyGyroJerkMag-std() for one particular subject performing a certain activity.  
Numeric.

### fBodyAcc_std_X
Averaged fBodyAcc-std()-X for one particular subject performing a certain activity.  
Numeric.

### fBodyAcc_std_Y
Averaged fBodyAcc-std()-Y for one particular subject performing a certain activity.  
Numeric.

### fBodyAcc_std_Z
Averaged fBodyAcc-std()-Z for one particular subject performing a certain activity.  
Numeric.

### fBodyAccJerk_std_X
Averaged fBodyAccJerk-std()-X for one particular subject performing a certain activity.  
Numeric.

### fBodyAccJerk_std_Y
Averaged fBodyAccJerk-std()-Y for one particular subject performing a certain activity.  
Numeric.

### fBodyAccJerk_std_Z
Averaged fBodyAccJerk-std()-Z for one particular subject performing a certain activity.  
Numeric.

### fBodyGyro_std_X
Averaged fBodyGyro-std()-X for one particular subject performing a certain activity.  
Numeric.

### fBodyGyro_std_Y
Averaged fBodyGyro-std()-Y for one particular subject performing a certain activity.  
Numeric.

### fBodyGyro_std_Z
Averaged fBodyGyro-std()-Z for one particular subject performing a certain activity.  
Numeric.

### fBodyAccMag_std
Averaged fBodyAccMag-std() for one particular subject performing a certain activity.  
Numeric.

### fBodyBodyAccJerkMag_std
Averaged fBodyBodyAccJerkMag-std() for one particular subject performing a certain activity.  
Numeric.

### fBodyBodyGyroMag_std
Averaged fBodyBodyGyroMag-std() for one particular subject performing a certain activity.  
Numeric.

### fBodyBodyGyroJerkMag_std
Averaged fBodyBodyGyroJerkMag-std() for one particular subject performing a certain activity.  
Numeric.

