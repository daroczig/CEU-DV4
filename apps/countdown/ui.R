library(shiny)
library(particlesjs)

ui <- basicPage(

    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "app.css")
    ),

    particles(),
    actionButton('settings_show', 'Settings'),
    div(
        h1(uiOutput('title')),
        h2(uiOutput('subtitle')),
        h3('starts in'),
        h1(tags$b(uiOutput('countdown'))),
        h4(uiOutput('start')),
        class = 'center')

)
