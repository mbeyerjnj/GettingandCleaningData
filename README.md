# GettingandCleaningData
Course Project for Getting and Cleaning Data

The objective of this project is to create a tidy dataset from
a subset of the Human Activity Recognition Using Smartphones Data Set
actigraphy data available at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The code is takes summarized sensor data from the "UCI HAR Dataset"
dataset and produces a dataset of the means and standard deviations
group by subject and activity.  In order to do that, it first recombines
the the test and training dataset splits back into a combined dataset.
The final dataset is output to the current working directory.

Assumes that the "UCI HAR Dataset" data exists in a subfolder tree off
the current working directory and that the tree is structured as it is
in the zip file.

To use this code to produce the tidy dataset:
1) Download the "UCI HAR Dataset.zip" from the URL above or from the replicate at
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
   For convenience sake, a copy is also available in the repository with this code. 
2) Unzip the file and place the contained "UCI HAR Dataset" folder into the same
   folder (eg: C:\work\courseproject\) as run_analysis.R
3) In R set your working directory to the folder containing run_analysis.R and
   execute run_analysis.R. For example:
      setwd("C:\\work\\courseproject\\")
      source("run_analysis.R")
4) Output will be placed in course_project_results.txt in the current working
   directory.
5) See CodeBook.md for details on interpreting the data


## Credits and Citations

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.
A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th
European Symposium on Artificial Neural Networks, Computational Intelligence and
Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

