#Tidy Data Set 
It is a 180X68 dataset.  

## Rows & Columns:
1. Tidy data set has 68 columns. First two columns are factor variables and others are numeric. 
2. First two columns are "subject_id" & "activity". Column "subject_id" is ID for all 30 subjects for this experiments. 
Column "activity" is properly labled with 6 levels; "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", 
"LAYING". 
3. Other 66 columns are "mean" & "std" of different variables. These variables are follwing:
"tBodyAcc-XYZ",
"tGravityAcc-XYZ",
"tBodyAccJerk-XYZ",
"tBodyGyro-XYZ",
"tBodyGyroJerk-XYZ",
"tBodyAccMag",
"tGravityAccMag",
"tBodyAccJerkMag",
"tBodyGyroMag",
"tBodyGyroJerkMag",
"fBodyAcc-XYZ",
"fBodyAccJerk-XYZ",
"fBodyGyro-XYZ",
"fBodyAccMag",
"fBodyAccJerkMag",
"fBodyGyroMag",
"fBodyGyroJerkMag".
Here -XYZ represents that there are 3 different measurements in X, Y, Z directions for this variable. 
So There are 2(8*3+9)=66 numerical variables. 


##Values:
1. Each row has mean value of above mentioned 66 variables for each subject_id for each activity. 
2. For each subject(total 30) there are 6 activities that is why number of rows in this dataset is 30*6 = 180.
