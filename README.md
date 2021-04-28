This is the R script/materials repository of the "[Data Visualization 4: Data Visualization in Production with Shiny](https://courses.ceu.edu/courses/2020-2021/data-visualization-4-data-visualization-production-shiny)" course in the 2019/2020 Spring term, part of the [MSc in Business Analytics](https://courses.ceu.edu/programs/ms/master-science-business-analytics) at CEU. For the previous edition, see [2019/2020 Spring](https://github.com/daroczig/CEU-DV3/tree/2019-2020).

## Table of Contents

* [Syllabus](#syllabus)
* [Schedule](#schedule)
   * [Day 1-2](#day-1-2)
   * [Day 3](#day-3)
   * [Day 4](#day-4)
* [Home Assignment](#home-assignment)
* [Contact](#contacts)

## Syllabus

Please find in the `syllabus` folder of this repository.

## Schedule

4 x 150 mins between April 26 - 29, 2021.

### Day 1-2

Introduction to Shiny by Mihaly Orsos: https://github.com/misrori/CEU-DV-4-2020

### Day 3

Overview on the previous week's materials by Mihaly Orsos:

* basics of `ui.R` and `server.R`
* HTML tags
* reactive functions
* action button
* `renderUI`
* UI layouts
  * basic UI elements
  * Shiny themes
  * `shinydashboard`
* Password-protected applications
* Google Analytics

#### Countdown-timer app

This week, we build a countdown timer app, similar to http://count-down-timer.tk

[...]

Future content to be uploaded later.

## Suggested Reading

* Hadley Wickham (2021): Mastering Shiny. https://mastering-shiny.org/
* Business Science (2020): The Shiny AWS Book. https://business-science.github.io/shiny-production-with-aws-book/

## Home Assignment

Create and deploy a Shiny application as described below. You can use any dataset you like. If you have no ideas on what data source(s) to use, check the below ideas. In any question, reach out on Slack or open a GitHub ticket.

For Pass:

* You need to create a Shiny application with `shinydashboard` layout using a sidebar menu
* Write at least one helper function and put into the `global.R` file to make it accessible for both `ui.R` and `server.R`
* Add at least 3 input elements using at least 2 different methods (eg dropdown, slider, checkbox)
* Add at least 3 different UI elements (eg text, table, map, UI, info and valueboxes)
* Use at least 2 menu items
* Use `reactive` values
* The change of the input elements have to change the UI elements showed to the user
* Deploy the app into shinyapps.io, upload the code into Moodle with a reference to your shinyapps.io application

For Grade:

* Implement the application described in the above steps
* Add at least 5 different UI elements, including one from htmlwidgets.org
* Use at least 3 menu items
* Add Google Analytics tracking to your application
* Deploy the app via shinyproxy (covered on the second day of the course)

Some ideas for data source:

* `nycflights13` package
* https://github.com/rfordatascience/tidytuesday/
* https://www.kaggle.com/datasets

Deadline: May 20, 2021

## Contact

File a [GitHub ticket](https://github.com/daroczig/CEU-DV3/issues).
