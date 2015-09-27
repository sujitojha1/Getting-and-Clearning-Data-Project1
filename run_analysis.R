# Getting and Cleaning Data : Project 1
#
# The purpose of this project is to demonstrate your ability
# to collect, work with, and clean a data set
#
library(dplyr)
library(reshape2)

features <- read.table("UCI HAR Dataset/features.txt", header = FALSE, sep = "")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = "")
names(activity_labels) <- c("Activity ID","Activity Labels")

Sub_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")
Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt", header = FALSE, sep = "")

Sub_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")
Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt", header = FALSE, sep = "")

names(X_test) <- features[,2]
names(X_train) <- features[,2]

XY_test <- cbind(Sub_test, Y_test, X_test)
XY_train <- cbind(Sub_train, Y_train, X_train)

XY_data <- rbind(XY_test,XY_train)

names(XY_data)[1] <- "Volunteer ID"
names(XY_data)[2] <- "Activity ID"

valid_column_names <- make.names(names=names(XY_data), unique=TRUE, allow_ = TRUE)
names(XY_data) <- valid_column_names

XY_data <- merge(XY_data, activity_labels, by.x = "Activity ID", by.y = "Activity ID")

XYdata_subset <- select(XY_data,Volunteer.ID,Activity.Labels,Activity.ID,contains("mean"),contain("std"))

rm(X_test,Y_test,X_train,Y_train,XY_test,XY_train, Sub_train, Sub_test,features, activity_labels,XY_data,valid_column_names)

XYdata_melt <- melt(XYdata_subset,id=c("Volunteer.ID","Activity.Labels"))
XYdata_summary <- dcast(XYdata_melt, Volunteer.ID + Activity.Labels ~ variable, mean)

write.table(XYdata_summary,"XYdata_summary.txt",row.name=FALSE)
write.csv(XYdata_summary,"XYdata_summary.csv")
