### FUNCTIONS ###

#Cleaning the workspace
rm(list = ls())

#Loading data file
load(".//analysis.rdata")

#results
create_descriptive_stats <- function(df, subject_start, subject_end) {
  
  #check if the data frame has fewer than 10 rows
  if (nrow(df) < 10) {
    stop("Error: data is too short")  
  }
  
  #check if "Subject_ID" column exists
  if (!"Subject_ID" %in% colnames(df)) {
    stop("Error: The data frame must contain a 'Subject_ID' column.")
  }
  
  #subject range
  filtered_df <- df[df$Subject_ID >= subject_start & df$Subject_ID <= subject_end, ]
  
  if (nrow(filtered_df) == 0) {
    stop("Error: No subjects found in the specified range.")
  }
  
  #results list
  results_list <- list()
  
  for (col_name in colnames(filtered_df)) {
    variable <- filtered_df[[col_name]]
    
    #variable type
    if (class(variable) %in% c("numeric", "integer")) {
      stats <- data.frame(
        Variable = col_name,
        Minimum = min(variable, na.rm = TRUE),
        Maximum = max(variable, na.rm = TRUE),
        Mean = mean(variable, na.rm = TRUE),
        Median = median(variable, na.rm = TRUE),
        Std_Dev = sd(variable, na.rm = TRUE),
        Levels = NA  
      )
    } else if (class(variable) %in% c("factor", "character")) {
      levels_counts <- as.data.frame(table(variable))
      levels_summary <- paste0(levels_counts$variable, " (", levels_counts$Freq, ")")
      
      stats <- data.frame(
        Variable = col_name,
        Minimum = NA,  
        Maximum = NA,
        Mean = NA,
        Median = NA,
        Std_Dev = NA,
        Levels = paste(levels_summary, collapse = ", ")
      )
    } else {
      #if the variable type is not supported
      stats <- data.frame(
        Variable = col_name,
        Minimum = NA,
        Maximum = NA,
        Mean = NA,
        Median = NA,
        Std_Dev = NA,
        Levels = "Unsupported variable type"
      )
    }
    
    #add the statistics to the results list
    results_list[[col_name]] <- stats
  }
  
  #combine all statistics into a single data frame
  results <- do.call(rbind, results_list)
  rownames(results) <- NULL
  
  return(results)
}


results <- create_descriptive_stats(analysis, subject_start = 20, subject_end = 50)
print(results)

