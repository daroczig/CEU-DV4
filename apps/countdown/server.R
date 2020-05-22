library(shiny)
library(lubridate)

title <- 'Data Visualization 3'
subtitle <- 'Data Visualization in Production with Shiny'
schedule <- as.POSIXct('2020-05-25 13:30:00')

server <- function(input, output) {
    output$title <- renderText(title)
    output$subtitle <- renderText(subtitle)
    output$countdown <- renderText({
        invalidateLater(500)
        color <- ifelse(schedule > Sys.time(), 'black', 'red')
        as.character(span(
            round(as.period(abs(schedule - Sys.time()))),
            style = paste('color', color, sep = ':')))
    })
}
