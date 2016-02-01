library(dplyr)

# Prepare the column and activities names
subjectsColumnName <- c("subjects")
activitiesColumnName <- c("activities")

featuresNames <- read.table('features.txt', stringsAsFactors = F)[,2]
meanOrStdFeatures <- c(
    subjectsColumnName,
    activitiesColumnName,
    featuresNames[grepl("mean()", featuresNames, fixed=TRUE)],
    featuresNames[grepl("std()", featuresNames, fixed=TRUE)]
)

activitiesNames <- read.table('activity_labels.txt', stringsAsFactors = F)

# Read the test dataset
subjectIds <- read.table('./test/subject_test.txt', col.names=subjectsColumnName)

activitiesIds <- read.table('./test/y_test.txt', col.names=activitiesColumnName)
features <- read.table('./test/X_test.txt', col.names=featuresNames, check.names = FALSE)

# Bind frames together, providing 'features' vector as the columns names (required in step 4)
testData <- cbind(subjectIds, activitiesIds, features)

# Read the train dataset
subjectIds <- read.table('./train/subject_train.txt', col.names=subjectsColumnName)
activitiesIds <- read.table('./train/y_train.txt', col.names=activitiesColumnName)
features <- read.table('./train/X_train.txt', col.names=featuresNames, check.names = FALSE)

# Bind frames together, providing 'features' vector as the columns names (required in step 4)
trainData <- cbind(subjectIds, activitiesIds, features)

# Bind train and test datasets together as required in step 1.
dataSet <- rbind(trainData, testData)

# Extract only mean- and standard-deviation-related observations - required in step 2
meanAndSDDataSet <- dataSet[, meanOrStdFeatures]

# Get tidy data - required in step 5
tidyData <- meanAndSDDataSet %>% group_by(subjects, activities) %>% summarise_each(funs(mean))

# Labels the activities in data-set with human-readable values (required in step 3)
getActivityName <- function(activityCode) {
    activitiesNames[activityCode, ][, 2]
}
tidyData$activities <- sapply(tidyData$activities, getActivityName)

# Write down the resulting data set into the file
write.table(tidyData, file='./tidy_data.txt', row.names=FALSE)
