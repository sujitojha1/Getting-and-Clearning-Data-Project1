# Code Book

**Data** :

1. Downloaded the data from : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
2. And copy the folder "UCI HAR Dataset" to the working directory. Note : folder should not contain subdirectory with same name. Folder content: two folder (train, test) & four files.

**Variables** :

1. Data.frames to load the respective input data : features, activity_labels, Sub_test, X_test ...
2. XY_test : Combining all test data column wise
3. XY_train : Combining all train data column wise
4. XY_data : Combining test & train data row wise
5. XYdata_subset : Subset data frame containing "mean" and "std"
6. XYdata_melt : Melted data frame with activity and subject
7. XYdata_summary : Summarized data frame with mean for all variables

**Processflow** :

1. Reading input files
2. Reading features, activity labels and names
3. Reading test set data
4. Reading train set data
5. Setting the column names based on features
6. Combining the data
7. Setting the column names & giving valid names
8. Merging the data and activity labels
9. Subsetting data for mean and standard deviation
10. Clearing the workspace
11. Average of each variable for each activity and each subject
12. Writing the tidy set in text file
