
#run_analysis.R Walkthrough



This document aims to explain how "run_analysis.R" script works. 

Raw data is collected from the accelerometers from the Samsung Galaxy S smartphone. To prepare it for later analysis, we should download it and unzip it in a working directory. Raw data:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

These packages are needed to create a tidy data set.

```{r,results='hide',message=FALSE,warning=FALSE}
library(data.table)
library(dplyr)
library(tidyr)
```

##Merge the training and the test sets to create one data set.

###1. Read relevent txt files and assign them with appropriate names. 

   + "train/X_train.txt" and "test/X_test.txt" : the main features of traning and testing sets.
   
   + "train/subject_train.txt" and "test/subject_test.txt" : each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
   
   + "train/y_train.txt" and "test/y_test.txt": activity name labels
         
```{r}
train<-read.table("train/X_train.txt")
test<-read.table("test/X_test.txt")
subject_train<-read.table("train/subject_train.txt")
subject_test<-read.table("test/subject_test.txt")
y_train<-read.table("train/y_train.txt")
y_test<-read.table("test/y_test.txt")
```

###2. Merge above data sets in to one data frame by feature, subject and actibity label. 

   + Stack train and test feature sets. 
      
   + Feature column names are in "features.txt". Read this data set and use it to name feature columns.
            
```{r}
#merge train and test into a dataframe called feature
feature<-bind_rows(train,test)

#name feature columns
featurenames<-tbl_df(read.table("features.txt"))
colnames(feature)<-featurenames$V2
```
      
   + Stack training and testing subjects. 
      
   + Stack training and testing activity labels. 
      
```{r}
#merge subject_train and subject_test into a dataframe called subject
subject<-bind_rows(subject_train,subject_test)

#merge y_train and y_test into a dataframe called activity
activity<-bind_rows(y_train,y_test)
```

   + Merge "feature", "subject" and "activity" into one data frame. 
   + Characterise column names.

```{r}
#merge feature, subject and activity into a dataframe called data
data<-bind_cols(subject, activity, feature)
colnames(data)<-c("Subject","Activity",as.character(featurenames$V2))
```

##Extract only the measurements on the mean and standard deviation for each measurement.

Search column names matching "mean()" and "std()", using **grep**.

```{r}
#Extracts only the measurements on the mean and standard deviation for each measurement. 
selected<-c(1,2,grep("mean\\(\\)|std\\(\\)",names(data)))
data<-data[,selected]

```

##Use descriptive activity names to name the activities in the data set

Factorize values in Activity column and label them as character strings.

```{r}
activity_labels<-read.table("activity_labels.txt")
data$Activity<-as.character(factor(data$Activity,levels=1:6,labels=activity_labels$V2))

```

##Appropriately label the data set with descriptive variable names. 

  - Replace all the cryptic column labels with descriptive words:
  
     Time replaces t
   
     Frequency replaces f
   
     Acclerometer replaces ACC
   
     Gyroscope replaces Gyro
   
     Magnitude replaces Mag
   
  - Remove parentheses
  
  - Remove duplicates
  
  - Remove other non-alphabetic symbols 
   
  - To make the variables more readable, all the variable names are written in **CamelCase** format.
  
```{r}
names(data)<-gsub("^t","Time",names(data))
names(data)<-gsub("^f","Frequency",names(data))
names(data)<-gsub("Acc","Accelerometer",names(data))
names(data)<-gsub("Gyro","Gyroscope",names(data))
names(data)<-gsub("Mag","Magnitude",names(data))
names(data)<-gsub("mean\\(\\)","Mean",names(data))
names(data)<-gsub("std\\(\\)","StandardDeviation",names(data))
names(data)<-gsub("[Bb]ody[Bb]ody","Body",names(data))
names(data)<-gsub("-","",names(data))

```

##Create a second, independent tidy data set with the average of each variable for each activity and each subject.

Group data into rows with same values of Activities and Subjects. Then calculate the mean value of each column.

```{r}
tidy_data<-data %>%
        group_by(Activity,Subject) %>%
        summarise_each(funs(mean),-Activity,-Subject)

write.table(tidy_data,"tidydata.txt",row.name=FALSE)

```
