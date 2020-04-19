# Getting-and-Cleaning-Data-Course-Project

## Getting dataset
The original test and training datasets are loaded into variables (subject, activity, and features). For each dataset, dataframes are generated based on the different imported vectors

## Merging datasets, adding activity names and names of columns
The test and training datasets are merged into a common dataset (data.merged). A column is added with the name of the actvities. Then , the names of the columns of this data set is defined based on the features vector.   

## Selecting only features with mean or standard deviation
Based on the names of the column of the dataset, columns with mean or std in their name are kept for the tidy dataset.

## Transferring dataset to dplyr table and ordering
The tidy dataset is then transferred ot dplyr table and arrange by subject and activity. The tidy dataset is stored in tidy_dataset table.

## Summarize data by subject and activity
The tidy dataset is finally sumarized and average values for each measurement are calculated by subject and by activity. The summarized dataset is stored in summary_dataset table
