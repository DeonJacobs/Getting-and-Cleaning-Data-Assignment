##Programmer: Deon Jacobs
##Date: 2016-05-21
##Script Description: 
##1. This script transforms the UCI HAR Dataset to a tidy dataset with filtered variables on 
##  standard deviation and mean calculations for every subject and activity measurements.
##2. It further generates a second data set with the average calculations of all filtered variables
##   by activities and subjects 

                   
run_analysis <- function(){
  library(dplyr)
  
  #Set working directory to path where UCI HAR Dataset unzipped folder locally exists
  setwd("E:\\Users\\home\\Documents\\Coursera\\Data Science Specialization\\Cleaning Data")
  
  #Set path variable to access file within UCI HAR Dataset
  path <- file.path("./","UCI HAR Dataset") 
  
  #Load Activity Labels Data sets
  testActL <- read.table(file.path(path, "test" , "y_test.txt" ),header = FALSE,col.names=c("activity"))
  trainActL  <- read.table(file.path(path, "train" , "y_train.txt" ),header = FALSE,col.names=c("activity"))
  
  #Load Feature Vector Data Sets 
  testSet <- read.table(file.path(path,"test","X_test.txt"),header = FALSE)
  trainSet <-read.table(file.path(path,"train","X_train.txt"),header = FALSE)
  
  #Load Subject Data sets
  testSubject <- read.table(file.path(path,"test","subject_test.txt"),header = FALSE,col.names=c("subject"))
  trainSubject <-read.table(file.path(path,"train","subject_train.txt"),header=FALSE,col.names=c("subject"))
  
  #Load Feature Vector Description Data set
  featureDesSet <- read.table(file.path(path,"features.txt"),header=FALSE,col.names=c("id","feature"))
  
  
  #Unlist feature description set and change to lower case for tidy data and simplified searching with metacharacters
  featureDesSet <- unlist(tolower(featureDesSet$feature))
  
  
  #Rename columns of training and test sets with features descriptions
  names(testSet) <- featureDesSet
  names(trainSet) <- featureDesSet
  
  #cbind subject and activity columns to trainSet and testSet 
  testSet <- cbind(testSubject,testActL,testSet)
  trainSet <- cbind(trainSubject,trainActL,trainSet)
  
  #rbind test and train set together to form complete set
  completeSet <- rbind(testSet,trainSet)
  
  #Extract only std() and mean() measurement variables from complete data set
  #Appropriate columns including subject and activity variables with standard deviation and mean variables
  columnSelect <- c("subject","activity",featureDesSet[c(grep(pattern="-std()",featureDesSet),grep(pattern="-mean()",featureDesSet))])
  filteredSet <- completeSet[columnSelect]
  
  #Assign appropriate activity names to activity columns replacing numeric values
  #convert acivity column type to character
  filteredSet$activity <- as.character(filteredSet$activity)
  #Rename activity values to appropriate description
  filteredSet$activity[filteredSet$activity=="1"] <- "WALKING"
  filteredSet$activity[filteredSet$activity=="2"] <- "WALKING_UPSTAIRS"
  filteredSet$activity[filteredSet$activity=="3"] <- "WALKING_DOWNSTAIRS"
  filteredSet$activity[filteredSet$activity=="4"] <- "SITTING"
  filteredSet$activity[filteredSet$activity=="5"] <- "STANDING"
  filteredSet$activity[filteredSet$activity=="6"] <- "LAYING"
  
  
  #Tidy filteredSet columns to have no special characters, and repeat text such as "bodybody"
  names(filteredSet) <- gsub(pattern="\\(\\)",replacement="",x=names(filteredSet))
  names(filteredSet) <- gsub(pattern="-",replacement="",x=names(filteredSet))
  names(filteredSet) <- gsub(pattern="bodybody",replacement="body",x=names(filteredSet))
  
  
  #Generate second data set with average of each variable for each activity and each subject
  aveTidyDataSet <- arrange(filteredSet,subject,activity) %>% 
                    group_by(activity,subject) %>% 
                    summarise_each(funs(mean))
  
  aveTidyDataSet
}
  
  