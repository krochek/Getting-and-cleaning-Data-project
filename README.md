Getting-and-cleaning-Data-project
=================================
This readme descibes how the run_script.R works and what are the different functions in it and when they are used.

# The 4 main functions are:

## load.data() <- function() 
- loads the data directly into the Global Environment (using <<- instead of <-):
This function reads all the data within all the directories of the UCI HAR Dataset.
Most of the files are read in a straight forward way with read.table except for the files within 
the test/train InertialSignal files (9 files times 2 -  for train and test) - this is being done using the
read.IS function that I wrote.

## read.IS <- function(directorypath,numchartocut):
This function recieves a directory path in whicn it automatically reads all the files within the directory while using the name of the files as column names in combination with V1-V128 depending on the vector withing each file. the numchartocut is an integer given to the function by which it cuts the file name appropriately - This is done so when we bind the train and test data.sets they will have the same names.

## build.tidy() <- function() - 
builds the tidy dataset named "Complete" (data.frame):
This function takes all the data.frames that were loaded previously in load.data() and creates one complete data.frame. Everything is relatively straight forward (assigning the colnames to datasets using the features while the names of the Internal Signals columns were assigned in read.IS). After all the columns are named the Test and Train data frames are created through cbind. (following some name changes to the id columns and name cleaning over all to exclude spaces and brackets and "-")
As you might have noticed, some of the feature names in the 561 feature vector are duplicates (84 of them) though they contain different data. In order to replace the duplicate names with other names, I've created the function:

**find.dups.and.replace <- function(names):**
This function recieves a list of names and checks for duplicates. If duplicates are found, it will replace them with the same name added with a **"d"**. Notice that the function only does this once but if there are 3 same duplicates (hint: there is...) the function needs to be called again (like in build.tidy()) and thus the 3rd duplicate will appear as "name"+"dd"  (this could have been done in one function of course but I was lazy:)

**build.tidy() continued**
Now the function continues to reassign the names to both the Train and the Test data frames' columns and rbinds them together to create the "Complete" data.frame.

##build.meantidy() -
This function builds the final data frame that contains the independent tidy data set with the average of each variable for each activity and each subject that is asked for in the project.
This is achieved through the functions merge (from resahpe2) followed by the ddply function to create the final
** Tidymeansd** data frame.
all is left to do is the write.table the mentioned data frame to the Tidymeansd.txt file.

padea padea padea... That's all folks ;)



