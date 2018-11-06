  ## Set working directory
  setwd("D:/Users/firaihan/Desktop/Data Science Assignments/Module 3 Assignment/UCI HAR Dataset")
  
  ## Read the supporting metadata
  feature.Names <- read.table("features.txt")
  activity.Names <- read.table("activity_labels.txt", header = FALSE)
  
  ## Read test data
  subject.Test <- read.table("D:/Users/firaihan/Desktop/Data Science Assignments/Module 3 Assignment/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
  features.Test <- read.table("D:/Users/firaihan/Desktop/Data Science Assignments/Module 3 Assignment/UCI HAR Dataset/test/X_test.txt", header = FALSE)
  activity.Test <- read.table("D:/Users/firaihan/Desktop/Data Science Assignments/Module 3 Assignment/UCI HAR Dataset/test/y_test.txt", header = FALSE)
  
  ## Read training data
  subject.Train <- read.table("D:/Users/firaihan/Desktop/Data Science Assignments/Module 3 Assignment/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
  features.Train <- read.table("D:/Users/firaihan/Desktop/Data Science Assignments/Module 3 Assignment/UCI HAR Dataset/train/X_train.txt", header = FALSE)
  activity.Train <- read.table("D:/Users/firaihan/Desktop/Data Science Assignments/Module 3 Assignment/UCI HAR Dataset/train/y_train.txt", header = FALSE)
  
  ## Combine datasets
  subject <- rbind(subject.Train, subject.Test)
  features <- rbind(features.Train, features.Test)
  activity <- rbind(activity.Train, activity.Test)
  
  ## Rename column names for features
  colnames(features) <- t(feature.Names[2])
  
  ## Rename column names for activity and subject
  colnames(activity) <- "Activity"
  colnames(subject) <- "Subject"
  
  ## Combine all data into another dataset
  complete.Data <- cbind(features,activity,subject)
  
  ## Extract mean and standard deviation
  col.means.STD <- grep(".*Mean.*|.*Std.*", names(complete.Data), ignore.case = TRUE)
  
  required.Columns <- c(col.means.STD, 562, 563)
  dim(complete.Data)
  
  extracted.Data <- complete.Data[,required.Columns]
  dim(extracted.Data)
  
  ## Change data type from numerical to character
  extracted.Data$Activity <- as.character(extracted.Data$Activity)
  for (i in 1:6){
    extracted.Data$Activity[extracted.Data$Activity == i] <- as.character(activityNames[i,2])
  }
  
  ## Factor the Activity variable
  extracted.Data$Activity <- as.factor(extracted.Data$Activity)
  
  ## Replace the names of the variables
  names(extracted.Data)<-gsub("Acc", "Accelerometer", names(extracted.Data))
  names(extracted.Data)<-gsub("Gyro", "Gyroscope", names(extracted.Data))
  names(extracted.Data)<-gsub("BodyBody", "Body", names(extracted.Data))
  names(extracted.Data)<-gsub("Mag", "Magnitude", names(extracted.Data))
  names(extracted.Data)<-gsub("^t", "Time", names(extracted.Data))
  names(extracted.Data)<-gsub("^f", "Frequency", names(extracted.Data))
  names(extracted.Data)<-gsub("tBody", "TimeBody", names(extracted.Data))
  names(extracted.Data)<-gsub("-mean()", "Mean", names(extracted.Data), ignore.case = TRUE)
  names(extracted.Data)<-gsub("-std()", "STD", names(extracted.Data), ignore.case = TRUE)
  names(extracted.Data)<-gsub("-freq()", "Frequency", names(extracted.Data), ignore.case = TRUE)
  names(extracted.Data)<-gsub("angle", "Angle", names(extracted.Data))
  names(extracted.Data)<-gsub("gravity", "Gravity", names(extracted.Data))
  
  ## Set the subject as factor variable
  extracted.Data$Subject <- as.factor(extracted.Data$Subject)
  
  ## Write into tidy data txt file
  tidy.Data <- aggregate(. ~Subject + Activity, extracted.Data, mean)
  tidy.Data <- tidy.Data[order(tidy.Data$Subject,tidy.Data$Activity),]
  
  ## Code is given in the assignment instruction
  write.table(tidy.Data, file = "Tidy.txt", row.names = FALSE)