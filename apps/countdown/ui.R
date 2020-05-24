library(shiny)
library(shinyWidgets)
library(particlesjs)

ui <- basicPage(

    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "app.css")
    ),
    uiOutput('app')

)
