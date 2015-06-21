run_analysis = function(directory = ".") {
    ## Step 1: Merges the training and the test sets to create one data set
    # Create the merged dataset
    XTest = read.table("test/X_test.txt", nrows = 2947)
    XTrain = read.table("train/X_train.txt", nrows = 7352)
    XData = rbind(XTest, XTrain)
    
    ## Step 2: Extracts only the measurements on the mean and standard 
    ##         deviation for each measurement
    # Read all feature names from features.txt
    feature = read.table("features.txt", row.names = 1, nrows = 561)
    # Eliminate duplicate names
    feature <- make.unique(as.character(feature$V2), sep = "_")
    # Set the column names of XData
    names(XData) = feature
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
    
    ## Step 3: Uses descriptive activity names to name the activities in the 
    ##         data set.
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
    
    ## Step 4: Appropriately labels the data set with descriptive variable 
    ##         names.
    # Eliminate parentheses and minus signs
    descriptiveVariableNames = gsub("[-()]",
                                    "_",
                                    gsub("()",
                                         "", 
                                         names(XDataSelected),
                                         fixed = TRUE))
    names(XDataSelected) = descriptiveVariableNames
    
    ## Step 5: From the data set in step 4, creates a second, independent tidy
    ##         data set with the average of each variable for each activity and 
    ##         each subject.
    # Use the aggregate function to apply the mean function to every column in
    # the dataset subsetted by first subjectID and then activity
    XDataAverage = aggregate(XDataSelected[3:dim(XDataSelected)[2]], 
                             by = list(subjectID = XDataSelected$subjectID, 
                                       activity = XDataSelected$activity), 
                             mean)
    # Sort the rows according to subjectID
    XDataAverage = arrange(XDataAverage, subjectID)
}