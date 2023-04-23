This is the R script/materials repository of the "[Data Visualization 4: Data Visualization in Production with Shiny](https://courses.ceu.edu/courses/2021-2022/data-visualization-4-data-visualization-production-shiny)" course in the 2021/2022 Spring term, part of the [MSc in Business Analytics](https://courses.ceu.edu/programs/ms/master-science-business-analytics) at CEU. For the previous edition, see [2019/2020 Spring](https://github.com/daroczig/CEU-DV3/tree/2019/2020), [2020/2021 Spring](https://github.com/daroczig/CEU-DV3/tree/2020/2021), and [2021/2022 Spring](https://github.com/daroczig/CEU-DV3/tree/2021/2022).

## Table of Contents

* [Syllabus](#syllabus)
* [Schedule](#schedule)
* [Contact](#contacts)

## Syllabus

Please find in the `syllabus` folder of this repository.

## Technical Prerequisites

1. You need a laptop with any operating system and stable Internet connection.
2. Either install [R](https://cran.r-project.org) and [RStudio Desktop (open-source)](https://www.rstudio.com/products/rstudio/download) on your laptop, or use the shared RStudio Server already configured with all required software.
3. Install Slack, and join the #﻿ba-dv4-2022 channel in the `ceu-bizanalytics` group.

<details><summary>💪 RStudio Server installation steps</summary>

Follow steps from the [DE3 class](https://github.com/daroczig/CEU-R-prod), then:

```
sudo apt install -y r-cran-shinywidgets
sudo Rscript -e "library(devtools);withr::with_libpaths(new = '/usr/local/lib/R/site-library', install_github('dreamRs/particlesjs', upgrade = FALSE))"
```

</details>


## Schedule

300 mins on April 24, 2023:

* 13:30 - 15:10 session 1
* 15:10 - 15:40 break
* 15:40 - 17:20 session 2
* 17:20 - 17:40 break
* 17:40 - 19:20 session 3

150 mins on May 8 and 15, 2023:

* 13:30 - 15:00 session 1
* 15:00 - 15:15 break
* 15:15 - 16:15 session 2

## Suggested Reading

* Hadley Wickham (2021): Mastering Shiny. https://mastering-shiny.org/
* Business Science (2020): The Shiny AWS Book. https://business-science.github.io/shiny-production-with-aws-book/

## Home Assignment

To be uploaded.

## Contact

File a [GitHub ticket](https://github.com/daroczig/CEU-DV4/issues).
