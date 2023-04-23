library(shiny)

ui <- basicPage(
    h1(uiOutput('title')),
    h2(uiOutput('subtitle')),
    p(uiOutput('countdown'))
)
