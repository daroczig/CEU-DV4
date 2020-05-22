library(shiny)

ui <- fluidPage(
    h1(uiOutput('title')),
    h2(uiOutput('subtitle'))
)
