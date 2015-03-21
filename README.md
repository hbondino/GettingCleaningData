This file explains how the script in run_analysis.R works.

## Getting the file if not already there
Validates that the file getdata_projectfiles_UCI HAR Dataset.zip
is in the folder, otherwise it downloads the file from the web.

## Unzipping
Unzips the file.

## Entering the folder
Enters to the unzipped folder

## Loading libraries
Loads dplyr

## Loading files
Loads the column titles features.txt and the activities codification activity_labels.txt

## Loading train files
Enters to a subfolder and loads the train files
the values themselves X_train.txt
the activities y_train.txt
and the subjects subject_train.txt

## Loading test files
Moves to other subfolder and loads the test files
the values themselves X_test.txt
the activities y_test.txt
and the subjects subject_test.txt

## Returning to the original folder
Returns to the folder it started

## Solving duplicated names and eliminating symbols in features.txt
The column names have some problems,
duplicated names, it makes them unique,
characters that R do not like, it deletes them.

## Merging the datasets
Merge all the datasets in a sense way.
Adds the activities and the subjects columns to the data, using the given column names
and merges test and train data one on top of the other.

## Converting activity column to factor according to activity_labels
## Uses descriptive activity names to name the activities in the data set
Converts the activities column in a factor column, setting the levels with the right activities names.

## Selecting mean and standard deviation columns
Keeps only the columns that have the mean and the standard deviation for every measure.

## Appropriately labels the data set with descriptive variable names. 
It changes the column names for others without abbreviations or capital letters.

## From the data set, creates an independent tidy data set with the average of each variable for each activity and each subject.
It groups the new table by activities,
loads a new library plyr
and makes a nice and tidy dataset.

## Deleting unzipped files and folders
Makes tidy the original folder deleting the unzipped files.

## Saving the results
Saves the results (row.name=FALSE) in the same folder, in the file "results.txt"
