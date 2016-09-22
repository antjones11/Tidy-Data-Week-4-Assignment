This readme file summaries the steps to run the script run_analysis.R

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Good luck!


Instructions to Run Script:

Download the data and run_analysis script and set the working directory as the UCI HAR Dataset folder
type run_analysis() in a R console
one output file "tidydata.txt" will be saved in the working directory


The script aims to produce a single tidy dataset that is spanned across multiple input files

Each variable forms a column

Each observation forms a row

Each type of observational unit forms a table


The script does the following operations

1. Loads the input data files consisting of measurement data, the associated activity type (one of 6 levels), and the associated
    subject ID (one of 30 partipicants)
    
2. Load the features.txt file which consists of 561 variable description names which correspond to the measurement variables.
   This file is used to name the columns in the measurement data frame
   
3. Load the activity_labels.txt file which consists of the 6 descriptions and ID code for each activity

4. Variables with "mean" or "std" are selected to generate a subset

5. The the data columns are binded with activity and partipicant labels

6. The training and test datasets are row binded to form a tidy dataset

7. Data factors are created for the activity and subject

8. A final tidy dataset with the average measurement over each combination of subject and activity

9. Writes the data out into a file called tidydata.txt
