# Load TEST data files
x_testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_testData <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subject_testData <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Load TRAIN data files
x_trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_trainData <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subject_trainData <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Load other data files
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")


# Assign names to the data index columns
colnames(activity_labels) <- c("activity_index", "activity")
colnames(features) <- c("feature_index", "feature")
colnames(subject_testData) <- c("subject")
colnames(subject_trainData) <- c("subject")
colnames(y_testData) <- c("activity_index")
colnames(y_trainData) <- c("activity_index")

# Assign column names to the data itself
colnames(x_testData) <- features[[2]]
colnames(x_trainData) <- features[[2]]

# Merge the data sets into two dataframes; one for Test and one for Train
testData <- cbind(subject_testData, y_testData, x_testData)
trainData <- cbind(subject_trainData, y_trainData, x_trainData)

# Append the the two newly created dataframes together into one
allData <- rbind(trainData, testData)

# Following tidy data principles, use descriptive activity labels instead of activity index number
## Step (1) merging the activity_labels data with the comprehensive data set
allData <- merge(allData, activity_labels, by=c("activity_index"))
## Step (2) deleting the activity number index column; we don't need this.
allData$activity_index <- NULL

# We only need features that are mean and std dev variables, so just extract those
filteredColumns <- grepl('mean|std|activity|subject', colnames(allData))
tidyDataSet <- allData[, filteredColumns]

# Write tidy data set into a *.txt file, comma delimited
write.table(tidyDataSet, file = "tidyDataSet.txt", sep=",", row.names=FALSE)

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidyVarMeanData <- aggregate(tidyDataSet[,2:80], by=list(subject=tidyDataSet$subject, activity=tidyDataSet$activity), FUN=mean)

# write out the tidy data set into a *.txt file, comma delimited
write.table(tidyVarMeanData, file = "tidyVarMeanData.txt", sep=",", row.names=FALSE)
