## Getting and Cleaning Data Project - TidyDataset

1 - Download the dataset at:
 
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2 - Extract the zipfile into a folder on your local drive

3 - Put run_analysis.R into the folder ( e.g '.\run_analysis.R')

4 - Execute run_analysis.R:

```{r}
source('./run_analysis.R')
```

5 - The script should should create a new file with the TidyDataset into the working directory.

##Details of script:
###The script does:
1 - Merges the training and the test sets to create one data set.
2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
3 - Uses descriptive activity names to name the activities in the data set
4 - Appropriately labels the data set with descriptive activity names. 
5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
