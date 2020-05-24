library(shiny)
library(shinyWidgets)
library(lubridate)

server <- function(input, output, session) {

    settings <- reactiveValues(
        title = 'Data Visualization 3',
        subtitle = 'Data Visualization in Production with Shiny',
        schedule = as.POSIXct('2020-05-25 13:30:00')
    )

    output$countdown <- renderUI({
        invalidateLater(500)
        color <- ifelse(settings$schedule > Sys.time(), 'black', 'red')
        remaining <- span(
            round(as.period(abs(settings$schedule - Sys.time()))),
            style = paste('color', color, sep = ':'))
        div(
            h1(settings$title),
            h2(settings$subtitle),
            h3('starts in'),
            h1(tags$b(remaining)),
            h4(paste('at', settings$schedule, Sys.timezone())),
            class = 'center')
    })

    ## load settings from URL query params
    observe({
        query <- parseQueryString(session$clientData$url_search)
        for (v in c('title', 'subtitle', 'schedule')) {
            if (!is.null(query[[v]])) {
                settings$title <- query[[v]]
            }
        }
    })

    ## override settings from modal
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
