library(shiny)

title <- 'Data Visualization 4'
subtitle <- 'Data Visualization in Production with Shiny'

server <- function(input, output) {
    output$title <- renderText(title)
    output$subtitle <- renderText(subtitle)
    output$countdown <- renderText({
        ## need to reset the cached/reactive value so that it gets updated from time to time,
        ## as there's no external dependency triggering changes here (e.g. an input change)
        ## that would automatically update this object to reactive
        invalidateLater(250)
        Sys.time()
    })
}
