# run_analysis.R
# Script file for the Get and Clense Data Coursera Project.

run_analysis <- function(datapath="UCI HAR Dataset") {
   
     #Part 1: Merge 'train' and 'test' datassets to create one data set which is correctly labled.

     #Get Test data and label
     x_test <- read.table(paste0(datapath, "/test/X_test.txt"))

     #Label data columns from the 'Features file'
     features <-read.table(paste0(datapath, "/features.txt"))
     colnames(x_test) <- features$V2

#Part 4a
#Giving activities their name
     
     #Get the Activity data from y-file and Activites_lables
     y_test <- read.table(paste0(datapath, "/test/y_test.txt"))
     activities <- read.table(paste0(datapath,"/activity_labels.txt"))
  
     #Add a Column with the activity name from activity_lables
     y_test<- activities[y_test$V1,2]

     #Get Subject information.
     subject <- read.table(paste0(datapath, "/test/subject_test.txt"))  
  
     #Assemble Test data
     test = cbind("test",subject, y_test, x_test)

     #Lable Columns
     names(test)[1] = "dataset"
     names(test)[2] = "subject"
     names(test)[3] = "activity"
  
     #Get training data and label.
     x_train <-read.table(paste0(datapath, "/train/X_train.txt"))
     colnames(x_train) <- features$V2
  
     y_train <-read.table(paste0(datapath, "/train/y_train.txt"))
#     y_train <- as.data.table(y_train)
  
#Part 4b
#Giving activities their name
     y_train<- activities[y_train$V1,2]
  
     #Get Subject data
     subject_train <-read.table(paste0(datapath, "/train/subject_train.txt"))
  
     #Put training data together
     train <- cbind("train", subject_train, y_train, x_train)
  
     #Label first few columns
     names(train)[1] = "dataset"
     names(train)[2] = "subject"
     names(train)[3] = "activity"

#Merge the data sets.
  merge_data <- rbind(test, train)                           

#Part 2
#Extract just the mean and standard deviation for the measurements.

     #Get a list of columns needed
     meansd_columns <- grep("mean|std", names(merge_data))
     meansd_columns <- c(1:3,meansd_columns)
     #Extract just those columns
     extract_data <- merge_data[,meansd_columns]

#Part 3
#Make the labels more readable


#Write out the tidy_data set.
     write.table(extract_data, "merge_data.txt", sep="\t")

#Part 5: Create second tidy data set.
# Containing the average of each variable for each activity and each subject

     second_tidy_data <-aggregate(extract_data[,4:length(extract_data)], by=list(activity = extract_data$activity, subject=extract_data$subject), mean)
     write.table(second_tidy_data, "tidy_data.txt", row.name=FALSE)

}