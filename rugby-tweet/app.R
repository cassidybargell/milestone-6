#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
    
    # Application title
    
    titlePanel("Rugby Data"),
    
    mainPanel( 
        imageOutput("USplot")
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$USplot <- renderImage({
        
        list(src = "us_plot.png",
             contentType = 'image/png', 
             width = 700, 
             height = 500)
    }, deleteFile = FALSE)
}

# Run the application 
shinyApp(ui = ui, server = server)

