# gettingandcleaningdata
Peer Graded Assignment for Coursera Data Science Specialization Course Module 3

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The repository created here has the following files:
1. README.md - A file explaining the background of the analysis
2. codebook.md - A codebook that describes the data and variables of the dataset
3. Tidy.txt - The tidy data set in txt
4. run_analysis.R - the R script that creates the dataset

## Merging the data sets

The train and test data were first merged together to create one complete data set.

## Extracting the mean and standard deviation

The measurements on the mean and standard deviation were extracted for each measurement, and then the measurements were averaged for each activity and subject. The final data set will have the average measurements for each activity and subject.

## run_analysis.R

The R script can be run to create the tidy data as described above.

The R script will:
1. Set the working directory where the source data is downloaded
2. Read the supporting metadata
3. Read the test and training data
4. Combine data sets
5. Rename columns
6. Replace names of variables
7. Create tidy data in txt format
