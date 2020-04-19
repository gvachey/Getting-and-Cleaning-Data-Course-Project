# loading dplyr 
library(dplyr)

# Setting working directory
setwd("/Users/gabrielvachey/DATA")

### Getting data ###
# loading each txt file into variable
# test dataset
test.x <- read.table(file = file.path("UCI HAR Dataset","test","X_test.txt"))
test.y <- read.table(file = file.path("UCI HAR Dataset","test","y_test.txt"))
test.subject <- read.table(file = file.path("UCI HAR Dataset","test","subject_test.txt"))
# training dataset
train.x <- read.table(file = file.path("UCI HAR Dataset","train","X_train.txt"))
train.y <- read.table(file = file.path("UCI HAR Dataset","train","y_train.txt"))
train.subject <- read.table(file = file.path("UCI HAR Dataset","train","subject_train.txt"))
#features
features <- read.table(file = file.path("UCI HAR Dataset","features.txt"))
# activities
activities <- read.table(file=file.path("UCI HAR Dataset","activity_labels.txt"),col.names=(c("activity_num","activity_names")))
  
### Setting the right variable type for order ###
test.y[,1] <- as.numeric(test.y[,1])
train.y[,1] <- as.numeric(train.y[,1])
test.subject[,1] <- as.numeric(test.subject[,1])
train.subject[,1] <- as.numeric(train.subject[,1])


######################################################################
### 1 Merges the training and the test sets to create one data set ###

### Combine data within dataset ###
data.test <- cbind(test.subject,test.y,test.x)
data.train <- cbind(train.subject,train.y,train.x)

### Combine dataset ###
data.merged <- rbind(data.test,data.train)

#################################################################################################
### 2 Extracts only the measurements on the mean and standard deviation for each measurement. ###
### 3 Uses descriptive activity names to name the activities in the data set ###
### 4 Appropriately labels the data set with descriptive variable names. ###

### name columns ###
colnames(data.merged) <- as.factor(c("subject","activity_num",as.character(features[,2])))

### add name of activities ###
data.merged <- merge(activities, data.merged,by="activity_num")

### Select only features with mean or sd ###
mean_col <-grep("mean",colnames(data.merged))
sd_col <-grep("std",colnames(data.merged))
keep_col <- c(mean_col,sd_col)
keep_col <- c(3,1,2,sort(keep_col))
data_merged.filtered <- data.merged[,keep_col]

### transfering table to dplyr
df <- tbl_df(data_merged.filtered)
df <- arrange(df,subject, activity_num)

####### Tidy Dataset #######
tidy_dataset <- df
View(tidy_dataset)
############################



########################################################################################################################################################
### 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. ###

### Create summary of dataset by subject and activity ###
df_summary <- df %>% group_by(subject,activity_names) %>% summarise_all(funs(mean))
df_summary <- arrange(df_summary,subject, activity_num)

####### Summary Dataset #######
summary_dataset <- df_summary
write.table(summary_dataset,"summary_dataset.txt",row.name=FALSE)
############################