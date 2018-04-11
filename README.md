# R-University-Assignments
This Assignment has been given in our University on 3rd semester. Hope if any one can find this useful can go ahead a check the scripts 

The Assingment includes :-

1. Creating a Dataframe from set of atomic vectors, returning those columns which are complete and also incomplete ones, and omitting them from the Dataset and usual subsetting commands and counting them.

2. Creating a Dataframe from set of atomic vectors and returning the summary statistics for the same.

3. Three questions were asked :-

A. Write a function named ‘pollutantmean’ that calculates the mean of a pollutant (sulfate or nitrate) across a specified list          of monitors. The function ‘pollutantmean’ takes three arguments: ‘directory’, ‘pollutant’, and ‘id’. Given a vector monitor ID numbers, ‘pollutantmean’ reads that monitors’ particulate matter data from the directory specified in the ‘directory’ argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA.

B.Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases. A prototype of this function follows

C.Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. A prototype of this function follows

For this function you will need to use the ‘cor’ function in R which calculates the correlation between two vectors. Please read the help page for this function via ‘?cor’ and make sure that you know how to use it.

4.Multiple question were asked in this assingment but the ultimate goal was to fit a linear model(Multiple Linear Regression) to the lungcap dataset and show that a better linear model such Polynomial Regression can be fitted. The decision of fitting the polynomial regression is made from residual vs fitted graph.
