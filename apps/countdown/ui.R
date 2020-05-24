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
    div(
        h1(uiOutput('title')),
        h2(uiOutput('subtitle')),
        h3('starts in'),
        h1(tags$b(uiOutput('countdown'))),
        h4(uiOutput('start')),
        class = 'center')

)
