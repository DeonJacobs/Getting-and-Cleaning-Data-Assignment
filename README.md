Getting-and-Cleaning-Data-Assignment
====================================

The run_analysis.r file associated with this git repository performs script functions
to filter and transform the Human Activity Recognition Using Smartphones Data Set described here:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Sequential Description of the required scripts

###1. Download of the .zip File and Path
The script assumes the zip file was already downloaded, unzipped and stored at the following path:

    #Set working directory to path where UCI HAR Dataset unzipped folder locally exists
		setwd("E:\\Users\\home\\Documents\\Coursera\\Data Science Specialization\\Cleaning Data")
  
    #Set path variable to access file within UCI HAR Dataset
		path <- file.path("./","UCI HAR Dataset")
	
###2.  Loads various data frames with required dataset files

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
		
###3. Merges the training and test data sets into on data set

	#Rename columns of training and test sets with features descriptions
		names(testSet) <- featureDesSet  
		names(trainSet) <- featureDesSet  
  
    #cbind subject and activity columns to trainSet and testSet 
		testSet <- cbind(testSubject,testActL,testSet)  
		trainSet <- cbind(trainSubject,trainActL,trainSet)  
  
	#rbind test and train set together to form complete set
		completeSet <- rbind(testSet,trainSet)  
		
###4. Filters out only Standard Deviation and Mean Calculation variables

	#Appropriate columns including subject and activity variables with standard deviation and mean variables
		columnSelect <- c("subject","activity",featureDesSet[c(grep(pattern="-std()",featureDesSet),grep(pattern="-mean()",featureDesSet))])  
		filteredSet <- completeSet[columnSelect]  
		
###5. Assign appropriate values for activity variable

	#convert acivity column type to character  
		filteredSet$activity <- as.character(filteredSet$activity)  
	#Rename activity values to appropriate description
		filteredSet$activity[filteredSet$activity=="1"] <- "WALKING"  
		filteredSet$activity[filteredSet$activity=="2"] <- "WALKING_UPSTAIRS"  
		filteredSet$activity[filteredSet$activity=="3"] <- "WALKING_DOWNSTAIRS"  
		filteredSet$activity[filteredSet$activity=="4"] <- "SITTING"  
		filteredSet$activity[filteredSet$activity=="5"] <- "STANDING"  
		filteredSet$activity[filteredSet$activity=="6"] <- "LAYING"  
		
		
###6. Tidy data set variable descriptions 

	#Tidy filteredSet columns to have no special characters, and repeat text such as "bodybody"
		names(filteredSet) <- gsub(pattern="\\(\\)",replacement="",x=names(filteredSet))  
		names(filteredSet) <- gsub(pattern="-",replacement="",x=names(filteredSet))  
		names(filteredSet) <- gsub(pattern="bodybody",replacement="body",x=names(filteredSet))  
		
###7. Generate second data set with average of activity and subject across all variables

		aveTidyDataSet <- arrange(filteredSet,subject,activity) %>% 
        group_by(activity,subject) %>% 
        summarise_each(funs(mean))

###8. Write averaged tidy data to .txt file
		
		write.table(aveTidyDataSet, "AvgTidyData.txt", row.name=FALSE)
