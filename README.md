The code for this project was written by Tamari Geron for university course "Introduction to R".

This project provides a reusable R function to calculate descriptive statistics for data frames. It allows filtering based on a specific range of Subject_ID values and includes error handling for small datasets or missing columns.

# Features
Descriptive Statistics for Continuous Variables:


- Minimum

- Maximum

- Mean

- Median

- Standard Deviation


Summarization for Categorical Variables:

- Levels and their frequencies.


Custom Range Filtering:

- Specify a range of Subject_ID values to include in the analysis using subject_start and subject_end arguments.

Error Handling:

Returns an error if:

- The dataset contains fewer than 10 rows.
- The Subject_ID column is missing.
- The filtered dataset contains no rows.

# Project Files
1. functions.R

Contains the function create_descriptive_stats():

- Calculates descriptive statistics for a given data frame.
- Allows filtering of rows based on Subject_ID.
- Returns a data frame summarizing the results

2. analysis.R

Demonstrates how to:

- Create a sample dataset (analysis).
- Source the function from functions.R.
- Call the function and print results for a specific range of Subject_ID values.
