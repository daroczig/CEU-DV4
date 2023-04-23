library(shiny)

title <- 'Data Visualization 4'
subtitle <- 'Data Visualization in Production with Shiny'

server <- function(input, output) {
    output$title <- renderText(title)
    output$subtitle <- renderText(subtitle)
    output$countdown <- renderText(Sys.time())
}
