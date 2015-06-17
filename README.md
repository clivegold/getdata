# GetData Project
This is a description of the tidy_data project for the Coursera Course Getting and Cleaning Data

## Descritpion
The file run_analysis.R reads two datasets from a directory, within the working directory called "UCI HAR Dataset"Samsung phone, and writes out two files:-
     - merge_data.txt: the merge of both datasets and
     - tidy_data.txt: the averages of the Mean and Standard Deviation Data within the merged data set.

##Running the Code.
To run this function ensure that the data is in a directory called "UCI HAR Dataset" in the current directory. If the data is somewhere else just run the function with the data path as the argument eg: run_analyis("C:/data in in here")

## What the code does.
The code has comments though out it however it goes through the following steps;
1- Merges the training and the test sets to create one data set.
2- Extracts only the measurements on the mean and standard deviation for each measurement. 
3- Uses descriptive activity names to name the activities in the data set
4- Appropriately labels the data set with descriptive variable names. 
     Writes out the merged data set.
5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
     Writes out the tidy_data.txt file with this data in it.