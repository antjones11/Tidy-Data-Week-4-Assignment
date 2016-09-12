## This script summarises a set of input data files to create a tidy dataset
## Each variable forms a column
## Each observation forms a row
## Each type of observational unit forms a table
##
## The script does the following operations
## 1. Loads the input data files consisting of measurement data, the associated activity type (one of 6 levels), and the associated
## subject ID (one of 30 partipicants)
## 2. Load the features.txt file which consists of 561 variable description names which correspond to the measurement variables.
## This file is used to name the columns in the measurement data frame
## 3. Load the activity_labels.txt file which consists of the 6 descriptions and ID code for each activity
## 4. Variables with "mean()" or "std()" are selected to generate a subset
## 5. The the data columns are binded with activity and partipicant labels
## 6. The training and test datasets are row binded to form a tidy dataset
## 7. Data factors are created for the activity and participant
## 8. A final tidy dataset with the average measurement over each combination of participant and activity
## 9. Writes the data out into a file called tidydata.txt

run_analysis <- function(){

  #load the data, labels, and subject files for both the training and test datasets
  data.test <- read.table("./test/X_test.txt", header=FALSE)
  data.train <- read.table("./train/X_train.txt", header=FALSE)
  labels.test <- read.table("./test/y_test.txt", header=FALSE,col.names = c("ActivityID"))
  labels.train <- read.table("./train/y_train.txt", header=FALSE,col.names = c("ActivityID"))
  subjects.train <- read.table("./train/subject_train.txt", header=FALSE,col.names = c("Subject"))
  subjects.test <- read.table("./test/subject_test.txt", header=FALSE,col.names = c("Subject"))
  
  #load the features and activity label files
  features <- read.table("./features.txt", header=FALSE)
  activity_lbls <- read.table("./activity_labels.txt", header=FALSE, col.names = c("ActivityID","Activity"))
  
  #Rename the columns according to the features file (561 columns)
  colnames(data.train) <- features$V2
  colnames(data.test) <- features$V2
  
  #create a logical vector that matches column names containing strings "std()" or "mean()"
  matching_cols <- grepl("mean\\(\\)|std\\(\\)",features$V2)
  data.train <- data.train[matching_cols]
  data.test <- data.test[matching_cols]
  
  #bind the activity labels, subject labels, and data
  train <- cbind(labels.train,subjects.train,data.train)
  test <- cbind(labels.test,subjects.test,data.test)
  
  #create the first tidy data set by binding train and test sets
  tidy <- rbind(train,test)

  #create factor variables for the activity and subject columns
  tidy$ActivityID <- factor(tidy$ActivityID,
                            levels=activity_lbls$ActivityID,
                            labels = activity_lbls$Activity)
  tidy$Subject <- factor(tidy$Subject)
  
  #create a second tidy dataset by computing mean signal over each combination of activity and participant factors
  tidy.avg <- aggregate(tidy[,3:68],list(Activity = tidy$ActivityID,
                                         Participant = tidy$Subject),mean)
  
  write.table(tidy.avg,file="tidydata.txt",row.names=FALSE)
}
