The data sets are available here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data for input is made up of the following:

1. X_train.txt contains variable features that are intended for training.
2. y_train.txt contains the activities corresponding to X_train.txt.
3. subject_train.txt contains information on the subjects from whom data is collected.
4. X_test.txt contains variable features that are intended for testing.
5. y_test.txt contains the activities corresponding to X_test.txt.
6. subject_test.txt contains information on the subjects from whom data is collected.
7. activity_labels.txt contains metadata on the different types of activities.
8. features.txt contains the name of the features in the data sets.

The transformation performed on the input data are as follows:

1. X_train.txt read to features.Train.
2. y_train.txt read to activity.Train.
3. subject_train.txt read to subject.Train.
4. X_test.txt read to features.Test.
5. y_test.txt read to activity.Test.
6. subject_test.txt read to subject.Test.
7. features.txt read to feature.Names.
8. activity_labels.txt read to activity.Labels.
9. The subjects in test and training data sets are merged to form subject.
10. The activities in test and training data sets are merged to form activity.
11. The features of test and training are merged to form features.
12. The name of the features are set in features from feature.Names.
13. features, activity and subject are merged to form complete.Data.
14. Extracted columns that contain std or mean, activity and subject are put into required.Columns .
15. extracted.Data is created with data from columns obtained from required.Columns.
16. Activity column in extracted.Data is amended names of activities that are more descriptive taken from activity.Labels.
17. Activity column is expressed as a factor variable.
18. Acronyms in variable names in extracted.Data are replaced with descriptive labels.
19. tidy.Data is created as a set with average for each activity and subject of extracted.Data. Entries in tidy.Data are ordered based on activity and subject.
20. Finally, the data in tidy.Data is written into Tidy.txt.
