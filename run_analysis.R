run_analysis<-function(){
#Read in test set data
        testSet<-read.table("./UCI HAR Dataset/test/X_test.txt")
#Read in subject identifiers for the test set
        testSubjects<-read.table("./UCI HAR Dataset/test/subject_test.txt")
#Read in numeric activity labels for the test set
        testLabels<-read.table("./UCI HAR Dataset/test/y_test.txt")
#Read in training set data
        trainSet<-read.table("./UCI HAR Dataset/train/X_train.txt")
#Read in subject identifiers for the training set
        trainSubjects<-read.table("./UCI HAR Dataset/train/subject_train.txt")
#Read in numeric activity labels for the training set
        trainLabels<-read.table("./UCI HAR Dataset/train/y_train.txt")
#Merge test and training sets
        combine<-rbind(testSet,trainSet)
#Create a character vector with descriptive variable names and assign to data set column names
        varNames<-read.table("./UCI HAR Dataset/features.txt")
        varNames<-varNames$V2
        names(combine)<-varNames
#Subset the data frame with variables containing mean and standard deviation measurements
        combine<-combine[,grepl("mean\\(\\)|std\\(\\)",names(combine))]
#Combine test and training labels and name the column
        allLabels<-rbind(testLabels,trainLabels)
        names(allLabels)<-"activityLabel"
#Append activity labels to the data set
        combine<-cbind(allLabels,combine)
#Combine test and training subject identifiers and name the column
        allSubjects<-rbind(testSubjects,trainSubjects)
        names(allSubjects)<-"subjects"
#Append subject identifiers to the data set
        combine<-cbind(allSubjects,combine)
#Read in descriptive activity names and name the column
        activitynames<-read.table("./UCI HAR Dataset/activity_labels.txt")
        names(activitynames)[2]<-"activityDescrip"
#Join the main data set and the acitivity names data set to append main data set with descriptive labels
        combine<-merge(combine,activitynames,by.x="activityLabel",by.y="V1",all=T)
#Reorder columns for ease of viewing
        DataFrame<-combine[,c(1,69,2:68)]
#Replace variable abbreviations with descriptive names
        names(DataFrame)<-gsub("^t","time",names(DataFrame))
        names(DataFrame)<-gsub("^f","frequency",names(DataFrame))
        names(DataFrame)<-gsub("Acc","Accelerometer",names(DataFrame))
        names(DataFrame)<-gsub("Gyro","Gyroscope",names(DataFrame))
        names(DataFrame)<-gsub("Mag","Magnitude",names(DataFrame))
        names(DataFrame)<-gsub("BodyBody","Body",names(DataFrame))
        names(DataFrame)<-gsub("std","StandardDeviation",names(DataFrame))
#Load dplyr package and use to: remove numberic activity lables, group the data set 
#by activity descriptions and subjects, and calculate the mean for all variables in these strata
        library(dplyr)
        cleanset<-select(DataFrame, -activityLabel)
        grouping<-group_by(cleanset, activityDescrip, subjects)
        summary<-summarize_all(grouping, mean)
#Create text file of data set
        write.table(summary, "tidydataset.txt",row.names = FALSE)
}