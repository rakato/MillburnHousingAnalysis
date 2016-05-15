library(shiny)
library(datasets)
library(ggplot2)

data <- homes

# Define server logic required to plot variables
shinyServer(function(input, output) {
  
  # Create a reactive text
  text <- reactive({
    paste(input$variable, 'versus', input$variable2)
  })
  
  # Return as text the selected variables
  output$caption <- renderText({
    text()
  })
  
  # Generate a plot of the requested variables
  output$plot <- renderPlot({
    p <- ggplot(data, aes_string(x=input$variable, y=input$variable2)) + geom_point()+scale_x_continuous(labels=comma)+scale_y_continuous(labels=comma)

    print(p)
  })
})
