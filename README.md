# Samsung_data_cleaning
## Reading each data set:
1. Read features.txt file in main folder to get column names of main data sets X_train.txt & X_test.txt .
2. Reading each data set in train & test directories. 
3. Assign appropriate column names for each data set.

## Merging data sets:
1. Merge X, Y and subject_id datasets using rbind for test and train. 
2. Since the column names for X datasets are not proper, change them into valid names in order to use them for future use.


## Selecting specific columns:
1. use select and match function to select columns with "mean" and "std". In order to skip "meanFreq" and "angle", which also have "mean" & "std" in their column name, I skipped them using -match. 
2. Use mutate function to add columns for activity and subject_id as factors. 


## Grouping:
1. Use group_by function to group the data with subject_id and activity. 


##Summarizing:
1. Use summarise_each function to summarise the dataset with mean of each variable for each subject for each activity. 


##Writing dataset to a file
1. Use write.table function to write the dataset to a file.
