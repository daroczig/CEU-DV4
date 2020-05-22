library(shiny)

title <- 'Data Visualization 3'
subtitle <- 'Data Visualization in Production with Shiny'


server <- function(input, output) {
    output$title <- renderText(title)
    output$subtitle <- renderText(subtitle)
    output$countdown <- renderText({
        invalidateLater(250)
        Sys.time()
    })
}
