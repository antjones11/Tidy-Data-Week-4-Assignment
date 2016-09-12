## This script summarises a set of input data files to create a tidy dataset
## Each variable forms a column
## Each observation forms a row
## Each type of observational unit forms a table
##
## The script does the following operations
## 1. Loads the input data files consisting of measurement data, the associated activity type (one of 6 levels), and the associated
##    subject ID (one of 30 partipicants)
## 2. Load the features.txt file which consists of 561 variable description names which correspond to the measurement variables.
##    This file is used to name the columns in the measurement data frame
## 3. Load the activity_labels.txt file which consists of the 6 descriptions and ID code for each activity
## 4. Variables with "mean()" or "std()" are selected to generate a subset
## 5. The the data columns are binded with activity and partipicant labels
## 6. The training and test datasets are row binded to form a tidy dataset
## 7. Data factors are created for the activity and participant
## 8. A final tidy dataset with the average measurement over each combination of participant and activity
## 9. Writes the data out into a file called tidydata.txt