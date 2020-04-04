#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(shinythemes)

# Create variables for ggplot 

rugby_merged <- read_rds("rugby_merged.RDS")



ui <- navbarPage(
    "Rugby Perceptions",
    theme = shinytheme("darkly"), 
    
    #### ABOUT
    
    tabPanel("About", 
             
             # title and subtitle
    
    h2("What is the perception of rugby through the United States?", align = "center"),
    h4(em("How does that compare to the rest of the world?"), align = "center"),
    br(),
    div(),
    
    
    br(),
    
    fluidRow(column(2), column(11,
                               
                               h4(strong("About this Project")),          
                               
                               #text to introduce project
                               
                               p("The aim of my project is to ... "),
                               
                               br(),
                               
                               
    ))),
    
    #### DATA
    
    tabPanel("Graphics",
             tabPanel("Graphics",
                      h3("First Plot:"),
                      plotOutput("plot_rgsearch"),
             )),
    
    #### FOOTNOTES
    
    
    # Where I got data
    
    tabPanel("Footnotes",
             
             
             h4("References"),
             br(),
             
             p("I got my data from ... "),
             p("github link ... ")
    ))
    



server <- function(input, output) {
    
    #### DATA
    
    output$plot_rgsearch <- renderPlot({
        ggplot(rugby_merged, aes(x = long, y = lat)) +
            geom_polygon(aes(group = group, 
                             fill = log(hits)), 
                         colour = "white") +
            scale_fill_viridis_c(option = "plasma",
                                 direction = -1) +
            theme_minimal() + 
            labs(title = "Google Search Hits for 'Rugby' Since 2004", 
                 subtitle = "Search Hits Normalized to Compare Relative Popularity",
                 caption = "Google Trends: Search results are normalized to the time and
       location of a query. Each data point is divided by the total searches of
       the geography and time range it represents to compare relative popularity.") +
            theme(axis.title = element_blank()) +
            theme(axis.text = element_blank()) +
            theme(axis.ticks = element_blank()) + 
            theme(legend.title = element_blank()) +
            theme(panel.grid.major = element_blank())
        
    })

}

# Run the application 
shinyApp(ui = ui, server = server)

