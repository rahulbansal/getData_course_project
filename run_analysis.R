#read training data
train_subjects = read.table('./train/subject_train.txt')
train_X = read.table('./train/X_train.txt')
train_y = read.table('./train/y_train.txt')
train_data = data.frame(train_subjects, train_X, train_y)

#read test data
test_subjects = read.table('./test/subject_test.txt')
test_X = read.table('./test/X_test.txt')
test_y = read.table('./test/y_test.txt')
test_data = data.frame(test_subjects, test_X, test_y)

#merge training and test data
whole_data = rbind(train_data, test_data)

#read feature names
features = read.table("features.txt")
colnames = c("subject", as.character(features[,2]), "activity_label")

#assign column names
colnames(whole_data) = colnames

#find columns with "mean" in the name
mean_cols = grep("mean",colnames)

#find columns with "std" in the name
std_cols = grep("std",colnames)

#get the desired subset of data
desired_cols = sort(c(1, mean_cols, std_cols, 563))
desired_data = whole_data[,desired_cols]

#read activity names
activity_names = read.table("activity_labels.txt")
colnames(activity_names) = c("activity_label","activity_name")

#assign activity names to the data
whole_data_with_activity_names = merge(whole_data,activity_names,by="activity_label",sort=FALSE)
desired_data_with_activity_names = merge(desired_data,activity_names,by="activity_label",sort=FALSE)

#create a list of column names for the tidy data set
cols = colnames(desired_data_with_activity_names)
avg_colnames = as.vector(sapply(cols[3:81], function(x) paste("Avg-",x,sep="")))
new_data_set_colnames = c(cols[1:2], avg_colnames)

#iterate over the data to average each variable for each activity and each subject and generate a new data frame for the tidy data set
subjects = 1:30
activities = 1:6
new_data_set = data.frame()
for(i in subjects)
{
  for(j in activities)
  {
    sub_data = subset(desired_data_with_activity_names, subject == i & activity_label == j)
    avg_data = colMeans(sub_data[3:81])
    new_data_set = rbind(new_data_set, c(j,i,avg_data))
  }
}
colnames(new_data_set) = new_data_set_colnames
new_data_set_with_names = merge(new_data_set,activity_names,by="activity_label")
new_data_set_with_names = new_data_set_with_names[order(new_data_set_with_names$subject, new_data_set_with_names$activity_label),]

#write the new data frame aka tidy data set to a text file
write.table(new_data_set_with_names, "tidydata.txt", sep="\t", row.names= FALSE) 
