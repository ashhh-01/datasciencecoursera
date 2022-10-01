library(shiny)

shinyUI(fluidPage(
    titlePanel("Visualise Many Models"),
    sidebarLayout(
        sidebarPanel(
            h3("slope"),
            textOutput("slopeOut"),
            h3("Intercept"),
            textOutput("intOut")
        ),
        mainPanel(
            plotOutput("plot1",brush=brushOpts(
                id="brush1"
            ))
        )
    )
))