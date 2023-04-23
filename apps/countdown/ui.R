library(shiny)
library(particlesjs)

ui <- basicPage(

    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "app.css")
    ),
    particles(),

    div(
        h1(uiOutput('title')),
        h2(uiOutput('subtitle')),
        h1(uiOutput('countdown')),
        class = 'center')

)
