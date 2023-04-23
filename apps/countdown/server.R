library(shiny)
library(lubridate)

title <- 'Data Visualization 4'
subtitle <- 'Data Visualization in Production with Shiny'
schedule <- as.POSIXct('2023-04-24 11:30:00')

server <- function(input, output) {
    output$title <- renderText(title)
    output$subtitle <- renderText(subtitle)
    output$countdown <- renderText({
        ## need to reset the cached/reactive value so that it gets updated from time to time,
        ## as there's no external dependency triggering changes here (e.g. an input change)
        ## that would automatically update this object to reactive
        invalidateLater(250)
        color <- ifelse(schedule > Sys.time(), 'black', 'red')
        as.character(span(
            round(as.period(abs(schedule - Sys.time()))),
            style = paste('color', color, sep = ':')))
    })
    output$start <- renderText({
        paste('at', schedule, Sys.timezone())
    })
}
