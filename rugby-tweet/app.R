#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

ui <- fluidPage(
    
    # Application title
    
    titlePanel("Rugby Data"),
    
    mainPanel( 
        imageOutput("USplot")
    )
)

server <- function(input, output) {

    output$USplot <- renderImage({
        
        list(src = "us_plot.png",
             contentType = 'image/png', 
             width = 710, 
             height = 500)
    }, deleteFile = FALSE)
}

# Run the application 
shinyApp(ui = ui, server = server)

