library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel ("Variables to House Price in Millburn"),
  
  sidebarPanel(
    selectInput( "variable", "First Variable:",
                 list("Original Listing Price" = "olp",
                      "Selling Price" = "sp",
                      "Days on Market" = "dom",
                      "Number of Rooms" = "Rooms",
                      "Number of Beds"= "Beds",
                      "Number of Baths"="Baths")),
    
    selectizeInput("variable2", "Second variable:",
                   list("Original Listing Price" = "olp",
                        "Selling Price" = "sp",
                        "Days on Market" = "dom",
                        "Number of Rooms" = "Rooms",
                        "Number of Beds"= "Beds",
                        "Number of Baths"="Baths"))
    
  ),
  
  mainPanel(
    h3(textOutput("caption")),
  plotOutput("plot")
  )
))