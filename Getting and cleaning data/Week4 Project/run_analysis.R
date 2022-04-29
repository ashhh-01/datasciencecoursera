library(reshape2)


filename<-"getdata_projectfiles_UCI HAR Dataset.zip"

#Download file
if(!file.exists(filename)){
    url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url,filename,method = curl)
}

#Unzip file
if(!file.exists("UCI HAR Dataset")){
    unzip(filename)
    
}

activityLabel<-read.table("UCI HAR Dataset/activity_labels.txt")
activityLabel[,2]<-as.character(activityLabel[,2])

features<-read.table("UCI HAR Dataset/features.txt")
features[,2]<-as.character(features[,2])

wantedFeatures<-grep(".*mean.*|.*std.*",features[,2])
wantedFeatures.name<-features[wantedFeatures,2]
wantedFeatures.name=gsub("-mean","Mean",wantedFeatures.name)
wantedFeatures.name=gsub("-std","Std",wantedFeatures.name)
wantedFeatures.name<-gsub("[-()]","",wantedFeatures.name)

train<-read.table("UCI HAR Dataset/train/X_train.txt")[wantedFeatures]
trainActivities<-read.table("UCI HAR Dataset/train/y_train.txt")
trainSubjects<-read.table("UCI HAR Dataset/train/subject_train.txt")
train<-cbind(trainSubjects,trainActivities,train)

test<-read.table("UCI HAR Dataset/test/X_test.txt")[wantedFeatures]
testActivities<-read.table("UCI HAR Dataset/test/y_test.txt")
testSubjects<-read.table("UCI HAR Dataset/test/subject_test.txt")
test<-cbind(testSubjects,testActivities,test)

allData<-rbind(train,test)
colnames(allData)<-c("Subject","Activity",wantedFeatures.name)

allData$Activity<-factor(allData$Activity,levels = activityLabel[,1],labels=activityLabel[,2])
allData$Subject<-as.factor(allData$Subject)

allData.melted<-melt(allData,id=c("Subject","Activity"))
allData.mean<-dcast(allData.melted,Subject+Activity~variable,mean)

write.table(allData.mean,"tidy.txt",row.names=FALSE,quote = FALSE)
