## instal needed packages
install.packages("reshape")
library(reshape)
install.packages("plyr")
library(plyr)
##read needed data
dane<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
dane2<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
Xtrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
Xtest<-read.table("./UCI HAR Dataset/test/X_test.txt")
Ytrain<-read.table("./UCI HAR Dataset/train/Y_train.txt")
Ytest<-read.table("./UCI HAR Dataset/test/Y_test.txt")
atrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")
atest<-read.table("./UCI HAR Dataset/test/subject_test.txt")
features<-read.table("./UCI HAR Dataset/features.txt")
labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
sublabels<-read.table("./UCI HAR Dataset/activity_labels.txt")
##add one data to others, as it was described in forum
pol<-rbind(Xtrain,Xtest)
sub<-rbind(atrain,atest)
Y<-rbind(Ytrain,Ytest)
l=as.character(labels[,2])
s=as.character(sublabels[,2])
##add labels to the data
for (i in 1:nrow(Y)){
  if (Y[i,]==1){
    Y[i,]=l[1]
  }else if (Y[i,]==2){
        Y[i,]=l[2]
  }else if (Y[i,]==3){
    Y[i,]=l[3]
  }else if (Y[i,]==4){
    Y[i,]=l[4]
  }else if (Y[i,]==5){
    Y[i,]=l[5]
  } else if (Y[i,]==6){
    Y[i,]=l[6]
  } 
}
pol<-cbind(pol,sub)
pol<-cbind(pol,Y)
colnames(pol)<-features[,2]
x<-colnames(pol)
x[ncol(pol)]="activity"
x[(ncol(pol)-1)]="subject"
colnames(pol)<-x
##take columns with mean and standard deviations
mn<-grep("mean()",x)
std<-grep("std()",x)
dobre<-c(mn,std)
kolejne<-x[dobre]
pol2<-pol[,c(dobre,ncol(pol)-1,ncol(pol))]
change<-melt(pol,id=c("subject","activity"),measure.vars=dobre)
write.table(change, file="date.txt")
install.packages("reshape2")
library(reshape2)
i=22
t=c()
for (i in 1:length(kolejne)){
tidied <- dcast(change, subject + activity ~ kolejne[i] , mean)
t<-list(t,tidied)
}
write.table(t, file="end3.txt")
