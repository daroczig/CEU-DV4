library(shiny)
library(shinyWidgets)
library(lubridate)

server <- function(input, output, session) {

    settings <- reactiveValues(
        title = 'Data Visualization 3',
        subtitle = 'Data Visualization in Production with Shiny',
        schedule = as.POSIXct('2020-05-25 13:30:00')
    )

    observe({
        query <- parseQueryString(session$clientData$url_search)
        for (v in c('title', 'subtitle', 'schedule')) {
            if (!is.null(query[[v]])) {
                settings$title <- query[[v]]
            }
        }
    })

    output$title <- renderText(settings$title)
    output$subtitle <- renderText(settings$subtitle)
    output$start <- renderText({
        paste('at', settings$schedule, Sys.timezone())
    })
    output$countdown <- renderText({
        invalidateLater(500)
        color <- ifelse(settings$schedule > Sys.time(), 'black', 'red')
        as.character(span(
            round(as.period(abs(settings$schedule - Sys.time()))),
            style = paste('color', color, sep = ':')))
    })

    observeEvent(input$settings_show, {
        showModal(modalDialog(
            textInput("title", "Title", value = settings$title),
            textInput("subtitle", "Subtitle", value = settings$subtitle),
            airDatepickerInput("schedule", "Time", value = settings$schedule, timepicker = TRUE),
            footer = tagList(actionButton('settings_update', 'Update'))
        ))
    })
    observeEvent(input$settings_update, {
        settings$title <- input$title
        settings$subtitle <- input$subtitle
        settings$schedule <- as.POSIXct(input$schedule)
        removeModal()
    })

}
