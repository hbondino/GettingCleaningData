run_analysis<-function() {
  
  ## Getting the file if not already there

  if(!file.exists("getdata_projectfiles_UCI HAR Dataset.zip")) {
    Url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(Url,"./getdata_projectfiles_UCI HAR Dataset.zip",method="wget")
    print("the file was downloaded")
  } else {print("the file is already in the folder")}
  
  ## Unzipping
  unzip("getdata_projectfiles_UCI HAR Dataset.zip")
  
  ## Entering the folder
  setwd("./UCI HAR Dataset")
  
  ## Loading libraries
  library(dplyr)
  
  ## Loading files
  features<-read.table("features.txt")
  activity_labels<-read.table("activity_labels.txt")
  
  ## Loading train files
  setwd("./train")
  X_train<-read.table("X_train.txt")
  y_train<-read.table("y_train.txt")
  subject_train<-read.table("subject_train.txt")
  setwd("../")
  
  ## Loading test files
  setwd("./test")
  X_test<-read.table("X_test.txt")
  y_test<-read.table("y_test.txt")
  subject_test<-read.table("subject_test.txt")
  setwd("../")
  
  ## Returning to original folder
  setwd("../")
  
  ## Solving duplicated names and eliminating symbols in features.txt
  features <- do.call(paste, c(features[c("V1", "V2")], sep = ""))
  features <- gsub("-", "", features)
  features <- gsub("\\(", "", features)
  features <- gsub("\\)", "", features)
  features <- gsub("\\.", "", features)
  
  ## Merging the datasets  
  colnames(y_test)<-"activities"
  colnames(subject_test)<-"subject"
  
  colnames(y_train)<-"activities"
  colnames(subject_train)<-"subject"
  
  colnames(X_test)<-features
  X_test<-cbind(y_test,X_test)
  X_test<-cbind(subject_test,X_test)
  
  colnames(X_train)<-features
  X_train<-cbind(y_train,X_train)
  X_train<-cbind(subject_train,X_train)
  
  mergedset<-rbind(X_train,X_test)
  
  ## Converting activity column to factor according to activity_labels
  ## Uses descriptive activity names to name the activities in the data set
  
  mergedset$activities<-as.factor(mergedset$activities)
  levels(mergedset$activities)<-activity_labels$V2
  
  ## Selecting mean and standard deviation columns
  
  mergedset2 <- tbl_df(mergedset)
  mergedshort<-select(mergedset2,
                      subject,
                      activities,
                      `1tBodyAccmeanX`,
                      `2tBodyAccmeanY`,
                      `3tBodyAccmeanZ`,
                      `4tBodyAccstdX`,
                      `5tBodyAccstdY`,
                      `6tBodyAccstdZ`,
                      `41tGravityAccmeanX`,
                      `42tGravityAccmeanY`,
                      `43tGravityAccmeanZ`,
                      `44tGravityAccstdX`,
                      `45tGravityAccstdY`,
                      `46tGravityAccstdZ`,
                      `81tBodyAccJerkmeanX`,
                      `82tBodyAccJerkmeanY`,
                      `83tBodyAccJerkmeanZ`,
                      `84tBodyAccJerkstdX`,
                      `85tBodyAccJerkstdY`,
                      `86tBodyAccJerkstdZ`,
                      `121tBodyGyromeanX`,
                      `122tBodyGyromeanY`,
                      `123tBodyGyromeanZ`,
                      `124tBodyGyrostdX`,
                      `125tBodyGyrostdY`,
                      `126tBodyGyrostdZ`,
                      `161tBodyGyroJerkmeanX`,
                      `162tBodyGyroJerkmeanY`,
                      `163tBodyGyroJerkmeanZ`,
                      `164tBodyGyroJerkstdX`,
                      `165tBodyGyroJerkstdY`,
                      `166tBodyGyroJerkstdZ`,
                      `201tBodyAccMagmean`,
                      `202tBodyAccMagstd`,
                      `214tGravityAccMagmean`,
                      `215tGravityAccMagstd`,
                      `227tBodyAccJerkMagmean`,
                      `228tBodyAccJerkMagstd`,
                      `240tBodyGyroMagmean`,
                      `241tBodyGyroMagstd`,
                      `253tBodyGyroJerkMagmean`,
                      `254tBodyGyroJerkMagstd`,
                      `266fBodyAccmeanX`,
                      `267fBodyAccmeanY`,
                      `268fBodyAccmeanZ`,
                      `269fBodyAccstdX`,
                      `270fBodyAccstdY`,
                      `271fBodyAccstdZ`,
                      `345fBodyAccJerkmeanX`,
                      `346fBodyAccJerkmeanY`,
                      `347fBodyAccJerkmeanZ`,
                      `348fBodyAccJerkstdX`,
                      `349fBodyAccJerkstdY`,
                      `350fBodyAccJerkstdZ`,
                      `424fBodyGyromeanX`,
                      `425fBodyGyromeanY`,
                      `426fBodyGyromeanZ`,
                      `427fBodyGyrostdX`,
                      `428fBodyGyrostdY`,
                      `429fBodyGyrostdZ`,
                      `503fBodyAccMagmean`,
                      `504fBodyAccMagstd`,
                      `516fBodyBodyAccJerkMagmean`,
                      `517fBodyBodyAccJerkMagstd`,
                      `529fBodyBodyGyroMagmean`,
                      `530fBodyBodyGyroMagstd`,
                      `542fBodyBodyGyroJerkMagmean`,
                      `543fBodyBodyGyroJerkMagstd`)
   
  ## Appropriately labels the data set with descriptive variable names. 
  colnames(mergedshort)<-c(
                      "subject",
                      "activities",
                      "timebodyaccelerationmeanxaxis",
                      "timebodyaccelerationmeanyaxis",
                      "timebodyaccelerationmeanzaxis",
                      "timebodyaccelerationstandarddeviationxaxis",
                      "timebodyaccelerationstandarddeviationyaxis",
                      "timebodyaccelerationstandarddeviationzaxis",
                      "timegravityaccelerationmeanxaxis",
                      "timegravityaccelerationmeanyaxis",
                      "timegravityaccelerationmeanzaxis",
                      "timegravityaccelerationstandarddeviationxaxis",
                      "timegravityaccelerationstandarddeviationyaxis",
                      "timegravityaccelerationstandarddeviationzaxis",
                      "timebodyaccelerationjerksignalmeanxaxis",
                      "timebodyaccelerationjerksignalmeanyaxis",
                      "timebodyaccelerationjerksignalmeanzaxis",
                      "timebodyaccelerationjerksignalstandarddeviationxaxis",
                      "timebodyaccelerationjerksignalstandarddeviationyaxis",
                      "timebodyaccelerationjerksignalstandarddeviationzaxis",
                      "timebodygyroscopemeanxaxis",
                      "timebodygyroscopemeanyaxis",
                      "timebodygyroscopemeanzaxis",
                      "timebodygyroscopestandarddeviationxaxis",
                      "timebodygyroscopestandarddeviationyaxis",
                      "timebodygyroscopestandarddeviationzaxis",
                      "timebodygyroscopejerksignalmeanxaxis",
                      "timebodygyroscopejerksignalmeanyaxis",
                      "timebodygyroscopejerksignalmeanzaxis",
                      "timebodygyroscopejerksignalstandarddeviationxaxis",
                      "timebodygyroscopejerksignalstandarddeviationyaxis",
                      "timebodygyroscopejerksignalstandarddeviationzaxis",
                      "timebodyaccelerationeuclideannormmean",
                      "timebodyaccelerationeuclideannormstandarddeviation",
                      "timegravityaccelerationeuclideannormmean",
                      "timegravityaccelerationeuclideannormstandarddeviation",
                      "timebodyaccelerationjerksignaleuclideannormmean",
                      "timebodyaccelerationjerksignaleuclideannormstandarddeviation",
                      "timebodygyroscopeeuclideannormmean",
                      "timebodygyroscopeeuclideannormstandarddeviation",
                      "timebodygyroscopejerksignaleuclideannormmean",
                      "timebodygyroscopejerksignaleuclideannormstandarddeviation",
                      "fastfouriertransformbodyaccelerationmeanxaxis",
                      "fastfouriertransformbodyaccelerationmeanyaxis",
                      "fastfouriertransformbodyaccelerationmeanzaxis",
                      "fastfouriertransformbodyaccelerationstandarddeviationxaxis",
                      "fastfouriertransformbodyaccelerationstandarddeviationyaxis",
                      "fastfouriertransformbodyaccelerationstandarddeviationzaxis",
                      "fastfouriertransformbodyaccelerationjerksignalmeanxaxis",
                      "fastfouriertransformbodyaccelerationjerksignalmeanyaxis",
                      "fastfouriertransformbodyaccelerationjerksignalmeanzaxis",
                      "fastfouriertransformbodyaccelerationjerksignalstandarddeviationxaxis",
                      "fastfouriertransformbodyaccelerationjerksignalstandarddeviationyaxis",
                      "fastfouriertransformbodyaccelerationjerksignalstandarddeviationzaxis",
                      "fastfouriertransformbodygyroscopemeanxaxis",
                      "fastfouriertransformbodygyroscopemeanyaxis",
                      "fastfouriertransformbodygyroscopemeanzaxis",
                      "fastfouriertransformbodygyroscopestandarddeviationxaxis",
                      "fastfouriertransformbodygyroscopestandarddeviationyaxis",
                      "fastfouriertransformbodygyroscopestandarddeviationzaxis",
                      "fastfouriertransformbodyaccelerationeuclideannormmean",
                      "fastfouriertransformbodyaccelerationeuclideannormstandarddeviation",
                      "fastfouriertransformbodybodyaccelerationjerksignaleuclideannormmean",
                      "fastfouriertransformbodybodyaccelerationjerksignaleuclideannormstandarddeviation",
                      "fastfouriertransformbodybodygyroscopeeuclideannormmean",
                      "fastfouriertransformbodybodygyroscopeeuclideannormstandarddeviation",
                      "fastfouriertransformbodybodygyroscopejerksignaleuclideannormmean",
                      "fastfouriertransformbodybodygyroscopejerksignaleuclideannormstandarddeviation")
    
  
  ## From the data set, creates an independent tidy data set
  ## with the average of each variable for each activity and each subject.
  final<-group_by(mergedshort,activities)
  library(plyr)
  tidy<-ddply(final, .(subject,activities), function(x) colMeans(x[,3:68]))
                        
  ## Deleting unzipped files and folders
  unlink("UCI HAR Dataset",recursive=TRUE)
  
  ## Saving the results
  write.table(tidy,"results.txt",row.name=FALSE)
  
}
