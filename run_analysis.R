##next line is for changing the y variables from values 1 through 6 to WALKING, etc
activity_labels <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

##next line gives column names for the x data
feature_colnames <- (read.delim("features.txt", header=FALSE, as.is=TRUE))[,1]

x_test <- read.table("test/X_test.txt", col.names = feature_colnames)

y_test <- read.table("test/y_test.txt", col.names = c("activity"))
y_test$activity <- cut(y_test$activity, breaks = 6, labels = activity_labels)

test_subjects <- read.table("test/subject_test.txt", col.names = c("subject"))
final_test <- cbind(test_subjects, y_test, x_test)


x_train <- read.table("train/X_train.txt", col.names = feature_colnames)

y_train <- read.table("train/y_train.txt", col.names = c("activity"))
y_train$activity <- cut(y_train$activity, breaks = 6, labels = activity_labels)


train_subjects <- read.table("train/subject_train.txt", col.names = c("subject"))
final_train <- cbind(train_subjects, y_train, x_train)

big_combined_df <- rbind(final_test, final_train)

#now we select only the columns which contain means and sd's (in addition to subject and activity)
mean_sd_df <- big_combined_df <- big_combined_df[, c(1,2,3,4,5,6,7,8,43,44,45,46,47,48,83,84,85,86,87,88)]

#now we improve column names
colnames(mean_sd_df) <- c("SUBJECT", "ACTIVITY", "XACCELERATIONMEAN", "YACCELERATIONMEAN", "ZACCELERATIONMEAN", "XACCELERATIONSD", "YACCELERATIONSD", "ZACCELERATIONSD", "XGRAVITYMEAN", "YGRAVITYMEAN", "ZGRAVITYMEAN", "XGRAVITYSD", "YGRAVITYSD", "ZGRAVITYSD", "XJERKMEAN", "YJERKMEAN", "ZJERKMEAN", "XJERKSD", "YJERKSD", "ZJERKSD")
