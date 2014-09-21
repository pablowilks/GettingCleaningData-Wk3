GettingCleaningData-Wk3
=======================

This is a brief outline of the steps taken in putting together run_analysis.R

#Merges the training and the test sets to create one data set.

firstly i read in featres.txt. for the sake of simplicity i unzipped all files and saved them locally on my desktop

I then pull in X_test.txt and X_train.txt, then i apply the column names from features.txt
i then combine them using rbind

Extracts only the measurements on the mean and standard deviation for each measurement.

i did this by running regular expression (grep function) on features.txt to only pull out features that contain mean and std

then, i extracted any columns that corresponded to these extracted features in the combined dataset and called it meanstandard

#Uses descriptive activity names to name the activities in the data set

I got these from ativity_labels.txt 

#Appropriately labels the data set with descriptive activity names.

Here I combined the labels and the data set using cbind; doing that for both meanstandard and X.

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

I did this by using the aggregate fucntion, applying it over X and applying mean to activity and subject. this was the saved to tidydataset.txt
