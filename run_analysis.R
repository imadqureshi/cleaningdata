#working directory. Please set according to your environment
wd <- "/Users/iqureshi/MachineLearning/cleaningdata/project/UCI HAR Dataset/train"
#set the working directory according to your environment.
if ( ! file.exists(wd) ){
  stop (wd, " does not exist. Good bye.")
}else{
    setwd(wd)
}
library("reshape")
#Read the training sets and test sets and then joint he the data using rbind later
features <- read.table("../features.txt", stringsAsFactors=FALSE)
#get rid of first column of this dataset which is just row numbers.
#if we don't add stringsAsFactors=FALSE, then features vector will have factors and we don't want that.
features <- data.frame(features[, 2], stringsAsFactors=FALSE)
features <- rename(features, c("features...2." = "col1"))
#convert feature vectors rows to columns
features <- t(features)
#This step is required so first row can be converted to column names
features <- unname(features)

training_set<-read.table("X_train.txt", stringsAsFactors=FALSE)
training_label<-read.table("y_train.txt", stringsAsFactors=FALSE)
test_set<-read.table("../test/X_test.txt", stringsAsFactors=FALSE)
test_label<-read.table("../test/y_test.txt", stringsAsFactors=FALSE)
subject_train <- read.table("subject_train.txt", stringsAsFactors=FALSE)
subject_test <- read.table("../test/subject_test.txt", stringsAsFactors=FALSE)
y_train <- read.table("y_train.txt", stringsAsFactors=FALSE)
y_test <- read.table("../test/y_test.txt", stringsAsFactors=FALSE)
#start merging all data in one data set
#first bring feature vector which will form the column names for all data
data_set <- features
#following step converts data_set from data frame to simple structure. 
colnames(data_set) <- data_set[1, ]
data_set <- data.frame(data_set, stringsAsFactors = FALSE)

#remove the row as we already made that column names
data_set <- data_set[0, ]
#make sure all datasets have same columns
colnames(training_set) <- colnames(data_set)
colnames(test_set) <- colnames(data_set)

data_set <- rbind(data_set, training_set, test_set)
#Add subject. Order of rbind below matters otherwise data will become dirty.
data_set <- cbind(data_set, rbind(subject_train, subject_test))
#change column name for the new column
colnames(data_set)[562] <- "subject"
data_set <- cbind(data_set, rbind(y_train, y_test))
colnames(data_set)[563] <- "activity"
#Above completes step 1 of the homework.

#now extract measurements on mean and standard deviations for all metrics.
#putting the result in a different variable because step 3 requires working
#on other columns also.
mean_std <-data_set[, grep('^.*mean().*|^.*std().*', colnames(data_set))]

#This is step 3 of homework.
data_set$activity[data_set$activity==1] <- "WALKING"
data_set$activity[data_set$activity==2] <- "WALKING_UPSTAIRS"
data_set$activity[data_set$activity==3] <- "WALKING_DOWNSTAIRS"
data_set$activity[data_set$activity==4] <- "SITTING"
data_set$activity[data_set$activity==5] <- "STANDING"
data_set$activity[data_set$activity==6] <- "LAYING"

#step 4 makes sure that all variable names are appropriately labeled.

#Following is step 5 of homework.
#aggregate function calculates mean on the dataset and groups by last two columns which
#are subject and activity.
average_all <- aggregate(data_set[, 1:561], data_set[, 562:563], FUN=mean)
#cleanup column names by replacig "." with "-" so it looks cleaner
colnames(average_all) <- gsub("[\\.]+", "-" , colnames(average_all))
colnames(average_all) <- gsub("-$", "" , colnames(average_all))
write.table(average_all, "average_all.txt", row.name=FALSE)