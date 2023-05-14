library(shiny)
library(shinycssloaders)

library(markdown)
library(chatgpt)
Sys.setenv(OPENAI_API_KEY = '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')

## chatgpt often forgets to load this pkg
library(nycflights13)
library(dplyr)

prompt <- "You are a data scientist using R to analyze data on the airline on-time data for all flights departing NYC in 2013 from the `nycflights13` R package, which provides the following datasets loaded:

The `airlines` dataset: Look up airline names from their carrier codes.
Data frame with columns:
- carrier Two letter abbreviation.
- name Full name.

The `airports` dataset: Useful metadata about airports.
A data frame with columns:
- faa FAA airport code.
- name Usual name of the aiport.
- lat, lon Location of airport.
- alt Altitude, in feet

The `flights` dataset: On-time data for all flights that departed NYC (i.e. JFK, LGA or EWR) in 2013.
Data frame with columns:
- year, month, day Date of departure.
- dep_time, arr_time Actual departure and arrival times (format HHMM or HMM), local tz.
- sched_dep_time, sched_arr_time Scheduled departure and arrival times (format HHMM or HMM),
local tz.
- dep_delay, arr_delay Departure and arrival delays, in minutes. Negative times represent early
departures/arrivals.
- carrier Two letter carrier abbreviation. See airlines to get name.
- flight Flight number.
- tailnum Plane tail number. See planes for additional metadata.
- origin, dest Origin and destination. See airports for additional metadata.
- air_time Amount of time spent in the air, in minutes.
- distance Distance between airports, in miles.
- hour, minute Time of scheduled departure broken into hour and minutes.

Do not forget to load the used packages.
I want you to only reply with the R code inside one unique code block, and nothing else.
Do not write explanations. Do not type commands unless I instruct you to do so. 

Provide the R code using ggplot2 to visualize:"

function(input, output, session) {
  
  question <- reactive({
    validate(need(input$question != '', ''))
    paste(prompt, input$question)
  })
  
  code <- reactive({
    
    reset_chat_session()
    res <- ask_chatgpt(question())

    ## drop backtick fence around R code (cannot get ChatGPT do it)
    gsub('(^```\\{?[rR]?\\}?)|(```$)','', res)
    
  })

  output$code <- renderText(code())
  output$plot <- renderPlot(eval(parse(text = code())))

}
