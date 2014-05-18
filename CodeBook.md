DESCRIPTION OF THE VARIABLES IN THE SCRIPT
======================
train_subjects = single column data frame identifying the subject for each row in the training set
train_X = 7352*561 data frame of training data 
train_y = single column data frame identifying the activity (by its numeric label) for each row in the training set
train_data = data frame merging the above mentioned training data frames


test_subjects = single column data frame identifying the subject for each row in the test set
test_X = 2947*561 data frame of test data
test_y = single column data frame identifying the activity (by its numeric label) for each row in the test set
test_data = data frame merging the above mentioned test data frames

whole_data = data frame merging the test and training data frames

features = data frame of feature names
colnames = column names for the combined data set
mean_cols = columns with "mean" in their names
std_cols = columns with "mean" in their names

desired_data = subset of the combined data that consists of only those columns that are mean or standard deviations

activity_names = data frame of activity names

whole_data_with_activity_names = combined data with textual activity names
desired_data_with_activity_names = desired data with textual activity names

cols = names of the columns in desired_data_with_activity_names
avg_colnames = list of column names after prepending 'Avg-' to the names of those columns that are to be averaged
new_data_set_colnames = list of column names for the new tidy data set


subjects = vector of subject labels
activities = vector of activity labels
new_data_set = new tidy data set


new_data_set_with_names = new tidy data set with activity names

