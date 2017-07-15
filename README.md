# Coursera - Getting and Cleaning Data Course Project - Week 4

This is the course project for the Getting and Cleaning Data, week 4 homework.
The <i><b>run_analysis.R</b></i>, performs the following functions:

1. Removes any local variables that might be on the system 
2. Makes sure it is operating in the correct local project location
3. Creates a zip file variable.  The source/original file name has spaces in it
4. Checks to see if the file is downloaded
  4a. If it isn't on the file system then it will download it, otherwise it ignores it
5. Checks to see if the folder exists on the file system
6. Sets the working directory to the unzipped folder location
7. Creates a number of variables that all hold the data read in from the diffferent text files
8. Combines/Merges(rbind instead of cbind) the X data, the Y data and the Subject data
9. Gets the mean and standard data for the merged X data set variable
10. Sets the column name <i>Activity</i> on the Y merged data and the <i>Subject</i> name on the Subject merged data
11. Combines/Merges (cbind) all the data (X merged data, Y merged data and Subject merged data) into a single variable
12. Puts descriptive names on the columns of the combined/merged data variable
13. Creates an average of the combined data variable sets and assigns it to a tidy_data variable
14. Orders the data on the tidy_data variable by <i>Subject</i> and <i>Activity</i>
15. Writes the tidy_data variable dataset out to the file system and in a new <b>tidy_data.txt</b> file

Each functional line is commented for readability in the <i><b>run_analysis.R</b></i> file
