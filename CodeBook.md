# Analysis of Data Collected from Samsung Galaxy s II Smartphone Accelerometers and Gyroscopes

## Original Experiment and Raw Data:
The raw data for this analysis can be found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Author's description of the collection of the raw data: 

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six  
activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the  
waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a  
constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly  
partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding  
windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion  
components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to  
have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment."

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and  
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag,  
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,  
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## Current Analysis Study Design
* This analysis uses a custom R script called "run_analysis" to combine test and training data sets from the raw data.
* The data set is appended with descriptive variables for each measurement, numeric subject identifiers and activity descriptions.
* Only data that are mean or standard deviation measurements are extracted from the raw data.
* The data is stratified by activity and subject and the mean of each variable is calculated within these strata and output in a tidy data set called "tidydataset.txt"


## Instructions List:

* Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Unzip contents to folder "UCI HAR Dataset"
* Set working directory to contain "UCI HAR Dataset"
* Run version 3.4.4 of R
* Run function "run_analysis"

## Variables

The variables in the tidy data set produced ("tidydataset.txt") are shown below.  With the exception of "activityDescrip" and "subjects", these are means within the activity and subject strata.

"activityDescrip"                                             "subjects"                                                    
"timeBodyAccelerometer-mean()-X"                              "timeBodyAccelerometer-mean()-Y"                           
"timeBodyAccelerometer-mean()-Z"                              "timeBodyAccelerometer-StandardDeviation()-X"             
"timeBodyAccelerometer-StandardDeviation()-Y"                 "timeBodyAccelerometer-StandardDeviation()-Z"             
"timeGravityAccelerometer-mean()-X"                           "timeGravityAccelerometer-mean()-Y"                       
"timeGravityAccelerometer-mean()-Z"                           "timeGravityAccelerometer-StandardDeviation()-X"           
"timeGravityAccelerometer-StandardDeviation()-Y"              "timeGravityAccelerometer-StandardDeviation()-Z"         
"timeBodyAccelerometerJerk-mean()-X"                          "timeBodyAccelerometerJerk-mean()-Y"                       
"timeBodyAccelerometerJerk-mean()-Z"                          "timeBodyAccelerometerJerk-StandardDeviation()-X"        
"timeBodyAccelerometerJerk-StandardDeviation()-Y"             "timeBodyAccelerometerJerk-StandardDeviation()-Z"         
"timeBodyGyroscope-mean()-X"                                  "timeBodyGyroscope-mean()-Y"                               
"timeBodyGyroscope-mean()-Z"                                  "timeBodyGyroscope-StandardDeviation()-X"                 
"timeBodyGyroscope-StandardDeviation()-Y"                     "timeBodyGyroscope-StandardDeviation()-Z"                
"timeBodyGyroscopeJerk-mean()-X"                              "timeBodyGyroscopeJerk-mean()-Y"                          
"timeBodyGyroscopeJerk-mean()-Z"                              "timeBodyGyroscopeJerk-StandardDeviation()-X"             
"timeBodyGyroscopeJerk-StandardDeviation()-Y"                 "timeBodyGyroscopeJerk-StandardDeviation()-Z"             
"timeBodyAccelerometerMagnitude-mean()"                       "timeBodyAccelerometerMagnitude-StandardDeviation()"       
"timeGravityAccelerometerMagnitude-mean()"                    "timeGravityAccelerometerMagnitudeStandardDeviation()"      
"timeBodyAccelerometerJerkMagnitude-mean()"                   "timeBodyAccelerometerJerkMagnitude-StandardDeviation()"     
"timeBodyGyroscopeMagnitude-mean()"                           "timeBodyGyroscopeMagnitude-StandardDeviation()"          
"timeBodyGyroscopeJerkMagnitude-mean()"                       "timeBodyGyroscopeJerkMagnitude-StandardDeviation()"       
"frequencyBodyAccelerometer-mean()-X"                         "frequencyBodyAccelerometer-mean()-Y"                      
"frequencyBodyAccelerometer-mean()-Z"                         "frequencyBodyAccelerometer-StandardDeviation()-X"      
"frequencyBodyAccelerometer-StandardDeviation()-Y"            "frequencyBodyAccelerometer-StandardDeviation()-Z"        
"frequencyBodyAccelerometerJerk-mean()-X"                     "frequencyBodyAccelerometerJerk-mean()-Y"                 
"frequencyBodyAccelerometerJerk-mean()-Z"                     "frequencyBodyAccelerometerJerk-StandardDeviation()-X"    
"frequencyBodyAccelerometerJerk-StandardDeviation()-Y"        "frequencyBodyAccelerometerJerk-StandardDeviation()-Z"    
"frequencyBodyGyroscope-mean()-X"                             "frequencyBodyGyroscope-mean()-Y"                        
"frequencyBodyGyroscope-mean()-Z"                             "frequencyBodyGyroscope-StandardDeviation()-X"            
"frequencyBodyGyroscope-StandardDeviation()-Y"                "frequencyBodyGyroscope-StandardDeviation()-Z"             
"frequencyBodyAccelerometerMagnitude-mean()"                  "frequencyBodyAccelerometerMagnitude-StandardDeviati()"    
"frequencyBodyAccelerometerJerkMagnitude-mean()"              "frequencyBodyAccelerometerJerkMagnitude-StandardDeviation()"
"frequencyBodyGyroscopeMagnitude-mean()"                      "frequencyBodyGyroscopeMagnitude-StandardDeviation()"        
"frequencyBodyGyroscopeJerkMagnitude-mean()"                  "frequencyBodyGyroscopeJerkMagnitude-StandardDeviation()"

* "activityDescrip" is a textual description of the activity performed by the subject
* "subjects" is a numeric identifier of the human subject in the study

## Units
* The acceleration signals (accelerometer) are in standard gravity units 'g'
* The angular velocity vector measurements (gyroscope) are in radians/second


