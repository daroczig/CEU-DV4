library(shiny)
library(particlesjs)

ui <- fluidPage(

    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "app.css")
    ),

    particles(),
    div(
        h1(uiOutput('title')),
        h2(uiOutput('subtitle')),
        h3('starts in'),
        h1(tags$b(uiOutput('countdown'))),
        h4(uiOutput('start')),
        class = 'center')

)
