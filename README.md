Repo_DataSci_3_Proj_1
=====================

Getting and Cleaning Data Course; repo for project 1.

The run_analysis.R script first loads the data from the UCI HAR Dataset, and assumes the file structure is unchanged after unzipping the dataset into the working directory.

The script loads all data files from the "Test" subdirectory first; x_test.txt, y_test.txt, and subject_test.txt. It then repeats this for the "Train" subdirectory. Finally, the activity_labels.txt and features.txt files are loaded.

Next, we assign names to all the data index columns, and assign column names to the data itself using the features.txt file we loaded earlier.

Now, we merge the data sets into two dataframes; one for all the data from the Test subdirectory and one for all the data from the Train subdirectory. This is done using cbind() for each dataframe. We append both of these dataframes into a single one using rbind(). Now at this point, all raw data has been merged into a single dataframe.

Following tidy data principles, we want to use descriptive activity labels instead of activity index number, so to do so, we do two things. (1) we merge the aggregate dataframe with the activity_labels data that we loaded at the beginning of the script, merging by the activity index, and (2), we want to delete the column for activity number index since we don't need this.

For this project, we only need features that are mean and std dev variables, so we just extract those columns from the aggregate dataframe using the grep1() function and use the result to subset the data into a filtered dataframe. We can then output this filtered data using write.table().

Our final requirement was to create a second, independent tidy data set with the average of each variable for each activity and each subject. Using the aggregate() function, we can create this second, smaller tidy data set with the required data. The output is writted to a *.txt file.
