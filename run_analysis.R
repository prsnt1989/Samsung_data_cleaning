library(dplyr)

#url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(url,destfile="dataset.zip",method="curl")
#unzip("dataset.zip",exdir = "./")

###One can uncomment above 3 lines in order to download the samsung dataset. Since here we assume that dataset is in the main directory 
###thus I will directly go to that dataset directory.

setwd("./UCI HAR Dataset")

### Read the column name for main dataset.
cn <- read.table("features.txt",sep="",col.names=c("id","names"))

### Read X,Y & subject dataset for train
x_train <- read.table("train/X_train.txt", sep="",col.names=cn$names)
y_train <- read.table("train/Y_train.txt", sep="",col.names="activity")
subject_train <- read.table("train/subject_train.txt", sep="", col.names="subject_id")

### Read X,Y & subject dataset for test
x_test <- read.table("test/X_test.txt", sep="",col.names=cn$names)
y_test <- read.table("test/Y_test.txt", sep="",col.names="activity")
subject_test <- read.table("test/subject_test.txt", sep="", col.names="subject_id")

### Merge X, Y & subject datasets rowwise using rbind.
x_tt <- rbind(x_test,x_train)
y_tt <- rbind(y_test,y_train)
subject_id <- rbind(subject_test,subject_train)

### Column names for X dataset are not valid for a lot of operations so change them so that you can use them in future.
valid_cn <- make.names(names=names(x_tt), unique=TRUE, allow_ = TRUE)
names(x_tt) <- valid_cn

### Select "mean" & "std" columns. 
x_tt_sub <- select(x_tt,matches("mean|std"),-matches("angle|meanFreq"))

### Mutate factor columns "activity" & "subject_id"
x_tt_subset <- mutate(x_tt_sub, activity = factor(y_tt$activity,labels=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING") ), subjectid = factor(subject_id$subject_id))

### Group the above dataset according to subject_id and activity.
xtt_gr_id_ac <- group_by(x_tt_subset, subjectid, activity)

### Summarise dataset for each column mean using summarise_each function.
summ <- summarise_each(xtt_gr_id_ac, funs(mean))

### Write the dataset into a file. 
write.table(summ,file="tidy_data.txt",row.name=F)
