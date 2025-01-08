# R course for beginners
# Week 9
# assignment by Tamari Geron, id 314833195


### ANALYSIS ###

#generate vectors
N = 100
Subject_ID     = seq(1, N, 1)
gender      = factor(c('female', 'male'))
age         = runif(N, 18, 60)  
response_time = sample(200:6000, N, replace = TRUE)
depression = sample(0:100, N, replace = TRUE)
sleep_hours = runif(N, min = 2, max = 12)

#add to data.frame
analysis <- data.frame(Subject_ID, gender, age, depression, response_time, sleep_hours)
print(analysis)

#save file
save(analysis, file = ".//analysis.rdata")

#source function
source("functions.R")
results = create_descriptive_stats(analysis, subject_start = 20, subject_end = 50)
print(results)
