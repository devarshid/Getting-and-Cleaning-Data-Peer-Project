Below are the variables used in cleaning data and the logic followed

Read X_train, y_train, subject_train files into data frames of same name

Read features and activity_labels files into data frames of same name

Features data file contains names of columns. Assigned these column names to the training data from the features variable

Changed the default column name V1 to activityID in activity_labels data frame

Append subject column to the X_train data frame. This is the list of subjects that took the experiment.

Append activityId column to X_train data frame. The data is the first column of y_train data file

Merge X_train and activity to get the activity description that is then added as a column to the X_train data frame

Change column name for the newly added column to activity for easy identification

Change directory to test folder and follow similar procedure with test data

Read X_test, y_test, subject_test files into data frames of same name

Assigned column names to the test data frame from the features variable

Append subject column to the X_test data frame

Append activityId column to X_test data frame

Use merge function to add activity description to the X_test data frame

Change column name for the newly added column to activity

Combine the two data frames

Install package gdata to search for column names with word mean and std

meanName is the new vector variable that will be populated with column names that have 'mean' in their name

stdName is the new vector variable that will be populated with column names that have 'std' in their name

Combine meanName and stName into one vector called meanAndStd

Filter combinedDataset based on meanAndStd vector into a new data frame called meanAndStdData

