library(shiny)
library(shinycssloaders)

fluidPage(

    titlePanel('gGPT'),
    
    textAreaInput('question', 'Hey, what do you want to know about the nycflights dataset?', height = '100px', width = '100%'),
    
    submitButton('Answer my question with a plot!', icon('image')),
    
    tags$br(),
    withSpinner(plotOutput('plot'), caption = 'Generating plot ...'),
    withSpinner(verbatimTextOutput('code'), caption = 'Hitting the OpenAI API for R code ...')

)
