# Codebook for Getting and Cleaning Data Course Project
S C NG  
20 Apr 2015  
 
##Collection of the raw data
The [data][data_url] used in this project was provided by the [course project page][project_url].
 
##Notes on the original (raw) data 
For the details about the raw data. Please check the [readme][readme_url] and [feature info][feature_url] files, which is extracted from the raw data and included in the github repository for reference.

##Creating the tidy dataset
The following described the actions taken in the scripts to create tidy data from raw data. You may also refer to the comments in the [scripts file][script_url] for the details.

1. Read feature.txt file for the feature names of the measurement. 
2. Perform some transformation on the feature names (e.g. remove special characters like "()", "-", ","... etc., add more descriptive prefix "Time." and "Frequency." to replace the original "r" and "t"). The transformed values will be used as the column names for the measurement datasets
3. Read the measurements for the test dataset from x_test.txt file. 
4. Extract only the mean and standard deviation for each measurement (i.e. original column names with "mean()" or "std()" ) according to the requirement of the course project
5. Repeat steps 3 and 4 on the train dataset from x_train.txt file.
6. Merge the test and train datasets into one single measurement dataset
7. Extract the activity names from activity_labels.txt
8. Extract the subject identities and activity label numbers for test dataset from "subject_test.txt" and "y_test.txt" respectively, and combine them together in one single dataset
9. Repeat step 8 on train dataset (from "subject_train.txt" and "y_train.txt" files)
10. Combine both subject-activity datasets into one single dataset of subject - activity label numbers mapping. Perform a left join to find out the descriptive activity names according to the corresponding activity label numbers
11. Combine the subject-activity dataset and measurement dataset into one tidy dataset
12. Finally, creates an independent tidy data set with the average of each measurement variables grouped by subject and activity. Export the final dataset to [summarise_tidy_dataset.txt][result_url] file 

##Description of the variables in the final dataset
The final dataset contains **180** objects (datarows) with **68** variables (columns). The variables in the final dataset are selected from original measurements data with "mean()" and "std()" in their feature names

##Variables
###subject
Numeric variable. Identifier of each subject (i.e. the 30 volunteers describted in [Readme.txt][readme_url] in raw data) who joined the test and provided the measurement values

###activity.name
Characters variable. The name of the activity performed by the subject

###Other measurement variables
The remaining variables are all Numeric varibles representing the caluculated means of the selected variables, grouped by subject and activity.name. According to the original data's [readme file][readme_url], those measurements are normalized and bounded within [-1,1], so as the calculated means. 

The variable names in the final dataset are converted to be compatible with R variable standard. They are dot-notated, lower-cased, with special character removed. A little conversion has done on the prefix to make it a bit more descriptive to illustrate whether it is a Time domain or Frequency domain signals

The following shows the mapping table between the variable names in the final dataset and the feature names in the original raw data

