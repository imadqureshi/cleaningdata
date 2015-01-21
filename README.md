# cleaningdata
Homework link for cleaning data repository
This script assumes that training is located in "/Users/iqureshi/MachineLearning/cleaningdata/project/UCI HAR Dataset/train". Since on your machine data is likely to be in a different folder, please change the working directory.

Script starts with checking the abov working directory. If it does not exist, then the script exits with a message of folder not found. It does not create the folder on its own as creating the folder will not get the data into it. If folder exists, then it sets the working directory.

It loads "reshape" package which is required by "rename" function.

Then data is read from provided files.

1. "features" vector contains all 561 features read from features.txt file.
2. We format features vector in next three steps. Code has comment which is self explanatory.
3. Then we read training and test set as well training and test labels.
4. Again code is self explanatory.
5. Then read subject.txt file in "subject".
6. Create variable "data_set". This is the varaiable which will hold the merged data for both training and test sets.
7. Set the features vector to column names.
8. change the column names for training and test sets so data can be combined using rbind. rbind throws issues if combining data frames have different column names.
9. Add two new columns to "data_set" by adding "subject" and "activity" using cbind. give appropriate names to each column.
10. Requirement two for project requires to extract only mean and standard deviation for each variable. For this purpose create "mean_std" which contains only these two features for each measurement.
11. Complete Step 3 of the project by changing activity numbers to their meaningful name (for example, change 1 to "WALKING").
12. "average_all" stores the average for each variable for each activity for each subject. This is the fifth requirement for project.
13. To make the data tidy, replace "." by "-" in column names for "average_all" variable.
14. Finally write the data set to a file called "average_all.txt" to be uploaded with the project.
