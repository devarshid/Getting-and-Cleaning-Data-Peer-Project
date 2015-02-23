# Change directory to the 'train' folder
# Read X_train, y_train, subject_train files into data frames of same name

X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

# Change directory to UCI HAR Dataset folder
# Read features and activity_labels files into data frames of same name
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

# Assigned column names to the training data from the features variable
names(X_train) <- features$V2

# Changed column name V1 to activityID in activity_labels data frame
names(activity_labels)[names(activity_labels)=="V1"] <- "activityID"

# Append subject column to the X_train data frame
X_train <- cbind(X_train, subject=subject_train[,1])

# Append activityId column to X_train data frame
X_train <- cbind(X_train, activityID=y_train[,1])

# Use merge function to add activity description to the X_train data frame
X_train <- merge(X_train, activity_labels, by="activityID")

# Change column name for the newly added column to activity
names(X_train)[names(X_train)=="V2"] <- "activity"

# Change directory to test folder
# Read X_test, y_test, subject_test files into data frames of same name
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")

# Assigned column names to the test data frame from the features variable
names(X_test) <- features$V2

# Append subject column to the X_test data frame
X_test <- cbind(X_test, subject=subject_test[,1])

# Append activityId column to X_test data frame
X_test <- cbind(X_test, activityID=y_test[,1])

# Use merge function to add activity description to the X_test data frame
X_test <- merge(X_test, activity_labels, by="activityID")

# Change column name for the newly added column to activity
names(X_test)[names(X_test)=="V2"] <- "activity"

# Combine the two data frames
combinedDataset <- rbind(X_train, X_test)

# Install package gdata to search for column names with word mean and std
install.packages("gdata")
library(gdata)

# meanName is the new vector variable that will be populated with column names that have 'mean' in their name
meanNames <- matchcols(combinedDataset, with=c("mean()"), method="and")

# stdName is the new vector variable that will be populated with column names that have 'std' in their name
stdNames <- matchcols(combinedDataset, with=c("std()"), method="and")

# Combine meanName and stName into one vector called meanAndStd and also add activityID and subject columns
meanAndStd <- c(meanNames, stdNames, "activityID", "subject")

# Following command will filter combinedDataset into a new data frame called meanAndStdData
meanAndStdData <- combinedDataset[, meanAndStd]

