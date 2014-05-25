library(reshape2)
setwd("~/Documents/Coursera/Data Science/code/GettingAndCleaningData")

# Reading in test data
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

# Reading in training data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

# Reading in labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Reading in subject data and merge
subject_test        <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train 	<- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_all 	<- rbind(subject_test, subject_train)

# Reading in & assigning names
features <- read.table("UCI HAR Dataset/features.txt")
headers  <- features[,2]
names(X_test)  <- headers
names(X_train) <- headers

# Getting mean and st-d headers
mean_std         <- grepl("mean\\(\\)|std\\(\\)", headers)
X_test_mean_std  <- X_test[,mean_std]
X_train_mean_std <- X_train[,mean_std]


# Merging all test and training data rows
X_all <- rbind(X_test_mean_std, X_train_mean_std)
y_all <- rbind(y_test, y_train)


# Combine all data
merged <- cbind(subject_all, y_all, X_all)
names(merged)[1] <- "SubjectID"
names(merged)[2] <- "Activity"

# Agg the data & assign labels
final_data <- aggregate(. ~ SubjectID + Activity, data=merged, FUN = mean)
final_data$Activity <- factor(final_data$Activity, labels=activity_labels[,2])

write.table(final_data, file="./TidyDataset.txt", sep="\t", row.names=FALSE)