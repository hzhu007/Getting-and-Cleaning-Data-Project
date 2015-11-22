run_analysis <- function()
{
    library(data.table)
    library(dplyr)
    rm(list = ls())
    XFeatures <- fread("UCI HAR Dataset/features.txt")
    # Read the training data 
    train.X <- fread("UCI HAR Dataset/train/X_train.txt", header = F)
    names(train.X) <- XFeatures[[2]]
    train.y <- fread("UCI HAR Dataset/train/y_train.txt", 
                    header = F, col.names = "activity_label")
    train.subject <- fread("UCI HAR Dataset/train/subject_train.txt",
                          header = F, col.names = "subject")
    train.body_acc_x <- fread("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt",
                              header = F)
    names(train.body_acc_x) <- paste("body_acc_x", 
                                     seq(dim(train.body_acc_x)[2]), sep = "")
    train.body_acc_y <- fread("UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt",
                              header = F)
    names(train.body_acc_y) <- paste("body_acc_y", 
                                     seq(dim(train.body_acc_y)[2]), sep = "")
    train.body_acc_z <- fread("UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt",
                              header = F)
    names(train.body_acc_z) <- paste("body_acc_z", 
                                     seq(dim(train.body_acc_z)[2]), sep = "")
    train.body_gyro_x <- fread("UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt",
                              header = F)
    names(train.body_gyro_x) <- paste("body_gyro_x", 
                                     seq(dim(train.body_gyro_x)[2]), sep = "")
    train.body_gyro_y <- fread("UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt",
                               header = F)
    names(train.body_gyro_y) <- paste("body_gyro_y", 
                                      seq(dim(train.body_gyro_y)[2]), sep = "")
    train.body_gyro_z <- fread("UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt",
                               header = F)
    names(train.body_gyro_z) <- paste("body_gyro_z", 
                                      seq(dim(train.body_gyro_z)[2]), sep = "")
    train.total_acc_x <- fread("UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt",
                               header = F)
    names(train.total_acc_x) <- paste("total_acc_x", 
                                      seq(dim(train.total_acc_x)[2]), sep = "")
    train.total_acc_y <- fread("UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt",
                               header = F)
    names(train.total_acc_y) <- paste("total_acc_y", 
                                      seq(dim(train.total_acc_y)[2]), sep = "")
    train.total_acc_z <- fread("UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt",
                               header = F)
    names(train.total_acc_z) <- paste("total_acc_z", 
                                      seq(dim(train.total_acc_z)[2]), sep = "")
    trainData <- cbind(train.X, train.y, train.subject, 
                      train.body_acc_x, train.body_acc_y, train.total_acc_z,
                      train.body_gyro_x, train.body_gyro_y, train.body_gyro_z,
                      train.total_acc_x, train.total_acc_y, train.total_acc_z)
    
    # Read the test data
    test.X <- fread("UCI HAR Dataset/test/X_test.txt", header = F)
    names(test.X) <- XFeatures[[2]]
    test.y <- fread("UCI HAR Dataset/test/y_test.txt", 
                     header = F, col.names = "activity_label")
    test.subject <- fread("UCI HAR Dataset/test/subject_test.txt",
                           header = F, col.names = "subject")
    test.body_acc_x <- fread("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt",
                              header = F)
    names(test.body_acc_x) <- paste("body_acc_x", 
                                     seq(dim(test.body_acc_x)[2]), sep = "")
    test.body_acc_y <- fread("UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt",
                              header = F)
    names(test.body_acc_y) <- paste("body_acc_y", 
                                     seq(dim(test.body_acc_y)[2]), sep = "")
    test.body_acc_z <- fread("UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt",
                              header = F)
    names(test.body_acc_z) <- paste("body_acc_z", 
                                     seq(dim(test.body_acc_z)[2]), sep = "")
    test.body_gyro_x <- fread("UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt",
                               header = F)
    names(test.body_gyro_x) <- paste("body_gyro_x", 
                                      seq(dim(test.body_gyro_x)[2]), sep = "")
    test.body_gyro_y <- fread("UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt",
                               header = F)
    names(test.body_gyro_y) <- paste("body_gyro_y", 
                                      seq(dim(test.body_gyro_y)[2]), sep = "")
    test.body_gyro_z <- fread("UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt",
                               header = F)
    names(test.body_gyro_z) <- paste("body_gyro_z", 
                                      seq(dim(test.body_gyro_z)[2]), sep = "")
    test.total_acc_x <- fread("UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt",
                               header = F)
    names(test.total_acc_x) <- paste("total_acc_x", 
                                      seq(dim(test.total_acc_x)[2]), sep = "")
    test.total_acc_y <- fread("UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt",
                               header = F)
    names(test.total_acc_y) <- paste("total_acc_y", 
                                      seq(dim(test.total_acc_y)[2]), sep = "")
    test.total_acc_z <- fread("UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt",
                               header = F)
    names(test.total_acc_z) <- paste("total_acc_z", 
                                      seq(dim(test.total_acc_z)[2]), sep = "")
    testData <- cbind(test.X, test.y, test.subject, 
                      test.body_acc_x, test.body_acc_y, test.total_acc_z,
                      test.body_gyro_x, test.body_gyro_y, test.body_gyro_z,
                      test.total_acc_x, test.total_acc_y, test.total_acc_z)
    # Merge the traning set and the test set
    mergedData <- rbind(trainData, testData)
    mergedData <- as.data.frame(mergedData)
    # Extract the measurements on the mean and standard deviation
    ColIdx <- grep("mean\\(\\)|std\\(\\)|activity_label|subject", names(mergedData))
    extractedData <- mergedData[ColIdx]
    # Add descriptive activity names
    activityNames <- fread("UCI HAR Dataset/activity_labels.txt", data.table = F)
    activityNames <- activityNames[[2]]
    descriptiveLabel <- character(dim(extractedData)[1])
    for(i in seq(along.with = activityNames))
    {
        idx <- extractedData$activity_label == i
        descriptiveLabel[idx] <- activityNames[i]
    }
    extractedData$activity_label <- descriptiveLabel
    # Average tidy data
    groupedData <- group_by(extractedData, activity_label, subject)
    measurements <- names(extractedData)
    tidyData <- summarize_each(groupedData, funs(mean))
    write.table(tidyData, file = "tidy_data.txt", row.name=FALSE)
}
