library(dplyr)

##read data to R
train_dat <- read.table("X_train.txt")
train_lab <- read.table("y_train.txt")
test_dat <- read.table("X_test.txt")
test_lab <- read.table("y_test.txt")

##read the features
feature <- read.table("features.txt")

##read the subject 
train_subject <- read.table("subject_train.txt")
test_subject <- read.table("subject_test.txt")

##################################################################################
##Quiz 1: 1.Merges the training and the test sets to create one data set
##where labels(activities) is at the head of the dataset
dat <- rbind(train_dat,test_dat)
lab <- rbind(train_lab,test_lab)
sub <- rbind(train_subject,test_subject)
dataset <- cbind(sub,lab,dat)
#add column names to dataset
colnames(dataset) <- c("subject","activity",as.character(feature$V2))

####################################################################################
##Quiz 2: 2.Extracts only the measurements on the mean and standard deviation for each measurement.
valid_column_names <- make.names(names=names(dataset), unique=TRUE, allow_ = TRUE)
names(dataset) <- valid_column_names
subdataset <- select(dataset,contains("subject"),contains("activity"),contains("mean"),contains("std"))
#remove meanFreq,because meanFreq isn't belong to mean.
subdataset <- select(subdataset,-contains("meanFreq"))

###################################################################################
##Quiz 3: Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("activity_labels.txt")
subdataset$activity <- as.factor(subdataset$activity)
levels(subdataset$activity) <- activity_labels$V2

###################################################################################
##Quiz 4: Appropriately labels the data set with descriptive variable names. 
#I think I have done Quiz4 in Quiz1 with the code: "colnames(dataset) <- c("activity",as.character(feature$V2))"

######################################################################################
##Quiz 5: From the data set in step 4, creates a second, independent tidy data set with the average of each 
##        variable for each activity and each subject
group_data <- group_by(subdataset,subject,activity)
data2 <- group_data %>% summarise_each(funs(mean))

##output a tidy data as a text file
write.table(data2,file="tidy_data.txt", row.name=FALSE )
