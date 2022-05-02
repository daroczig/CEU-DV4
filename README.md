This is the R script/materials repository of the "[Data Visualization 4: Data Visualization in Production with Shiny](https://courses.ceu.edu/courses/2021-2022/data-visualization-4-data-visualization-production-shiny)" course in the 2021/2022 Spring term, part of the [MSc in Business Analytics](https://courses.ceu.edu/programs/ms/master-science-business-analytics) at CEU. For the previous edition, see [2019/2020 Spring](https://github.com/daroczig/CEU-DV3/tree/2019-2020) and [2020/2021 Spring](https://github.com/daroczig/CEU-DV3/tree/2020-2021).

## Table of Contents

* [Syllabus](#syllabus)
* [Schedule](#schedule)
   * [Day 1](#day-1)
   * [Day 2](#day-2)
* [Home Assignment](#home-assignment)
* [Contact](#contacts)

## Syllabus

Please find in the `syllabus` folder of this repository.

## Schedule

2 x 2 x 150 mins between on April 20 and May 2, 2022.

### Day 1

Introduction to Shiny by Mihaly Orsos: https://github.com/misrori/DV4

### Day 2

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
* Lottery app

#### Countdown-timer app

This week, we build a countdown timer app, similar to http://count-down-timer.tk, and deploy using ShinyProxy.io

1. App wireframe with a static UI:

    <details><summary>ui.R</summary>

    ```r
    library(shiny)

    ui <- fluidPage(
        h1('Data Visualization 4'),
        h2('Data Visualization in Production with Shiny')
    )
    ```
    </details>

    <details><summary>server.R</summary>

    ```r
    library(shiny)
    server <- function(input, output) {

    }
    ```
    </details>

2. Move content generation to the backend: [f0b53ee](https://github.com/daroczig/CEU-DV3/commit/f0b53ee0da9a816a44448ab8f170c5ca7d46e2f2)

3. Add current time (to be later used as the baseline for the countdown timer): [5dd6724](https://github.com/daroczig/CEU-DV3/commit/5dd67247fdf3a53312737057273c31fb1dbe11a8)

4. Actual countdown from the scheduled time: [5f91927](https://github.com/daroczig/CEU-DV3/commit/5f9192722314771e8898a4b1a800c8d9ef62a896)

5. Add background: [79fbe20](https://github.com/daroczig/CEU-DV3/commit/79fbe20aceb6234a563dea76eb95a19eca7fbc02)


6. CSS tweaks to center the timer: [d1df52d](https://github.com/daroczig/CEU-DV3/commit/d1df52d999ae70b4e6eac76270646733b2bc1529)

7. Colorize timer when scheduled time is due: [b74aead](https://github.com/daroczig/CEU-DV3/commit/b74aead0493ee094515d1741e58cc536f026261e)

8. Show time-zone information: [c23d1fe](https://github.com/daroczig/CEU-DV3/commit/c23d1fe3013a04d78636c658bd965199e52bb0dd)

9. Move defaults to reactive values and let user updated via a modal window at [d9cfb6c](https://github.com/daroczig/CEU-DV3/commit/d9cfb6c0121bd2a721440e6f33570c28633580d3) and get rid of the `settingsModal` function and just pass the `modalDialog` to `showModal`: [acb815d](https://github.com/daroczig/CEU-DV3/commit/acb815db0ea3c6d9b2510927a407b738ff1e87c0#diff-f2a835a7de5549894c0b86022978173cL25)

11. Add time picker for the scheduled time: [acb815d](https://github.com/daroczig/CEU-DV3/commit/acb815db0ea3c6d9b2510927a407b738ff1e87c0#diff-f2a835a7de5549894c0b86022978173cL29)

12. Better design for the settings button: [4b6e7e3..d0efbe7](https://github.com/daroczig/CEU-DV3/compare/acb815d..d0efbe7)

13. Pass settings as URL parameters: [dbb3ed8](https://github.com/daroczig/CEU-DV3/commit/dbb3ed816d0994e7abe447ba806af8c241ee9dfc)

14. Simplify `ui.R` by a single call to `renderUI`: [2d468e7](https://github.com/daroczig/CEU-DV3/commit/2d468e706285724f5355319d64ad8da52e9ec2ed)

15. Fix subtitle and schedule settings update: [b416dd5](https://github.com/daroczig/CEU-DV3/commit/b416dd5903ec0bf299dd2aa656e3fa5ff37ed972)

16. Add support for timezone setting: [8a9be0e](https://github.com/daroczig/CEU-DV3/commit/8a9be0e32cd829941d8bbeb8a85259f5d1089b48)

17. Ask for consent before using the app: [798dd68](https://github.com/daroczig/CEU-DV3/commit/798dd68b66ba22569a292720188bf9ff0711cb0d)

Final app:

<details><summary>ui.R</summary>

```r
library(shiny)
library(shinyWidgets)
library(particlesjs)

ui <- basicPage(

    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "app.css")
    ),
    uiOutput('app')

)
```
</details>

<details><summary>www/app.css</summary>

```css
.center {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    background-color: #00000042;
    padding: 25px 50px;
    border-radius: 25px;
}

.datepicker{
    z-index:1151 !important;
}

#settings_show {
    position: absolute;
    top: 25px;
    right: 25px;
    color: black;
}
```
</details>

<details><summary>server.R</summary>

```r
library(shiny)
library(shinyWidgets)
library(lubridate)

server <- function(input, output, session) {

    settings <- reactiveValues(
        title = 'Data Visualization 4',
        subtitle = 'Data Visualization in Production with Shiny',
        schedule = '2022-05-02 13:30:00',
        timezone = Sys.timezone()
    )

    output$countdown <- renderUI({
        invalidateLater(500)
        schedule <- ymd_hms(settings$schedule, tz = settings$timezone)
        color <- ifelse(schedule > Sys.time(), 'black', 'red')
        remaining <- span(
            round(as.period(abs(schedule - Sys.time()))),
            style = paste('color', color, sep = ':'))
        div(
            h1(settings$title),
            h2(settings$subtitle),
            h3('starts in'),
            h1(tags$b(remaining)),
            h4(paste('at', settings$schedule, settings$timezone)),
            class = 'center')
    })

    ## load settings from URL query params
    observe({
        query <- parseQueryString(session$clientData$url_search)
        for (v in c('title', 'subtitle', 'schedule', 'timezone')) {
            if (!is.null(query[[v]])) {
                settings[[v]] <- query[[v]]
            }
        }
    })

    ## override settings from modal
    observeEvent(input$settings_show, {
        showModal(modalDialog(
            textInput(
                'title', 'Title',
                value = settings$title),
            textInput(
                'subtitle', 'Subtitle',
                value = settings$subtitle),
            airDatepickerInput(
                'schedule', 'Time',
                value = as.POSIXct(settings$schedule),
                timepicker = TRUE),
            selectInput(
                'timezone', 'Timezone',
                choices = OlsonNames(),
                selected = settings$timezone),
            footer = tagList(actionButton('settings_update', 'Update'))
        ))
    })
    observeEvent(input$settings_update, {
        settings$title <- input$title
        settings$subtitle <- input$subtitle
        settings$schedule <- input$schedule
        settings$timezone <- input$timezone
        removeModal()
    })

    ## gdpr
    showModal(modalDialog(
        p('Click the below button you consent to ...'),
        footer = tagList(actionButton('consent', 'OK'))
    ))
    observeEvent(input$consent, {
        output$app <- renderUI({
            list(
                particles(),
                actionBttn('settings_show', 'Settings',
                           icon = icon('gear'),
                           style = 'material-circle'),
                uiOutput('countdown')
            )
        })
        removeModal()
    })

}
```
</details>

Further ideas to improve the app:

- get timezone from visitor's browser setting / locale
- configure theme (colors, layout, background etc)
- ads!!!

##### Shiny Server

1. 💪 Install R packages as a system user:

        ## install as a binary when possible
        sudo apt-get install r-cran-dplyr r-cran-quantmod r-cran-xml r-cran-tidyr r-cran-igraph r-cran-lubridate r-cran-psych r-cran-broom r-cran-yaml r-cran-htmlwidgets r-cran-shiny

        ## install from CRAN when binary is not available
        sudo R -e "withr::with_libpaths(new = '/usr/local/lib/R/site-library', install.packages(c('highcharter', 'shinyWidgets'), repos='https://cran.rstudio.com/'))"

        ## some R packages are not even on CRAN, so let's install from GitHub
        sudo Rscript -e "library(devtools);withr::with_libpaths(new = '/usr/local/lib/R/site-library', install_github('dreamRs/particlesjs', upgrade_dependencies = FALSE))"

2. 💪 Install Shiny Server from https://rstudio.com/products/shiny/download-server/ubuntu/:

        sudo apt-get install gdebi-core
        wget https://download3.rstudio.org/ubuntu-18.04/x86_64/shiny-server-1.5.18.987-amd64.deb
        sudo gdebi shiny-server-1.5.18.987-amd64.deb

3. 💪 Edit `site_dir` in `shiny-server.conf` to point to the `/home/ceu` folder via

        sudo mcedit /etc/shiny-server/shiny-server.conf
        sudo systemctl restart shiny-server

4. Visit Shiny Server on port 3838 from your browser

    ![](https://raw.githubusercontent.com/daroczig/CEU-R-prod/2018-2019/images/shiny-server.png)

5. 💪 Always keep logs -- set this in the Shiny Server config & restart service as per https://docs.rstudio.com/shiny-server/#logging-and-analytics:

        preserve_logs true;

    Optionally, redirect all logs to the same file by injecting an environment variable in `/etc/systemd/system/shiny-server.service` by adding this line below the other `Environment=` line:

        Environment="SHINY_LOG_STDERR=1"

6. To keep an eye on logs (test with making a typo in the app on purpose):

        sudo tail -f /var/log/shiny-server.log

7. Add `ui.R` and `server.R` files (along with `global.R` and other stuff in the `www` folder) to directories created in `/home/ceu`

Note, that Shiny Server has some limitations (eg scaling to multiple users, some headers removed by the Node.js wrapper) -- so you might consider either the Pro version, other RStudio products or eg the below-mentioned Shiny app manager daemon for using Shiny in production at scale.

8. 💪 Run behind a proxy to be able to access on the standard HTTP port:

    ```sh
    http {

      map $http_upgrade $connection_upgrade {
        default upgrade;
        ''      close;
      }

      server {
        listen 80;

        rewrite ^/shiny$ $scheme://$http_host/shiny/ permanent;
        location /shiny/ {
          rewrite ^/shiny/(.*)$ /$1 break;
          proxy_pass http://localhost:3838;
          proxy_redirect / $scheme://$http_host/shiny/;
          proxy_http_version 1.1;
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection $connection_upgrade;
          proxy_read_timeout 20d;
          proxy_buffering off;
        }
      }
    }
    ```

**The above steps can be covered by starting a new `t3.micro` instance using the `dv4` AMI and `dv4` security group.**

##### Shinyproxy.io

0. Get familiar with Docker:

    - ["Dockerizing R scripts"](https://github.com/daroczig/CEU-R-prod#dockerizing-r-scripts) at the "Data Engineering 4: Using R in Production" class
    - [rOpenSci Docker tutorial](https://ropenscilabs.github.io/r-docker-tutorial)

1. 💪 Install Docker

    ```sh
    ## get dependencies
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

    ## import Docker's official GPG key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    ## add the external, official Docker apt repo for most recent release
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

    ## download list of available packages and install Docker
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    ```

2. Test Docker

    ```sh
    sudo docker run --rm hello-world
    sudo docker image rm hello-world
    ```

3. 💪 ShinyProxy needs to connect to the Docker daemon, so let's open up a port for that

    * check `/etc/systemd/system/docker.service.d/override.conf` eg via `sudo mcedit` and paste the below content if not already there

        ```sh
        [Service]
        ExecStart=
        ExecStart=/usr/bin/dockerd -H unix:// -D -H tcp://127.0.0.1:2375
        ```

    * restart Docker

        ```sh
        sudo systemctl daemon-reload
        sudo systemctl restart docker
        ```

4. 💪 Make sure Java is installed:

    ```sh
    sudo apt install -y openjdk-8-jdk-headless
    ```

5. 💪 Install ShinyProxy

    ```sh
    wget -O /tmp/shinyproxy.deb https://www.shinyproxy.io/downloads/shinyproxy_2.6.1_amd64.deb
    sudo dpkg -i /tmp/shinyproxy.deb
    ```

6. 💪 Configure ShinyProxy at `/etc/shinyproxy/application.yml`

    ```sh
    proxy:
      title: CEU Business Analytics Shiny Proxy
      logo-url: https://www.ceu.edu/sites/default/files/media/user-5/ceulogo_0_1.jpg
      landing-page: /
      heartbeat-rate: 10000
      heartbeat-timeout: 60000
      port: 8080
      docker:
        cert-path: /home/none
        url: http://localhost:2375
        port-range-start: 20000
      specs:
      - id: 01_hello
        display-name: Hello Application
        description: Application which demonstrates the basics of a Shiny app
        container-cmd: ["R", "-e", "shinyproxy::run_01_hello()"]
        container-image: openanalytics/shinyproxy-demo
    logging:
      file:
        /var/log/shinyproxy.log
    ```

    Optionally make that editable by the `ceu` user for easier access from RStudio for the time being:

    ```sh
    sudo chown ceu:ceu /etc/shinyproxy/application.yml
    ```

7. 💪 Restart ShinyProxy

    ```sh
    sudo systemctl restart shinyproxy
    ```

8. 💪 Set up yet-another-proxy so that the apps can be accessed over the standard HTTP/80 port

    1. Install `nginx`

        ```sh
        sudo apt install -y nginx
        ```

    2. Then we need to edit the main site's configuration at `/etc/nginx/sites-enabled/default`

        ```
        server {
            listen 80;
            location / {
                proxy_pass http://127.0.0.1:8080/;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection "upgrade";
                proxy_read_timeout 600s;
                proxy_redirect off;
                proxy_set_header Host $http_host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Protocol $scheme;
            }
        }
        ```

    3. Restart nginx

        ```sh
        sudo systemctl restart nginx
        ```

    4. Note that if you want to deploy under a specific path instead of the root path, you need to set `server.servlet.context-path` in the Shinyproxy configuration, then update the above Nginx config as well.

9. Visit your EC2 box's IP address at http://your.ip.address

10. Need to download the Docker image specified in the `application.yml` for the example app

    ```sh
    sudo docker pull openanalytics/shinyproxy-demo
    ```

11. Let's build a new Docker image for our application! For this end, we need to define the build instructions in a `Dockerfile` placed in `/home/ceu/countdown/Dockerfile`

    ```sh
    FROM rocker/shiny

    RUN install2.r shinyWidgets lubridate remotes
    RUN installGithub.r -u FALSE dreamRs/particlesjs

    RUN mkdir /app
    COPY *.R /app/

    CMD ["R", "-e", "shiny::runApp('/app')"]
    ```

    And then build the Docker image based on the above:

        ```sh
        sudo docker build -t countdown .
        ```

    Now we can run a Docker container based on this image on the command-line:

        ```sh
        sudo docker run --rm -ti countdown
        ```

12. Update the ShinyProxy config to include the above Dockerized app

    ```sh
    - id: countdown
      display-name: Countdown Timer
      description: Yeah, this is a countdown timer
      container-image: countdown
    ```

13. Debug why it's not running?

    ```sh
    sudo chown shinyproxy:shinyproxy /var/log/shinyproxy.log
    sudo systemctl restart shinyproxy
    ```

    Need to update the `Dockerfile` (or config) to expose on the right port:

    ```sh
    EXPOSE 3838
    CMD ["R", "-e", "shiny::runApp('/app', port = 3838, host = '0.0.0.0')"]
    ```

14. Authentication as per https://www.shinyproxy.io/documentation/configuration/#simple-authentication

```sh
...
proxy:
  authentication: simple
  ...
  users:
  - name: ceu
    password: ceudata
    group: users
  ...
  specs:
  - ...
    groups: users
```

#### My subjective "Best Damn Packages for Shiny" list

For the user interface:

- `shinyjs`
- `shinyWidgets`
- `DT`
- `dygraphs`
- `ggiraph`

For the back-end:

- `logger`
- `dbr`
- `botor`

:)



## Suggested Reading

* Hadley Wickham (2021): Mastering Shiny. https://mastering-shiny.org/
* Business Science (2020): The Shiny AWS Book. https://business-science.github.io/shiny-production-with-aws-book/

## Home Assignment

To be uploaded.

## Contact

File a [GitHub ticket](https://github.com/daroczig/CEU-DV4/issues).
