# Load Data & Merge
test = read.table("test/X_test.txt") # read txt file
train = read.table("train/X_train.txt") # read txt file
t <- rbind(train,test)

subject_test = read.table("test/subject_test.txt")
subject_train = read.table("train/subject_train.txt")
total_subject <- rbind(subject_train, subject_test)

y_test = read.table("test/Y_test.txt")
y_train = read.table("train/Y_train.txt")
total_y <- rbind(y_train, y_test)

activit_labels = read.table("activity_labels.txt")
activity <- activit_labels
rm("activit_labels")

# Extract mean & standard deviation, and name appropriately

features <- read.table("features.txt")
m_s <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
t <- t[,m_s]
names(t) <- features[m_s, 2]
names(t) <- gsub("\\(|\\)","",names(t))
names(t) <- tolower(names(t))

activity[,2] = gsub("_","",tolower(as.character(activity[,2])))
total_y[,1]=activity[total_y[,1],2]
names(total_y) <- "activity"
names(total_subject) <- "subject"

# Collect all data
cleandata <- cbind(total_subject,total_y,t)


# New summarised data by group

library(dplyr)
data <- tbl_df(cleandata)
    
tidydata <-
    data %>%
    group_by(subject,activity) %>%
    summarise_each(funs(mean))

write.table(tidydata, file = "tidydata.txt", row.name=FALSE)


