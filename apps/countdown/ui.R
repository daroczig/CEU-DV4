library(shiny)
library(particlesjs)

ui <- fluidPage(
    particles(),
    h1(uiOutput('title')),
    h2(uiOutput('subtitle')),
    p(uiOutput('countdown'))
)
