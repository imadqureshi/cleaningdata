Following are the variables used by the script "run_analysis.R".

1. wd - stores the working directory. Any file that is not in working directory needs to be relatively referenced.
2. features - stores features read from features.txt.
3. training_set - stores training set read from "X_train.txt"
4. training_label - stores training labels as read from "y_train.txt".
5. test_set - stores test set read from "X_test.txt".
6. test_label - stores test labels as read from "y_label.txt".
7. subject_train - stores subjects from training set. Data read from "subject_train.txt".
8. subject_test - stores subjects from test set. Data read from "subject_test.txt"
9. data_set - variable that contains merged data set as required by step 1 of project.
10. mean_std - contins only mean and standard deviation for each measurement as required by step 2. The reason to create
new variable is because "data_set" will be used in its entirety in next steps.
11. average_all - stores the average of each variable for each activity for each subject. For 30 sibjects and 6 activities,
total number of rows in this variable is 180.
