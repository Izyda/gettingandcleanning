gettingandcleanning
===================
About the program
-------------------
This is repository for getting and cleaning course of coursera.org

Program run_analisys.R is the solution for the problem from Project Assigment. 
This program works on data from research about the accelerometers from the Samsung Galaxy S smartphone. 

This program:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

You can find the solution in file end.txt. 

Step by step through run_analisys.R
------------------------------------
* First program install and load all needed packages. Such  as reshape or plyr. 
* Then program read all needed data. It is 11 files. 4 are from test, and 4 are from train. 2 are labels. and one contain the names of variables.
*Then this program add data to each other. First it connect train and test data together useing function rbind. Then it connect subjects and activity with test and training data.
*Then it add labels to activity. 
*Then it add names (from features) to all of the variables. And then add name for "subject" and "activity".
*Then it takes the mean and standard variations as a measure.
*Then it create new tidy data with the mean of mean and standard deviations for all subject and activity and all variables. 
