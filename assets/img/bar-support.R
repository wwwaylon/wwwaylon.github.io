# Load necessary libraries
library(ggplot2)
library(dplyr)

# Example dataset: Replace this with your actual data
data <- data.frame(
  Category = rep(c("A", "B", "C", "D"), each = 3),
  Group = rep(c("Project-based funding", "Temporary flexible funding", "Protected flexible funding"), times = 4),
  Count = c(0, 80, 20, #Y1
            20, 60, 20, #Y2 
            40, 40, 20, 
            60, 20, 20)
)

# Calculate percentages
data <- data %>%
  group_by(Category) %>%
  mutate(Percent = Count / sum(Count) * 100)

# Add new labels
data$newlabel <- c("Year 1", "", "", 
                   "Year 2", "", "",
                   "Year 3", "", "",
                   "Year 4", "", "")

# Reorder the Group factor levels to put "Protected flexible funding" at the bottom
data$Group <- factor(data$Group, levels = c("Project-based funding", "Temporary flexible funding", "Protected flexible funding"))

# Define custom colors
custom_colors <- c("Project-based funding" = "#1f77b4",   # Blue
                   "Temporary flexible funding" = "#ff7f0e", # Orange
                   "Protected flexible funding" = "#2ca02c") # Green

# Plot a stacked bar chart with percentages inside the bars and category labels above the bars
p <- ggplot(data, aes(x = Category, y = Percent, fill = Group)) +
  geom_bar(stat = "identity", position = "stack", color = "black", size = 2.0) +

  geom_text(aes(label = ifelse(Percent == 0, "", paste0(round(Percent, 1), "%"))), 
            position = position_stack(vjust = 0.5), 
            color = "black", size = 7)+

  geom_text(stat = "identity", aes(y = Percent + 2, label = newlabel), # Add category label above bars
            position = position_stack(), color = "black", size = 6.5) + # Adjust text color and size as needed
  
  labs(title = "",
       x = "",  # Remove x-axis title
       fill = "") +  # Remove the legend title by setting it to an empty string
  theme_minimal(base_size = 28) + # Minimal theme with larger font
  theme(axis.title.y = element_blank(),  # Remove y-axis title
        axis.text.y = element_blank(),   # Remove y-axis text
        axis.ticks.y = element_blank(),  # Remove y-axis ticks
        axis.text.x = element_blank(),    # Remove x-axis text
        axis.ticks.x = element_blank(),
        legend.key.size = unit(2, "lines"), 
        panel.grid.major = element_blank(), # Remove major grid lines
        panel.grid.minor = element_blank()  # Remove minor grid lines
  ) +
  scale_fill_manual(values = custom_colors) # Apply custom colors

ggsave("C:/Users/whowar/Documents/GitHub/wwwaylon.github.io/assets/img/bar-support.png", p, width = 10, height = 6, dpi = 300)  
