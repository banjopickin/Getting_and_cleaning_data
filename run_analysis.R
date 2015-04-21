library(data.table)
library(dplyr)
library(tidyr)

#read data tables
train<-read.table("train/X_train.txt")
test<-read.table("test/X_test.txt")
subject_train<-read.table("train/subject_train.txt")
subject_test<-read.table("test/subject_test.txt")
y_train<-read.table("train/y_train.txt")
y_test<-read.table("test/y_test.txt")

#merge train and test into a dataframe called feature
feature<-bind_rows(train,test)

#name feature columns
featurenames<-tbl_df(read.table("features.txt"))
colnames(feature)<-featurenames$V2

#merge subject_train and subject_test into a dataframe called subject
subject<-bind_rows(subject_train,subject_test)

#merge y_train and y_test into a dataframe called activity
activity<-bind_rows(y_train,y_test)

#merge feature, subject and activity into a dataframe called data
data<-bind_cols(subject, activity, feature)
colnames(data)<-c("Subject","Activity",as.character(featurenames$V2))

#Extracts only the measurements on the mean and standard deviation for each measurement. 
selected<-c(1,2,grep("mean\\(\\)|std\\(\\)",names(data)))
data<-data[,selected]

#Uses descriptive activity names to name the activities in the data set
activity_labels<-read.table("activity_labels.txt")
data$Activity<-as.character(factor(data$Activity,levels=1:6,labels=activity_labels$V2))

#Appropriately labels the data set with descriptive variable names. 
names(data)<-gsub("^t","Time",names(data))
names(data)<-gsub("^f","Frequency",names(data))
names(data)<-gsub("Acc","Accelerometer",names(data))
names(data)<-gsub("Gyro","Gyroscope",names(data))
names(data)<-gsub("Mag","Magnitude",names(data))
names(data)<-gsub("mean\\(\\)","Mean",names(data))
names(data)<-gsub("std\\(\\)","StandardDeviation",names(data))
names(data)<-gsub("[Bb]ody[Bb]ody","Body",names(data))
names(data)<-gsub("-","",names(data))

#From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
tidy_data<-data %>%
        group_by(Activity,Subject) %>%
        summarise_each(funs(mean),-Activity,-Subject)

write.table(tidy_data,"tidydata.txt",row.name=FALSE)