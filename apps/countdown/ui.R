library(shiny)
library(shinyWidgets)
library(particlesjs)

ui <- basicPage(

    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "app.css")
    ),

    particles(),
    actionBttn('settings_show', 'Settings',
               icon = icon('gear'),
               style = 'material-circle'),
    uiOutput('countdown')

)
