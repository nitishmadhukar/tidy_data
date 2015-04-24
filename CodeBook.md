#Code Book for Getting and Cleaning Data project#

**Overview:** The Code Book contains the data that was used to analyze the readings from the accelerometers of Samsung Galaxy S smartphone for 6 different activites (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) performed by 30 volunteers. The data is divided in training set containing 70% of volunteer's readings and testing set containing 30% of volunteer's readings.

**Files used:**

* features.txt: dimensions(561 * 2) - Contains the 561 feature names that are tracked by the smartphone
* activity_labels.txt: dimensions(6 * 1) - Contains the names and ids of activities performed by volunteers
* X_train.txt: (7352 * 561) - Contains the readings of the smartphone for 70% volunteers
* X_test.txt: (2947 * 561) - Contains the readings of the smartphone for 30% volunteers
* y_train.txt: (7352 * 1) - Contains the activity ids of 70% volunteers (training set)
* y_test.txt: (2947 * 1) - Contains the activity ids of 30% volunteers (testing set)
* subject_train.txt: (7352 * 1) - Contains the ids of 70% volunteers (training set)
* subject_test.txt: (2947 * 1) - Contains the ids of 30% volunteers (testing set)

The files in the Inertial Signals folder are not used as the data requires measurements of mean and standard deviation

**R Script Procedure**

1. Read the features file which are the columns for the training and testing datasets from *features.txt*
2. Read the training dataset from *X_train.txt*
3. Read the activity label ids for training dataset from *y_train.txt*
4. Read the subject ids for training dataset from *subject_train.txt*
5. Read the testing dataset from *X_test.txt*
6. Read the activity label ids for testing dataset from *y_test.txt*
7. Read the subject ids for testing dataset from *subject_test.txt*
8. Combine the training and testing datasets with the corresponding activity label ids and subject ids
9. Merge the training and testing datasets 
10. Transform the activity label ids and subject ids as factors
11. Select the columns that correspond to mean and standard deviation measurements
12. Convert the activity label ids to their corresponding activity labels
13. Rename the variables with descriptive names
14. Melt the data based on subject ids and activity labels
15. Cast the data based on subject ids and activity labels corresponding to the measurement variable
16. Output the data frame as a text file


