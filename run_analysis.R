setwd("C:/Users/user/Desktop/Coursera/GettingCleaningData/Wk3")

# 1. Merge the training and the test sets to create one data set.

features <- read.table("features.txt")

Xtest <- read.table("./test/X_test.txt", col.names=features[,2])
Xtrain <- read.table("./train/X_train.txt", col.names=features[,2])
X <- rbind(Xtest, Xtrain)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
interestingFeatures <- features[grep("(mean|std)\\(", features[,2]),]
meanstandard <- X[,interestingFeatures[,1]]

# 3. Uses descriptive activity names to name the activities in the data set

ytest <- read.table("./test/y_test.txt", col.names = c('activity'))
ytrain <- read.table("./train/y_train.txt", col.names = c('activity'))
y <- rbind(ytest, ytrain)

descnames <- read.table("activity_labels.txt")
for (i in 1:nrow(descnames)) {
        code <- as.numeric(descnames[i, 1])
        name <- as.character(descnameheads[i, 2])
        y[y$activity == code, ] <- name
}

# 4. Appropriately labels the data set with descriptive activity names. 
Xwithactivitynames <- cbind(y, X)
meanstandardwithactivitynames <- cbind(y, meanstandard)

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
subjecttest <- read.table("./test/subject_test.txt", col.names = c('subject'))
subjecttrain <- read.table("./train/subject_train.txt", col.names = c('subject'))
subject <- rbind(subjecttest, subjecttrain)
averages <- aggregate(X, by = list(activity = y[,1], subject = subject[,1]), mean)

write.csv(averages, file='tidydataset.txt', row.names=FALSE)
