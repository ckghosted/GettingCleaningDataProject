# GettingCleaningDataProject
Course Project of the Coursera course: Getting and Cleaning Data

## Introduction
The data linked to from the course website
<br/>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip<br /> represent data collected from the accelerometers from the Samsung Galaxy S smartphone. The main task of this course project is to create one R script called *run_analysis.R* that does the following:
<ol>
<li>Merges the training and the test sets to create one data set.</li>
<li>Extracts only the measurements on the mean and standard deviation for each measurement.</li>
<li>Uses descriptive activity names to name the activities in the data set.</li>
<li>Appropriately labels the data set with descriptive variable names.</li>
<li>From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.</li>
</ol>

## Files in this Repo
1. **README.md** - This README file.

2. **CodeBook.md** - This code book describes the variable names of the tidy data set.

3. **run_analysis.R** - This is the R script used to manipulate data in this project. Please download it to the working directory where the Samsung data is stored (e.g., the directory named "UCI HAR Dataset") and type the following command.
    ```sh
    source("run_analysis.R")
    tidyData = run_analysis()
    ```
    Then the desired tidy data set called **tidyData** will be produced, which can be exported as a text file (*tidyData.txt*) by the following command.
    ```sh
    write.table(tidyData, "./tidyData.txt", row.names = FALSE)
    ```
    To load *tidyData.txt* into R, use the command.
    ```sh
    tidyData = read.table("./tidyData.txt", header = TRUE)
    ```

## How the Script Works
1. The test data (*X_test.txt*) and the train data (*X_train.txt*) are first loaded into R using **read.table()** function, in which the *nrows* parameters are specified to speed-up the process. Then, the two data sets are combined by **rbind()** function to create a huge 10299-by-561 data.frame called **XData**.
    
    ```sh
    # Create the merged dataset
    XTest = read.table("test/X_test.txt", nrows = 2947)
    XTrain = read.table("train/X_train.txt", nrows = 7352)
    XData = rbind(XTest, XTrain)
    ```
    
2. The 561 column names of **XData** are obtained by reading *feature.txt*. Again, the *nrows* parameter is specified to speed-up the process. Also, *row.names = 1* means the row names are set to be the first column in *feature.txt*, i.e., numbers 1, 2, ..., 561.
    
    ```sh
    # Read all feature names from features.txt
    feature = read.table("features.txt", row.names = 1, nrows = 561)
    ```
    Before setting the 561 column names of **XData** to the above feature names, duplicate names must be eliminated to prevent the *ERROR: found duplicated column name* later in **select()** function. This is done by **make.unique()** function, in which the character string used to separate a duplicate name from its sequence number is the under score (_).
    ```sh
    # Eliminate duplicate names
    feature <- make.unique(as.character(feature$V2), sep = "_")
    # Set the column names of XData
    names(XData) = feature
    ```
    
    Before extracting the measurements on the mean and standard deviation, subject IDs and the activities (still numbers 1, 2, 3, 4, 5, and 6 at the moment) correponding to all observetions in **XData** are added. For subject IDs, *subject_test.txt* and *subject_train.txt* are loaded and combined into a 10299-by-1 data set, which is then added into **XData** as its right-most column by a simple subsetting expression. The *nrows* parameters are also specified while reading files to speed-up the process. The procedures for activities are similar.
    
    ```sh
    # Add the "subjectID" variable according to subject_test.txt and 
    # subject_train.txt
    subjectTest = read.table("./test/subject_test.txt", nrows = 2947)
    subjectTrain = read.table("./train/subject_train.txt", nrows = 7352)
    subjectData = rbind(subjectTest, subjectTrain)
    XData$subjectID = subjectData$V1
    # Add the "activity" variable according to y_test.txt and y_train.txt
    yTest = read.table("test/y_test.txt", nrows = 2947)
    yTrain = read.table("train/y_train.txt", nrows = 7352)
    yData = rbind(yTest, yTrain)
    XData$activity = yData$V1
    ```
    
    At this point, the columns that contain keywords *mean* and *std* are selected by **select()** function. Features with names start with *angle* or contain *meanFreq* are excluded since it means angle between two vectors and weighted average of the frequency components, respectively. The selected data set is a 10299-by-68 data.frame called **XDataSelected**.
    
    ```sh
    # Select the measurements on the mean and standard deviation.
    # Features with names start with "angle" and contain "meanFreq" are 
    # excluded.
    library(dplyr)
    XDataSelected = select(XData, 
                           subjectID, 
                           activity, 
                           contains("mean"), 
                           contains("std"),
                           -starts_with("angle"),
                           -contains("freq"))
    ```
    
3. Replace the numbers (1, 2, 3, 4, 5, and 6) of the *activity* variable in **XDataSelected** using descriptive activity names from *activity_labels.txt* (WALKING, WALKING_UPSTAIRS, etc.). This is done by combining **mutate()** and **factor()** functions.
    
    ```sh
    # Read the descriptive activity names
    activityLabels = read.table("./activity_labels.txt",
                                nrows = 6,
                                row.names = 1)
    # Use the mutate function and the factor function to transform the 
    # activities into descriptive activity names.
    XDataSelected <- mutate(XDataSelected, 
                            activity = factor(activity, 
                                              c(1:6), 
                                              activityLabels$V2))
    ```
4. The original feature names defined in *feature.txt* are already very descriptive. Here, only the parentheses and minus signs are eliminated in order to fit the naming rule of column names in R. For example, *tBodyAcc-mean()-X* will be replaced by *tBodyAcc_mean_X*; Otherwise, it will be transformed to *tBodyAcc.mean...X* when exporting this data set as a text file.
    
    ```sh
    # Eliminate parentheses and minus signs
    descriptiveVariableNames = gsub("[-()]",
                                    "_",
                                    gsub("()",
                                         "", 
                                         names(XDataSelected),
                                         fixed = TRUE))
    names(XDataSelected) = descriptiveVariableNames
    ```
    
5. Creates the tidy data set with the average of each variable for each activity and each subject. This is done by **aggregate()** function, in which the target R object is all the measurements on the mean and standard deviation in **XDataSelected**, and the list of grouping elements are set to first *subjectID* and then *activity*, which means that the **mean()** function is applied by groups first specified by *subjectID* and then specified by *activity*. The result is a 180-by-68 data.frame called **XDataAverage**. Finally, **arrange()** function is used to sort the rows of **XDataAverage** by *subjectID*.
    
    ```sh
    # Use the aggregate function to apply the mean function to every column in
    # the dataset subsetted by first subjectID and then activity
    XDataAverage = aggregate(XDataSelected[3:dim(XDataSelected)[2]], 
                             by = list(subjectID = XDataSelected$subjectID, 
                                       activity = XDataSelected$activity), 
                             mean)
    # Sort the rows according to subjectID
    XDataAverage = arrange(XDataAverage, subjectID)
    ```
    
    The data.frame **XDataAverage** is the desired tidy data that meets the tidy data principles:
    > 1. Each measured variable should be in one column. In this case, the measured variables are those measurements on the mean and standard deviation (such as *tBodyAcc_mean_X*).
    > 2. Each different observation of that variable should be in a different row. In this case, one observation corresponds to exactly a single person (specified by *subjectID*) performing a certain activity (specified by the *activity*).
