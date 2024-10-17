# Load the necessary libraries
library(shiny)
library(shinythemes)

# Define the UI for the application
ui <- fluidPage(
  theme = shinytheme("cerulean"),  # Set a theme for the app
  
  titlePanel("Biostatistics Support Wait Time to Start"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("priority", "Select Issue Priority:", 
                  choices = c("High", "Medium", "Low"),
                  selected = "Medium"),
      numericInput("resolve_time", 
                   "Estimated Time to Resolve (hours):", 
                   value = 40, min = 0.1, step = 0.1),  # Changed to hours
      numericInput("queue_length", 
                   HTML("Current Queue Length<br>(number of projects):"), 
                   value = 5, min = 0),
      textInput("avg_time",
                HTML("Average Time to Complete<br>(comma-separated hours):"),
                value = "10,10,10,10,10"),  # Default input for average times
      numericInput("flex_percentage", 
                   HTML("Flex Time Percentage<br>(e.g., 20 for 80% FTE):"),
                   value = 20, min = 0, max = 100),  # New input for flex percentage
      actionButton("calculate", "Calculate Wait Time", class = "btn-primary")  # Styled button
    ),
    
    mainPanel(
      h3("Estimated Wait Time:"),
      verbatimTextOutput("wait_time", placeholder = TRUE),
      tags$style(HTML("
        .shiny-input-container { margin-bottom: 15px; }  /* Space between input fields */
        .btn-primary { font-size: 18px; }  /* Button font size */
        h3 { color: #2c3e50; }  /* Header color */
      "))
    )
  )
)

# Define the server logic
server <- function(input, output) {
  
  observeEvent(input$calculate, {
    
    # Define wait time multiplier based on priority
    wait_time_multiplier <- switch(input$priority,
                                   "High" = 1,   # 1x for High priority
                                   "Medium" = 2, # 2x for Medium priority
                                   "Low" = 3)    # 3x for Low priority
    
    # Determine FTE factor based on flex percentage selection
    fte_factor <- 1 - (input$flex_percentage / 100)
    
    # Get average times from the text input, split by commas, and convert to numeric
    avg_times <- as.numeric(unlist(strsplit(input$avg_time, ",")))
    
    # If the number of provided average times is less than the queue length, fill with zero
    if (length(avg_times) < input$queue_length) {
      avg_times <- c(avg_times, rep(0, input$queue_length - length(avg_times)))
    } else if (length(avg_times) > input$queue_length) {
      avg_times <- avg_times[1:input$queue_length]  # Truncate if more values are provided
    }
    
    # Calculate the total time from the average times
    total_avg_time <- sum(avg_times)
    
    # Calculate effective queue length based on average time to complete current projects
    effective_queue_length <- input$queue_length + (total_avg_time * 60 / (input$resolve_time * 60 * fte_factor))
    
    # Convert hours to minutes and apply FTE factor
    estimated_wait_time_minutes <- effective_queue_length * (input$resolve_time * 60 * wait_time_multiplier * fte_factor)
    
    # Convert minutes to days
    estimated_wait_time_days <- estimated_wait_time_minutes / 1440  # 1 day = 1440 minutes
    
    # Display the wait time in days
    output$wait_time <- renderText({
      paste("Your estimated wait time is", round(estimated_wait_time_days, 2), "days.")
    })
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
