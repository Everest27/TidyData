# run_analysis() R function

## The run_analysis function reads in raw data collected from accelerometers and gyroscopes in Samsung Galaxy S II smartphones, performs analyses and creates a tidy data set of the summary results.  The original experiments to collect the raw data are described in the README file associated with the source data.    


* The source data and associated README file are downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* The data must be stored in the R working directory in a folder named "UCI HAR Dataset"
* run_analysis takes no arguments

### Specifically, the run_anaysis function performs the following:
1) Merges training and test sets to create one data set
2) Extracts only measurements on the mean and standard deviation for each measurement
3) Appends descriptive activity names to numbered activities in the original data sets
4) Appropriately labels the data set with descriptive variable names
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject called "tidydataset.txt"



