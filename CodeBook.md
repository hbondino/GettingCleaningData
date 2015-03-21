This code book describes the variables, the data, and any transformations or work that was performed to clean up the data in "getdata_projectfiles_UCI HAR Dataset.zip"

## How to run it

1) Open R or rstudio.

2) Source the script:
source("run_analysis.R")

3) execute the script:
run_analysis()

4) you will find the result in the same folder, a file named results.txt

## What is in the folder

activity_labels.txt
has the codification for the 6 different actions performed.

features_info.txt
explains all the variables measured and calculated.

features.txt
lists 561 categories with the variables measured and calculated.

README.txt
explains the original experiment that produced the data.

There are also 2 FOLDERS:

test/
    subject_test.txt 2947 rows x 1 column the subjects that perform the activities
    X_test.txt       2947 rows x 561 columns the values themselves
    y_test.txt       2947 rows x 1 column the activities
    Inertial Signals/ a folder without use, see below (contains 9 files with the x/y/z measures of the gyroscope and the total and body accelerometers)
    
train/
      subject_train.txt 7352 rows x 1 column the subjects that perform the activities
      X_train.txt       7352 rows x 561 columns the values themselves
      y_train.txt       7352 rows x 1 column the activities
      Inertial Signals/ a folder without use, see below (contains 9 files with the x/y/z measures of the gyroscope and the total and body accelerometers)

There is more information about the data here:
http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names

According with the teacher assistant "we do not need the inertial folders"
https://class.coursera.org/getdata-012/forum/thread?thread_id=9#post-9
"Do we need the inertial folder"
Short answer- no. Long answer- If you work very hard you can attach this very raw data to the more processed train and test X data, but a subsequent steps calls on you to get rid of all the variables that are not to do with mean or standard deviation (worked out from the column names- the features) and you have no names for those columns so they go. Seems a lot easier just to not include them in the first place.

I added the activities and the subjects columns to the data, using the given column names,
and then I merged the test and the train data one on top of the other.

Another interesting question also addressed by the teacher assistant:
what columns are measurements on the mean and standard deviation?
Based on interpreting column names in the features is an open question as to is the the entries that include mean() and std() at the end, or does it include entries with mean in an earlier part of the name as well. There are no specific marking criteria on the number of columns. It is up to you to make a decision and explain what you did to the data. Make it easy for people to give you marks by explaining your reasoning.

So I only keep the columns that have the mean and the standard deviation for every measure and gave them a tidy name.

Finally I calculated the mean of every column by subject and activity (except those two columns, of course) and send the result to the file results.txt

- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
- The gyroscope units are rad/seg.
