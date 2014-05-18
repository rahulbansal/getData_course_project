DESCRIPTION OF THE WORKING OF THE SCRIPT
======================

1. Create the traning data frame from subject_train.txt, X_train.txt and y_train.txt files.

2. Create the test data frame from subject_test.txt, X_test.txt and y_test.txt files.

3. Merge training and test data into one data frame.

4. Assign column names to the columns of the data frame.

5. Find the columns representing means and stndard deviations.

6. Extract those columns into a subset data frame.

7. Assign the activity names to the data.

8. Iterate over the data for each subject and activity and extract the subset. Using colMeans function on the subset, compute average for each variable. Record results into a new data frame.

9. After iteration ends, the resulting data frame will have average of each variable for each activity and each subject.

10. Write the data frame to a text file.

The resulting data has 180 rows (each one of the 30 subjects has a row for each one of the 6 activities).
