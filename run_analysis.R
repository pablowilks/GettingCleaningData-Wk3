setwd("C:/Users/user/Desktop/Coursera/GettingCleaningData/Wk3")

# 1. Merge the training and the test sets to create one data set.

features <- read.table("features.txt")

X_test <- read.table("./test/X_test.txt", col.names=features[,2])
X_train <- read.table("./train/X_train.txt", col.names=features[,2])
X <- rbind(X_test, X_train)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
interestingFeatures <- features[grep("(mean|std)\\(", features[,2]),]
meanstandard <- X[,interestingFeatures[,1]]

# 3. Uses descriptive activity names to name the activities in the data set

y_test <- read.table("./test/y_test.txt", col.names = c('activity'))
y_train <- read.table("./train/y_train.txt", col.names = c('activity'))
y <- rbind(y_test, y_train)

descnames <- read.table("activity_labels.txt")
for (i in 1:nrow(descnames)) {
        code <- as.numeric(descnames[i, 1])
        name <- as.character(descnameheads[i, 2])
        y[y$activity == code, ] <- name
}

# 4. Appropriately labels the data set with descriptive activity names. 
X_with_activity_names <- cbind(y, X)
meanstandard_with_activity_names <- cbind(y, meanstandard)

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
subject_test <- read.table("./test/subject_test.txt", col.names = c('subject'))
subject_train <- read.table("./train/subject_train.txt", col.names = c('subject'))
subject <- rbind(subject_test, subject_train)
averages <- aggregate(X, by = list(activity = y[,1], subject = subject[,1]), mean)

write.csv(averages, file='tidydataset.txt', row.names=FALSE)
