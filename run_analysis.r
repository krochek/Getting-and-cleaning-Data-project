# This script contains little commentation as all of it appears in the README.md file within the Githup Repo.

#The following command was used to set the working directory 
#setwd("/Users/krochek/Copy/Coursera/Getting and Cleaning Data/project")

library(plyr)
library(reshape2)

read.IS <- function(directorypath,numchartocut){
      setwd(directorypath)
      #reading in all the files in test/Inertial Signals to one data frame.
      
      file_list <- list.files(full.names = T)
      temp_128v <- c(1:128)
      for (file in file_list){
            
            # if the merged dataset doesn't exist, create it
            if (!exists("dataset")){
                  dataset <- read.table(file)
                  full_name<-  substr(file,3,nchar(file[1])-(4+numchartocut))
                  temp_column_names <- paste(full_name,temp_128v, sep = " V")
                  names(dataset) <- temp_column_names
            }
            
            # if the merged dataset does exist, append to it
            else {
                  temp_dataset <-read.table(file)
                  full_name<-  substr(file,3,nchar(file[1])-(4+numchartocut))
                  temp_column_names <- paste(full_name,temp_128v, sep = " V")
                  names(temp_dataset) <- temp_column_names
                  dataset<-cbind(dataset, temp_dataset)
                  rm(temp_dataset)
            }
            
      }
      #return to the previous working directory
      setwd("..")
      setwd("..")
      setwd("..")
      return(dataset)
}


load.data <- function(){
      X_train<<- read.table("./UCI HAR Dataset/train/X_train.txt")
      y_train<<- read.table("./UCI HAR Dataset/train/y_train.txt")
      subject_train <<- read.table("./UCI HAR Dataset/train/subject_train.txt")
      X_test<<- read.table("./UCI HAR Dataset/test/X_test.txt")
      y_test<<- read.table("./UCI HAR Dataset/test/y_test.txt")
      subject_test<<- read.table("./UCI HAR Dataset/test/subject_test.txt")
      features <<- read.table("./UCI HAR Dataset/features.txt")
      activity_labels <<- read.table("./UCI HAR Dataset/activity_labels.txt")
      IS_test <<- read.IS("./UCI HAR Dataset/test/Inertial Signals",4)
      IS_train <<-  read.IS("./UCI HAR Dataset/train/Inertial Signals",5)
      
}

build.tidy <- function() {
      names(X_train) <<- features[[2]]
      names(X_test) <<- features[[2]]
      Train <<- cbind(y_train,subject_train,IS_train,X_train)
      Test <<- cbind(y_test,subject_test,IS_test,X_test)
      names(Train)[1:2] <<- c("activity_id","subject_id")
      names(Test)[1:2] <<- c("activity_id","subject_id")
      tempnames <- gsub("\\)|\\(","",names(Test))
      tempnames <- gsub(" ","",tempnames)
      tempnames <- gsub(",","",tempnames)
      tempnames <- gsub("-","",tempnames)
      tempnames <- find.dups.and.replace(tempnames)
      tempnames <- find.dups.and.replace(tempnames)
      names(Test) <<- tempnames
      names(Train) <<- names(Test)
      Complete <<- rbind(Train,Test)
      names(activity_labels) <<- c("activity_id","activity")
      Complete <<- join(activity_labels,Complete,  by = "activity_id")
} 

find.dups.and.replace <- function(names){
      tnames <- names
      dup <- duplicated(tnames)
      newnames <- ifelse(dup == T,paste(tnames,"d",sep =""),tnames)
      return(newnames)
}

build.meantidy <- function(){
      temp <- c("activity","subject_id")
      testtable <- reshape2:::melt.data.frame(Complete,id.vars = temp)
      Tidymeansd <<- ddply(testtable, c("subject_id","activity","variable"), summarise, mean = mean(value), sd = sd(value))
      
}



test <- function(){
      a <<- c(1,3,4,5,6,1234)
}

#running of the scripts
runscript <- function(){
      load.data()
      build.tidy()
      build.meantidy()
      write.table(Tidymeansd,"./Tidymeansd.txt")
}

#runscript()