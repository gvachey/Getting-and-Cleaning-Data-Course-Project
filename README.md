# Getting-and-Cleaning-Data-Course-Project

## Human Activity Recognition Using Smartphones Dataset
Version 1.0
Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Universit‡  degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat PolitËcnica de Catalunya (BarcelonaTech). Vilanova i la Geltr˙ (08800), Spain

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


The run_analysis.R script allows to get and merge the training and test datasets and tidy it properly. The output is the tidy dataset. Additional comments whithin the script could allow the user to better understand the different steps. 

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


