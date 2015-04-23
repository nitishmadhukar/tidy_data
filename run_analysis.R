# Step 1:
# Read data from features data set. Values in this data set are the variables for test and train data set
columns_data_set <- read.table('features.txt', stringsAsFactors = F)
columns_data <- columns_data_set %>% select(V2) %>% mutate(V2 = gsub("(-)|(,)|([()-])",".",V2))
columns_data <- as.vector(as.matrix(columns_data)) 

#....TRAINING DATASET....
# Read data from the training set
train <- read.table('train/X_train.txt')
colnames(train) <- make.names(names = columns_data, unique=T)

# Read data from training activity labels
train_activity_labels <- read.table('train/y_train.txt')
colnames(train_activity_labels) <- make.names(names = 'activitylabel', unique=T)

# Read data from training subjects
train_subjects <- read.table('train/subject_train.txt')
colnames(train_subjects) <- make.names(names = 'subject', unique = T)

#....TESTING DATASET....
# Read data from the testing set
test <- read.table('test/X_test.txt')
colnames(test) <- make.names(names = columns_data, unique=T)

# Read data from testing activity labels
test_activity_labels <- read.table('test/y_test.txt')
colnames(test_activity_labels) <- make.names(names = 'activitylabel', unique=T)

# Read data from testing subjects
test_subjects <- read.table('test/subject_test.txt')
colnames(test_subjects) <- make.names(names = 'subject', unique = T)

# Combine training and testing data sets with corresponding subjects and activity labels
train_combined <- cbind(train_subjects, train, train_activity_labels)
test_combined <- cbind(test_subjects, test, test_activity_labels)

# Merge training and testing data sets
complete_data <- rbind(train_combined, test_combined)

# Convert the subject and activity label variables as factors
complete_data <- mutate(complete_data, subject = as.factor(subject), activitylabel = as.factor(activitylabel))

# Arranging data based on subjects
complete_data <- arrange(complete_data, subject, activitylabel)

# Step 2:
# Data set with measurements only for mean and standard deviation along with subject and activity label variables
data_mean_sd <- select(complete_data, c(subject, grep('([m|M]ean)|(std)', colnames(complete_data)), activitylabel))

# Step 3: 
# Convert activitylabel integers to corresponding labels
data_mean_sd$activitylabel <- factor(data_mean_sd$activitylabel, labels=c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING'))

# Step 4:
# Change the variable names to be descriptive
colnames(data_mean_sd) <- gsub('mean', 'Mean', colnames(data_mean_sd))
colnames(data_mean_sd) <- gsub('std', 'SD', colnames(data_mean_sd))
colnames(data_mean_sd) <- gsub('^t', 'Time', colnames(data_mean_sd))
colnames(data_mean_sd) <- gsub('^f', 'Frequency', colnames(data_mean_sd))
colnames(data_mean_sd) <- gsub('BodyBody', 'Body', colnames(data_mean_sd))
colnames(data_mean_sd) <- gsub('Acc', 'Accelerometer', colnames(data_mean_sd))
colnames(data_mean_sd) <- gsub('Gyro', 'Gyroscope', colnames(data_mean_sd))

# Step 5:
# Melt data based on subject and activity labels
data_melted <- melt(data_mean_sd, id = c('subject', 'activitylabel'))
# Tidy data
tidy_data <- dcast(data_melted, subject+activitylabel ~ variable, mean)

# Writing the table as a text file
write.table(tidy_data, file = 'tidy_data_mean_sd.txt', row.names = F)
