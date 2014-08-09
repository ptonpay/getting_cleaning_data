# Merge all the training data. subject_train and y_train would be merged as two new columns using cbind function.
# y_train is the activity and subject_train is the subject
#
training <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
y_train <- read.csv("UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE)
subject_train <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE) 
training <- cbind(training, y_train)
training <- cbind(training, subject_train)

# New names of the columns added are V1 and V2,, changing the names to make them V562 and V563
#
names(training)[562:563] <- c("V562", "V563") 

# Merge all the testing data. subject_test and y_test would be merged as two new columns using cbind function.
# y_test is the activity and subject_test is the subject
#
testing <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
y_test <- read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
subject_test <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)
testing <- cbind(testing , y_test )
testing <- cbind(testing , subject_test )

# New names of the columns added are V1 and V2,, changing the names to make them V562 and V563
#
names(testing)[562:563] <- c("V562", "V563") 

# Step1: Merges the training and the test sets to create one data set.
# Merge training and testing data as required by the exercise  
#
test_and_train <- rbind(training, testing)

activitylabels <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

# Read features from features.txt file and change the name of the feature for better handling
#
features <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features[,"V2"] <- gsub('-std', 'Std', features[,"V2"])
features[,"V2"] <- gsub('-Std', 'Std', features[,"V2"])
features[,"V2"] <- gsub('-mean', 'Mean', features[,"V2"])
features[,"V2"] <- gsub('-Mean', 'Mean', features[,"V2"])
features[,"V2"] <- gsub('[-()]', '', features[,"V2"])

# Step2: Extracts only the measurements on the mean and standard deviation for each measurement. 
#
extractedCols <- grep(".*[Ss]td.*|.*[Mm]ean.*", features[,"V2"])

# As we are concerned only about Standard Deviation and Mean, extract only those variables
#
features <- features[extractedCols,]

# Now add the last two columns (subject and activity)
#
extractedCols <- c(extractedCols, 562, 563)

# Extract the relevant columns from test_and_train
#
test_and_train <- test_and_train[,extractedCols]

# Add the column names (features) to test_and_train
#
colnames(test_and_train) <- c(features$V2, "activity", "subject")
colnames(test_and_train) <- tolower(colnames(test_and_train))

# Step 3: Uses descriptive activity names to name the activities in the data set
# Loop through the activitylables and using gsub replace them with descriptive names in 
# test_and_train 
#
activity <- 1
for (currentActivityLabel in activitylabels$V2) {
  test_and_train$activity <- gsub(activity, currentActivityLabel, test_and_train$activity)
  activity <- activity + 1
}

# convert subject and activity to factor as per tidy rules
#
test_and_train$activity <- as.factor(test_and_train$activity)
test_and_train$subject <- as.factor(test_and_train$subject)

finalTidyData <- aggregate(test_and_train, by=list(activity = test_and_train$activity, subject=test_and_train$subject), mean)

# Remove the subject and activity column, since a mean of those has no use
finalTidyData[,89] = NULL
finalTidyData[,90] = NULL
write.table(finalTidyData, "finalTidy.txt", sep="\t")
