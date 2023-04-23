library(shiny)
library(shinyWidgets)
library(lubridate)

server <- function(input, output) {

    settings <- reactiveValues(
        title = 'Data Visualization 4',
        subtitle = 'Data Visualization in Production with Shiny',
        schedule = as.POSIXct('2023-04-24 11:30:00')
    )

    output$title <- renderText(settings$title)
    output$subtitle <- renderText(settings$subtitle)
    output$countdown <- renderText({
        ## need to reset the cached/reactive value so that it gets updated from time to time,
        ## as there's no external dependency triggering changes here (e.g. an input change)
        ## that would automatically update this object to reactive
        invalidateLater(250)
        color <- ifelse(settings$schedule > Sys.time(), 'black', 'red')
        as.character(span(
            round(as.period(abs(settings$schedule - Sys.time()))),
            style = paste('color', color, sep = ':')))
    })
    output$start <- renderText({
        paste('at', settings$schedule, Sys.timezone())
    })

    observeEvent(input$settings_show, {
        showModal(
            modalDialog(
                textInput("title", "Title", value = settings$title),
                textInput("subtitle", "Subtitle", value = settings$subtitle),
                airDatepickerInput("schedule", "Time", value = settings$schedule, timepicker = TRUE),
                footer = tagList(actionButton('settings_update', 'Update'))
            )
        )
    })
    observeEvent(input$settings_update, {
        settings$title <- input$title
        settings$subtitle <- input$subtitle
        settings$schedule <- as.POSIXct(input$schedule)
        removeModal()
    })

}