Variable Names|Feature No.|Original Feature Names
-------|--------|--------
time.bodyacc.mean.x|1|tBodyAcc-mean()-X
time.bodyacc.mean.y|2|tBodyAcc-mean()-Y
time.bodyacc.mean.z|3|tBodyAcc-mean()-Z
time.gravityacc.mean.x|4|tBodyAcc-std()-X
time.gravityacc.mean.y|5|tBodyAcc-std()-Y
time.gravityacc.mean.z|6|tBodyAcc-std()-Z
time.bodyaccjerk.mean.x|41|tGravityAcc-mean()-X
time.bodyaccjerk.mean.y|42|tGravityAcc-mean()-Y
time.bodyaccjerk.mean.z|43|tGravityAcc-mean()-Z
time.bodygyro.mean.x|44|tGravityAcc-std()-X
time.bodygyro.mean.y|45|tGravityAcc-std()-Y
time.bodygyro.mean.z|46|tGravityAcc-std()-Z
time.bodygyrojerk.mean.x|81|tBodyAccJerk-mean()-X
time.bodygyrojerk.mean.y|82|tBodyAccJerk-mean()-Y
time.bodygyrojerk.mean.z|83|tBodyAccJerk-mean()-Z
time.bodyaccmag.mean|84|tBodyAccJerk-std()-X
time.gravityaccmag.mean|85|tBodyAccJerk-std()-Y
time.bodyaccjerkmag.mean|86|tBodyAccJerk-std()-Z
time.bodygyromag.mean|121|tBodyGyro-mean()-X
time.bodygyrojerkmag.mean|122|tBodyGyro-mean()-Y
frequency.bodyacc.mean.x|123|tBodyGyro-mean()-Z
frequency.bodyacc.mean.y|124|tBodyGyro-std()-X
frequency.bodyacc.mean.z|125|tBodyGyro-std()-Y
frequency.bodyaccjerk.mean.x|126|tBodyGyro-std()-Z
frequency.bodyaccjerk.mean.y|161|tBodyGyroJerk-mean()-X
frequency.bodyaccjerk.mean.z|162|tBodyGyroJerk-mean()-Y
frequency.bodygyro.mean.x|163|tBodyGyroJerk-mean()-Z
frequency.bodygyro.mean.y|164|tBodyGyroJerk-std()-X
frequency.bodygyro.mean.z|165|tBodyGyroJerk-std()-Y
frequency.bodyaccmag.mean|166|tBodyGyroJerk-std()-Z
frequency.bodybodyaccjerkmag.mean|201|tBodyAccMag-mean()
frequency.bodybodygyromag.mean|202|tBodyAccMag-std()
frequency.bodybodygyrojerkmag.mean|214|tGravityAccMag-mean()
time.bodyacc.std.x|215|tGravityAccMag-std()
time.bodyacc.std.y|227|tBodyAccJerkMag-mean()
time.bodyacc.std.z|228|tBodyAccJerkMag-std()
time.gravityacc.std.x|240|tBodyGyroMag-mean()
time.gravityacc.std.y|241|tBodyGyroMag-std()
time.gravityacc.std.z|253|tBodyGyroJerkMag-mean()
time.bodyaccjerk.std.x|254|tBodyGyroJerkMag-std()
time.bodyaccjerk.std.y|266|fBodyAcc-mean()-X
time.bodyaccjerk.std.z|267|fBodyAcc-mean()-Y
time.bodygyro.std.x|268|fBodyAcc-mean()-Z
time.bodygyro.std.y|269|fBodyAcc-std()-X
time.bodygyro.std.z|270|fBodyAcc-std()-Y
time.bodygyrojerk.std.x|271|fBodyAcc-std()-Z
time.bodygyrojerk.std.y|345|fBodyAccJerk-mean()-X
time.bodygyrojerk.std.z|346|fBodyAccJerk-mean()-Y
time.bodyaccmag.std|347|fBodyAccJerk-mean()-Z
time.gravityaccmag.std|348|fBodyAccJerk-std()-X
time.bodyaccjerkmag.std|349|fBodyAccJerk-std()-Y
time.bodygyromag.std|350|fBodyAccJerk-std()-Z
time.bodygyrojerkmag.std|424|fBodyGyro-mean()-X
frequency.bodyacc.std.x|425|fBodyGyro-mean()-Y
frequency.bodyacc.std.y|426|fBodyGyro-mean()-Z
frequency.bodyacc.std.z|427|fBodyGyro-std()-X
frequency.bodyaccjerk.std.x|428|fBodyGyro-std()-Y
frequency.bodyaccjerk.std.y|429|fBodyGyro-std()-Z
frequency.bodyaccjerk.std.z|503|fBodyAccMag-mean()
frequency.bodygyro.std.x|504|fBodyAccMag-std()
frequency.bodygyro.std.y|516|fBodyBodyAccJerkMag-mean()
frequency.bodygyro.std.z|517|fBodyBodyAccJerkMag-std()
frequency.bodyaccmag.std|529|fBodyBodyGyroMag-mean()
frequency.bodybodyaccjerkmag.std|530|fBodyBodyGyroMag-std()
frequency.bodybodygyromag.std|542|fBodyBodyGyroJerkMag-mean()
frequency.bodybodygyrojerkmag.std|543|fBodyBodyGyroJerkMag-std()

####PS: mapping table is generated by the following scripts:

```r
features <- read.table("./data/features.txt", stringsAsFactors=FALSE)
ofea <- features[grepl("mean\\(\\)", features$V2) | grepl("std\\(\\)", features$V2),]
m <- cbind(names(summarise_tidy_dataset[,-c(1,2)]), ofea)
write.table(m, file="mapping.txt", row.name=FALSE, append=FALSE, sep="|", quote=FALSE, col.name=FALSE)
```

[data_url]:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
[project_url]:https://class.coursera.org/getdata-013
[readme_url]:https://github.com/scng/getdata_PeerAssignments/blob/master/README.md
[feature_url]:https://github.com/scng/getdata_PeerAssignments/blob/master/README.md
[script_url]:https://github.com/scng/getdata_PeerAssignments/blob/master/README.md
[result_url]:https://github.com/scng/getdata_PeerAssignments/blob/master/README.md