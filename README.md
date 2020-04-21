This is the R script/materials repository of the "[Data Visualization 3: Data Visualization in Production with Shiny](https://courses.ceu.edu/courses/2019-2020/data-visualization-3-data-visualization-production-shiny)" course in the 2019/2020 Spring term, part of the [MSc in Business Analytics](https://courses.ceu.edu/programs/ms/master-science-business-analytics) at CEU.

## Table of Contents

* [Syllabus](#syllabus)
* [Schedule](#schedule)
   * [Week 1](#week-1)
   * [Week 2](#week-2)
* [Home Assignment](#home-assignment)

## Syllabus

Please find in the `syllabus` folder of this repository.

## Schedule

2 x 300 mins on April 14 and May 25, 2020.

### Week 1

Introduction to Shiny by Mihaly Orsos: https://github.com/misrori/CEU-Dataviz-3

### Week 2

To be upoaded.

## Home Assignment

Create and deploy a Shiny application as described below. You can use any dataset you like. If you have no ideas on what data source(s) to use, check the below ideas. In any question, reach out on Slack or open a GitHub ticket.

For Pass:

* You need to create a Shiny application with `shinydashboard` layout using a sidebar menu
* Write at least one helper function and put into the `global.R` file to make it accessible for both `ui.R` and `server.R`
* Add at least 3 input elements using at least 2 different methods (eg dropdown, slider, checkbox)
* Add at least 4 different UI elements (eg text, table, map, UI, info and valueboxes)
* Use at least 3 menu items
* Use `reactive` values
* The change of the input elements have to change the UI elements showed to the user
* Deploy the app into shinyapps.io, upload the code into Moodle with a reference to your shinyapps.io application

For Grade:

* Implement the application described in the above steps
* Add Google Analytics tracking to your application
* Deploy the app via shinyproxy (covered on the second day of the course)

Some ideas for data source:

* `nycflights13` package
* https://github.com/rfordatascience/tidytuesday/
* https://www.kaggle.com/datasets
