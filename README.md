Repo_DataSci_3_Proj_1
=====================

Getting and Cleaning Data Course; repo for project 1.

<h3>PROJECT DESCRIPTION

The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 

  * Merges the training and the test sets to create one data set.
  * Extracts only the measurements on the mean and standard deviation for each measurement. 
  * Uses descriptive activity names to name the activities in the data set
  * Appropriately labels the data set with descriptive variable names. 
  * Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

<h3>THE SCRIPT

The run_analysis.R script first loads the data from the UCI HAR Dataset, and assumes the file structure is unchanged after unzipping the dataset into the working directory.

The script loads all data files from the "Test" subdirectory first; x_test.txt, y_test.txt, and subject_test.txt. It then repeats this for the "Train" subdirectory. Finally, the activity_labels.txt and features.txt files are loaded.

Next, we assign names to all the data index columns, and assign column names to the data itself using the features.txt file we loaded earlier.

Now, we merge the data sets into two dataframes; one for all the data from the Test subdirectory and one for all the data from the Train subdirectory. This is done using cbind() for each dataframe. We append both of these dataframes into a single one using rbind(). Now at this point, all raw data has been merged into a single dataframe.

Following tidy data principles, we want to use descriptive activity labels instead of activity index number, so to do so, we do two things. (1) we merge the aggregate dataframe with the activity_labels data that we loaded at the beginning of the script, merging by the activity index, and (2), we want to delete the column for activity number index since we don't need this.

For this project, we only need features that are mean and std dev variables, so we just extract those columns from the aggregate dataframe using the grep1() function and use the result to subset the data into a filtered dataframe. We can then output this filtered data using write.table().

Our final requirement was to create a second, independent tidy data set with the average of each variable for each activity and each subject. Using the aggregate() function, we can create this second, smaller tidy data set with the required data. The output is writted to a *.txt file.
