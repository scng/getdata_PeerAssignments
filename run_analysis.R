require("dplyr")

# assume raw data files has been downloaded and unzipped into folder "data"

#get feature names
features <- read.table("./data/features.txt", stringsAsFactors=FALSE)
#Perform some massaging on the feature names by adding descriptive prefix (Time/Frequency)
#and remove some special characters
feature_names <- features[,2]
feature_names <- gsub("^t", "Time.", feature_names)
feature_names <- gsub("^f", "Frequency.", feature_names)
#change "()" to "__". This is for distinguishing feature names with mean() and std()
feature_names <- gsub("\\()", "__", feature_names)
feature_names <- gsub("\\(", ".", feature_names)
feature_names <- gsub("\\)", "", feature_names)
feature_names <- gsub("\\,", ".", feature_names)

#apply make.name function to ensure that the feature_names contain valid R variable characters 
#and prevent errors when running dplyr functions(e.g. select, join), 
#The feature names are also converted to lower case for easier reference when 
#only the mean/std variables are extracted in later step
valid_feature_col_names <- tolower(make.names(names=feature_names, unique=TRUE, allow_=TRUE))
# valid_feature_col_names <- tolower(feature_names)

#test_data stores the measurements recorded for the subjects' activities
test_data <- read.table("./data/test/x_test.txt", sep = "" ,header=FALSE,
                        na.strings ="", stringsAsFactors= FALSE)

#assign converted feature names as column names of test_data
names(test_data) <- valid_feature_col_names

#extract only the mean and standard deviation for each measurement 
#i.e. feature name in original dataset contains mean() or std()
test_data_mean_std <- select(test_data, contains("mean__"), contains("std__"))

#perform a final massaging on collumn names by removing the "__" string
names(test_data_mean_std) <- gsub("__", "", names(test_data_mean_std))

#repeat the above steps on train data
train_data <- read.table("./data/train/X_train.txt", sep = "" ,header=FALSE,
                        na.strings ="", stringsAsFactors= FALSE)
names(train_data) <- valid_feature_col_names
train_data_mean_std <- select(train_data, contains("mean__"), contains("std__"))
names(train_data_mean_std) <- gsub("__", "", names(train_data_mean_std))

#Merges the training and the test datasets' means and standard deviations to create one data set
mean_std_dataset <- rbind(test_data_mean_std, train_data_mean_std)


#read the mapping table between activity label numbers and descriptive activity names from file
activity_labels_names <- read.table("./data/activity_labels.txt", col.names=c("activity.label", "activity.name"), stringsAsFactors=FALSE)

#read the activity label numbers for each subject in the test dataset from file
test_labels <- read.table("./data/test/y_test.txt", col.names=c("activity.label"), stringsAsFactors=FALSE)

#read the subjects' identity for each row of dataset
test_subjects <- read.table("./data/test/subject_test.txt", col.names=c("subject"), stringsAsFactors=FALSE)

#column bind the subject identifiers with activity label numbers
test_subject_labels <- cbind(test_subjects, test_labels)

#repeat the above steps above for train data
train_labels <- read.table("./data/train/y_train.txt", col.names=c("activity.label"), stringsAsFactors=FALSE)
train_subjects <- read.table("./data/train/subject_train.txt", col.names=c("subject"), stringsAsFactors=FALSE)
train_subject_labels <- cbind(train_subjects, train_labels)

#Merge both test and train subject-label numbers datasets into one dataset
consolidated_subject_labels <- rbind(test_subject_labels, train_subject_labels)

#Use the join functions in "dplyr" library to get the activity names corresponding to the activity_label numbers
#and remove the activity label numbers, remain only the activity names column
consolidated_subject_labels <- left_join(consolidated_subject_labels, activity_labels_names)[,-2]

#Perform column bind with the measurement dataset to get the final tidy dataset
tidy_dataset <- cbind(consolidated_subject_labels, mean_std_dataset)

#Finally, creates an independent tidy data set with the average of each variable 
#for each activity and each subject
summarise_tidy_dataset <- tidy_dataset %>% group_by(subject, activity.name) %>% summarise_each(funs(mean))

#Write the summarised dateset to txt file
write.table(summarise_tidy_dataset, file="summarise_tidy_dataset.txt", row.name=FALSE, append=FALSE)