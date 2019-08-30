library(dplyr)
setwd("UCI HAR Dataset")
#using R to read all the data necessory
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test<- read.table("./test/subject_test.txt")
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

#combine those data into one dataset
train <- cbind(x_train,y_train,subject_train)
test <-cbind(x_test,y_test,subject_test)
data <- rbind(train,test)
rm(train,test,x_test,y_test,x_train,y_train,subject_test,subject_train)


#extract the measurements on the mean and standard deviation for each measurement
fname = read.table("features.txt",stringsAsFactors = FALSE)[,2]
fin <- grep("mean\\(\\)|std\\(\\)",fname)
data <- data[,c(fin,ncol(data)-1,ncol(data))]
colnames(data)<-c(fname[fin],"activity","subject")

#Use descriptive activity names to name the acitivities in the dataset
aname <- read.table("activity_labels.txt")
data<-transform(data,activity = aname[activity,2])
print(class(data$activity))
#change order of the columns
data <- data[,c(ncol(data)-1,ncol(data),1:(ncol(data)-2))]

#change the column name to be more readable
names(data)<-gsub("\\()",'',names(data))
names(data)<-gsub(".mean","Mean",names(data))
names(data)<-gsub(".std","Std",names(data))
names(data)<-gsub("^f",'Frequency',names(data))
names(data)<-gsub('^t','Time',names(data))

#create a second, indepenent tidy data set with the average of each variable 
#for each activity and each subject
data_temp <- data%>% group_by(subject,activity)
data_tidy_mean<-summarize_each(data_temp,mean)

write.table(data_tidy_mean, "../MeanData.txt", row.names = FALSE)