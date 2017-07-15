  ## Clean up local variables in the system first  
  rm(list = ls())
  
  ## Make sure you are in the correct working directory
  if (!(getwd() == "~/projects/coursera_r_class"))  {
    setwd("~/projects/coursera_r_class/")
  }
  
  ##  Create the temporary file name to extract later
  ##  This is only because they file being downloaded has spaces in the file name (working on a Mac)
  filename <- "homeworkDataset.zip"
  
  ## Download the file from the internet
  if (!file.exists(filename)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, filename, method="curl")
  }  
  
  ## Check to see if the file exists and if it does then unzip it
  if (!file.exists("UCI HAR Dataset")) { 
    unzip(filename) 
  }
  
  ## Change to the new directory that has the data in extracted folder
  new_working_directory <- paste(getwd(), "UCI HAR Dataset", sep = "/")
  setwd(new_working_directory)
  
  ## Read the table datasets
  ## There are no headers on the txt files so make sure to use the headers=False
  features <- read.table("./features.txt", header = FALSE)
  ## Train folder
  subject_train <- read.table("./train/subject_train.txt", header = FALSE)
  x_train <- read.table("./train/x_train.txt", header = FALSE)
  y_train <- read.table("./train/y_train.txt", header = FALSE)
  ## Test folder
  subject_test <- read.table("./test/subject_test.txt", header = FALSE)
  x_test <- read.table("./test/x_test.txt", header = FALSE)
  y_test <- read.table("./test/y_test.txt", header = FALSE)
  ## Activity Labels variable read so we don't have to do multiple reads later
  activity_labels <- read.table("./activity_labels.txt")
  
  ## Combine the X training and test data into a single dataset
  x_data_merged <- rbind(x_train, x_test)
  
  ## Combine the Y training and test data into a single dataset
  y_data_merged <- rbind(y_train, y_test)
  
  ## Combine the subject training and test data into a single dataset
  subject_data_merged <- rbind(subject_train, subject_test)

  ## Get only the mean and standard deviations from the data sets (sorry GREP is not a skill i know well)
  x_data <- x_data_merged[, grep("-(mean|std)", features[, 2])]
  names(x_data) <- features[grep("-(mean|std)", features[, 2]), 2] 
  
  ## Give column name details for the merged Y Data iteration
  y_data_merged[, 1] <- activity_labels[y_data_merged[, 1], 2]
  names(y_data_merged) <- "Activity"
  
  ## Give column name for the merged Subject Data
  names(subject_data_merged) <- "Subject"
  
  ## Combine all the data into a single data set
  combined_data <- cbind(x_data, y_data_merged, subject_data_merged)
  
  ## Create new descriptive names for the data points
  names(combined_data) <- make.names(names(combined_data))
  names(combined_data) <- gsub("Acc", "Acceleration", names(combined_data))
  names(combined_data) <- gsub('GyroJerk',"Gyro Jerk",names(combined_data))
  names(combined_data) <- gsub('Gyro',"Gyro",names(combined_data))
  names(combined_data) <- gsub('Mag',"Magnitude",names(combined_data))
  names(combined_data) <- gsub('mean',"Mean",names(combined_data))
  names(combined_data) <- gsub('std',"Standard Deviation",names(combined_data))
  
  ## Average(aggregate function) the data and put it in a tidy data variable
  tidy_data <- aggregate(. ~Subject + Activity, combined_data, mean)
  
  ## Order the tidy data variable by the subject and activity
  tidy_data <- tidy_data[order(tidy_data$Subject,tidy_data$Activity),]
  
  ## Write the tidy data variable out to the file system, one level up (outside of the UCI Data folder)
  table_write_output <- write.table(tidy_data, file = "../tidy_data.txt",row.name=FALSE)
  