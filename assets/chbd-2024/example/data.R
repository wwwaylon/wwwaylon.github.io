
# Import the .txt file without variable names
data <- read.table("C:/Users/whowar/Desktop/example/DAVIDdata.txt", header = FALSE)

# Add variable names
colnames(data) <- c("ID", "Age", "Age_cat", "Edu", "Marital", "Tspend", 
                    "PTSD_1", "PTSD_2", "PTSD_3", "PTSD_4", "PTSD_5", "PTSD_6", "PTSD_7", "PTSD_8", "PTSD_9", 
                    "PTSD_10", "PTSD_11", "PTSD_12", "PTSD_13", "PTSD_14", "PTSD_15", "PTSD_16", "PTSD_17", 
                    "BCOPE_1", "BCOPE_2", "BCOPE_3", "BCOPE_4", "BCOPE_5", "BCOPE_6", "BCOPE_7", "BCOPE_8", 
                    "BCOPE_9", "BCOPE_10", "BCOPE_11", "BCOPE_12", "BCOPE_13", "BCOPE_14", "BCOPE_15", 
                    "BCOPE_16", "BCOPE_17", "BCOPE_18", "BCOPE_19", "BCOPE_20", "BCOPE_21", "BCOPE_22", 
                    "BCOPE_23", "BCOPE_24", "BCOPE_25", "BCOPE_26", "BCOPE_27", "BCOPE_28", 
                    "SUP_1", "SUP_2", "SUP_3", "SUP_4", "SUP_5", "SUP_6", 
                    "SUP_7", "SUP_8", "SUP_9", "SUP_10", "SUP_11", "SUP_12", 
                    "Afterfin_1", "Before_1", "Rplace", "LReint", 
                    "FS_p1", "FS_p2", "FS_p3", "BC_p1", "BC_p2", "BC_p3", "PT_p1", "PT_p2", "PT_p3")


# Define a vector of selected variable names
selected_vars <- c("ID", "Age", "PTSD_1", "PTSD_2", "PTSD_3", "SUP_6", "SUP_7", "SUP_12", "Rplace")

# Subset the data based on selected variable names
subset_data <- data[, selected_vars]

# Define the old and new variable names
old_names <- c("ID", "Age", "PTSD_1", "PTSD_2", "PTSD_3", "SUP_6", "SUP_7", "SUP_12", "Rplace")
new_names <- c("ID", "Age", "PTSD1", "PTSD2", "PTSD3", "SUP1", "SUP2", "SUP3", "Reint")

# Rename the variables
names(subset_data)[match(old_names, names(subset_data))] <- new_names

subset_data <- subset_data %>%
  filter(!(Reint < 0))

subset_data$Reint = factor(subset_data$Reint-1) 

# Load the mplusautomation package
library(MplusAutomation)

prepareMplusData(subset_data, "C:/Users/whowar/Desktop/example/mydata.dat")

# For R 
write.csv(subset_data, "C:/Users/whowar/Desktop/example/mydata.csv", row.names = FALSE)
# saveRDS(subset_data, "C:/Users/whowar/Desktop/example/mydata.rds")