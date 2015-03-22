The codebook describes the variables, the data, and any transformations or work that performed to clean up the data

variables:
          1,dat: combine training data and testing data
          2,lab: combine training labels and testing labels
          3,sub: combine training subject and testing subject
          
          4,dataset: combine all the data in to a dataframe, which has 563 columns of subjects, activity, features. And more                        than 10000 rows in timecourse.
          5,subdataset: This is a subset of dataset created in step 2, which extracts only the measurements on the mean and                           standard deviation for each measurement.
          6,group_data: which is created in step 5.
          7,data2: tidy data in step 5!
          
transformations:
          1,merge the training data and testing data to create one data set
          2,add subject information and activity information into the new data set, and change the corrsponding column names
          3,Extracts only the measurements on the mean and standard deviation for each measurement.
          4, Uses descriptive activity names to name the activities in the data set
          5, Appropriately labels the data set with descriptive variable names. 
          6,creates a second, independent tidy data set

