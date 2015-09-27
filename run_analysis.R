# Course Project for Getting and Cleaning Data
# This code is takes summarized sensor data from the "UCI HAR Dataset"
# dataset and produces a dataset of the means and standard deviations
# group by subject and activity.  In order to do that, it first recombines
# the the test and training dataset splits back into a combined dataset.
# The final dataset is output to the current working directory.
#
# Assumes that the "UCI HAR Dataset" data exists in a subfolder tree off
# the current working directory and that the tree is structured as it is
# in the zip file.


# Parameters
workingdir <- getwd() # To manually set, change to a string like "C:\\work\\courseproject\\"
datadir <- "UCI HAR Dataset"

library(plyr) # Always useful

# Function to reconstitute split out datasets files back into a dataset
process_source_data_subset <- function(folder) {
   # Read in the subject IDs for each observation
   folder_dir <- paste(workingdir, datadir, folder, sep="\\")
   subjids_fn <- paste(folder_dir, paste("subject_", folder, ".txt", sep=""), sep="\\")
   subjids <- read.delim(subjids_fn, header=FALSE, sep=" ")
   colnames(subjids) <- c("subjid")

   # Read in the activities performed for each observation.  This is stored in
   # the Y_*.txt file.
   activities_fn <- paste(folder_dir, paste("Y_", folder, ".txt", sep=""), sep="\\")
   activities <- read.delim(activities_fn, header=FALSE, sep=" ")
   colnames(activities) <- c("activitycode")

   # Read in the calculated observational values from the X_*.txt file.  This
   # file is in fixed width format with single or double spaces between columns.
   # Instead of manually figuring out the column positions and using read.fwf(),
   # I've chosen to clean up the file then use read.delim().
   data_fn <- paste(folder_dir, paste("X_", folder, ".txt", sep=""), sep="\\")
   temp_lines <- readLines(data_fn, warn=FALSE) # Read in all the lines
   temp_lines <- gsub("  ", " ", temp_lines) # Change double-spaces to single-spaces
   temp_lines <- gsub("^ ", "", temp_lines) # Remove the leading space on the line
   # Write out the cleanup lines to a temp file then read it back in with parsing
   tempfn <- tempfile()
   writeLines(temp_lines, con=tempfn)
   data <- read.delim(tempfn, header=FALSE, sep=" ", quote="\"", dec=".",
                      fill=FALSE, comment.char="")
   # The column names for this data come from the features dataframe
   colnames(data) <- features[, "featurecolname"]

   unlink(tempfn) ; rm(temp_lines) # Clean up after ourselves

   # Now merge the subject IDs, activities performed, and resulting values into
   # a wide dataframe
   retval <- cbind(subjids, activities, data)

   return (retval) # Done
}


#----------------------------------------------------------------------------------
# Main body

setwd(workingdir)

# Get the activity labels
activity_labels_fn <- paste(workingdir, datadir, "activity_labels.txt", sep="\\")
activity_labels <- read.delim(activity_labels_fn, header=FALSE, sep=" ")
colnames(activity_labels) <- c("activitycode", "activity")

# Get the features info
features_fn <- paste(workingdir, datadir, "features.txt", sep="\\")
features <- read.delim(features_fn, header=FALSE, sep=" ")
colnames(features) <- c("featurecode", "feature")
# I don't exactly like dumbing down column names, but to make people happy...
features$featurecolname <- features$feature
features$featurecolname <- gsub("\\,", "", features$featurecolname)
features$featurecolname <- gsub("\\(", "", features$featurecolname)
features$featurecolname <- gsub("\\)", "", features$featurecolname)
features$featurecolname <- gsub("\\-", "", features$featurecolname)
features$featurecolname <- tolower(features$featurecolname)

# Load in the training and test datasets
training_data <- process_source_data_subset("train")
test_data <- process_source_data_subset("test")

# Create one big happy dataset from the training and test data
combined_data <- rbind(training_data, test_data)

# Translate the activity codes into activity labels and eliminate
# the numeric activity code column
combined_data <- merge(combined_data, activity_labels, by="activitycode")
combined_data <- subset(combined_data, select= -c(activitycode))

# Extract out only the measurements on the mean and standard deviation for
# each measurement
desired_cols <- grep("subjid|activity|mean|std", colnames(combined_data), value=TRUE)
desired_subset <- combined_data[desired_cols]

# Aggregate the observations by subject ID and activity, and calculate the
# average (=mean) of the remaining variables 
final_dataset <- aggregate(.~subjid+activity, data=desired_subset, mean, na.rm=TRUE)


# Output the dataset to the working directory
write.table(final_dataset, file=paste(workingdir, "course_project_results.txt", sep="\\"),
            row.names=FALSE, na="")

print ("Done")
