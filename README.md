# Project: Getting and Cleaning data

Description: Data is collected from the accelerometers of Samsung Galaxy S smartphone. The data consists of readings from 30 members. Every person performed 6 activities, namely, 'WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING'. The dataset is segregated into 2 parts. The training set consists of 70% of volunteer's readings, remaining 30% is in the testing set. 

Steps to follow: 
1. Download the folder https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the folder
3. Files to be used:
  * features.txt - List of all the features that are the variables for training and testing dataset. 
  * activity_labels.txt - Contains the list of activties performed by the volunteers
  * train/X_tran.txt - Training dataset. Contains values of the accelerometers for 70% volunteers
  * test/X_test.txt  - Testing dataset. Contains values of the accelerometers for 30% volunteers
  * train/y_train.txt - Contains the activity labels for each observation of the training dataset
  * test/y_test.txt - Contains the activity labels for each observation of the testing dataset
  * train/subject_train.txt - Contains the subject ids of the volunteers in the training set
  * test/subject_test.txt - Contains the subject ids of the volunteers in testing set
4. Run R scipt named run_analysis.R. The R script depends on the dplyr and reshape2 packages. Check for the description of run_analysis.R file in CodeBook.md
5. The R script outputs a file named tidy_data.txt

###For information on the data refer CodeBook.md 
  