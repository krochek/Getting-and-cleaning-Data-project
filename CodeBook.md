CodeBook for the Human Activity Recognition Using Smartphones Data Set 
=================================

##Study design
**Data Set Information:**

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 


**Attribute Information:**

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Code Book of the "Complete" data frame 
The "Complete" data frame is created by running the run_script.R in this repository.

comment: there are no missing values in this dataset. (the files are all complete)
The data frame consists of 10299 observations of 1716 variables.

column 1: "activity_id" - this is and integer betweend 1 and 6 reperesenting the activity.
column 2: "activity" - a string of the actual activity.
column 3: "subject_id" -  this is an integer between 1 and 30 representing the id of the subject that the measurments were taken from. 
columns 4 - 1155:  These columns represent the 9 times 128vectors of the Inertial Signals directory: body accelaration x, body accelaration y, body accelration z, body gyro x, body gyro y, body gyro z, totatl accelaration x, total accelaration y, total accelaration z. each of these categories consists out of 128 vecotrs (each with a column)
columns 1556 - 1716: These columns represent the 561 vecotrs that appear in the features.txt file in the main directory. 

## Code book of the "Tidymeansd"" data frame:
This data frame has 308520 observations with 5 columns:
column 1: "subject_id" - this is an integer between 1 and 30 representing the id of the subject that the measurments were taken from. 
column 2: "activity" - a string representing the type of activity the subject was doing while the measurments were taken.
column 3: "variable" - this represents the name of the variables represented in the Code Book for the previous data set ("Complete") 
column 4: "mean" - represnting the average of the measurments that appear in the "Complete" data frame that correspond to the values in columns 1-3 in the "Tidymeansd" data frame.
column 5: "sd" - represnting the standard deviation of the measurments that appear in the "Complete" data frame that correspond to the values in columns 1-3 in the "Tidymeansd" data frame.






