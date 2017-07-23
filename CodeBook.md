# Code Book

## Contents
This code book supports the project for Week 4 of the Getting and Cleaning Data homework on Coursera.  This code book will have a listing of the variables created in the <i><b>run_analysis.R</b></i> R script.   There are further details in the README.MD file in this repository. 

## Process Steps
The following process steps outline the code that takes place within the <i><b>run_analysis.R</b></i> script.  
1.  Clean up the current environment variables within R Studio
2.  Check the working directory (wd) and set the current wd to the appropriate location
3.  Create a temporary variable to store the downloaded zip.  This is used coming from a Unix background and not liking spaces in file names
4.  Check to see if the file has been downloaded already, if not then download from the web
5.  Make sure that the file exists before trying to unzip it
6.  The unzipped file will be in a new folder and so change the wd to the new folder location 
7.  Call "read.table" internal function to read the different ".txt" files and assign them to variables (see below for variable names/contents)
8.  Combine training and testing datasets each into a single merged table using the internal "rbind" function
	 a. Applies to X, Y and Subject training and testing datasets
9.  Using grep, create a new variable that only has the "mean" and "standard" data points
10. Using the "name" internal function, get the names for the data points of "mean" and "standard" and assign them to the variable created in step 9
11. Assign the name of the dataset of the merged "Activity" data to "Activity"
12. Assign the name of the dataset of the merged "Subject" data to "Subject"
13. Using the internal function "cbind", combine all three independently merged (x, y, subject) datasets into a single object
14. Assign names to the single combined object, from step 13, using pattern matcing for different strings within the datasets and replacing that name with a more descriptive name
15. Get the average(internal function "aggregate") of the combined object, of the subject and activity columns
16. Order all of the new tidy data based on the columns "Subject" and "Activity"
17. Output the new cleaned up data to a file called: "tidy_data.txt"

## Variable Names and Variable Function(s)
filename 		: variable containing the zip file name that will be downloaded
fileURL			: web location of the file to download for the test data
new_working_directory	: concatenated directory for where the test data is located, based off of the "getwd()" and the new folder name
features		: variable containing the system read "features.txt"
subject_train		: variable containing the system read "subject_train.txt"
x_train			: variable containing the system read "x_train.txt"
y_train			: variable containing the system read "y_train.txt"
subject_test		: variable containing the system read "subject_test.txt"
x_test			: variable containing the system read "x_test.txt"
y_test			: variable containing the system read "y_test.txt"
