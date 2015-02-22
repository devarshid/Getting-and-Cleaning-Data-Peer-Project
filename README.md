# Getting-and-Cleaning-Data-Peer-Project
Peer Assessment Project as part of the Getting and Cleaning Data course

The run_analysis.R file has sequence of commands to read test and training data files. 
The data is then combined with other data files that has the id of the person who was the subject of the experiment.
The column headers are read from the features data file and populated on the data.

As part of the project training and test data is first combined.
Then it is filtered based on column names that have the word mean or std in them and filtered data is populated 
in a new meanAndStdData data frame.