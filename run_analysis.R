## 1.Merges the training and the test sets to create one data set.

##Read training dataset
X_train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt",header=FALSE) 
y_train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt",header=FALSE)
subject_train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt",header=FALSE)

##Read test dataset
X_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt",header=FALSE) 
y_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt",header=FALSE)
subject_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt",header=FALSE)

##Read feature vector
features<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt",header=FALSE) 

##Set the column names of datasets
colnames(X_train)<-features$V2
colnames(y_train)<-"label"
colnames(subject_train)<-"subject"
colnames(X_test)<-features$V2
colnames(y_test)<-"label"
colnames(subject_test)<-"subject"

##Combine train and test datasets with subject datasets
train<-cbind(subject_train,y_train,X_train)
test<-cbind(subject_test,y_test,X_test)

##row combine training and test dataset
complete<-rbind(train, test)

complete <- rbind(cbind(subject_train,y_train,X_train),cbind(subject_test,y_test,X_test)) 


## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
meanstd<-features[grep("mean\\(\\)|std\\(\\)", features$V2),]
completeMeanStd<-complete[,c(1, 2, meanstd$V1+2)]

## 3.Uses descriptive activity names to name the activities in the data set
activitylabels<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", header=FALSE) 
newlabels<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
complete$label<-factor(complete$label,levels=c(1,2,3,4,5,6),labels=newlabels)

## 4.Appropriately labels the data set with descriptive variable names.
NewColNames<-colnames(completeMeanStd)
NewColNames<-gsub("[Aa]cc","Accelerometer",NewColNames)
NewColNames<-gsub("[Gg]yro","Gyroscope",NewColNames)
NewColNames<-gsub("[Ff]req","Frequency",NewColNames)
NewColNames<-gsub("[Mm]ag","Magnitude",NewColNames)
NewColNames<-gsub("tBody","timeBody",NewColNames)
NewColNames<-gsub("tGravity","timeGravity",NewColNames)
NewColNames<-gsub("fBody","fastFourierTransformBody",NewColNames)
NewColNames<-tolower(NewColNames)
colnames(completeMeanStd)<-NewColNames

## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
final <- aggregate(completeMeanStd[, 3:ncol(completeMeanStd)],by=list(subject = completeMeanStd$subject,label = completeMeanStd$label),mean) 
write.table(final, file="tidy_data.txt", row.names=FALSE, col.names=TRUE)