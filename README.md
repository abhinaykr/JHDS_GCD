JHDS_GCD
========

The script run_analysis.R is broken down in to 3 big sections: loading data, extracting and naming, and lastly summarizing the data.

### Loading data
Pretty self explanitory. The script loads both the training and test sets for the various files in the dataset. For each file set, rbind().

### Extracting mean & standard deviation data and naming
Used grep and gsub to find and manipulate mean and standard deviation named variables. And matched activity values with the data. The script then collects the no named data using cbind().

### sumamrising data
The script uses dplyr to make the group and summarising data easier.

Finally, the new data is written to a text file "tidydata.txt"

