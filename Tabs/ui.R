library(shiny)

shinyUI(fluidPage(
    titlePanel("Tabs"),
    sidebarLayout(
        sidebarPanel(
            textInput("box1","Enter Tab1 Text",value="Tab1"),
            textInput("box2","Enter Tab2 Text",value="Tab2"),
            textInput("box3","Enter Tab3 Text",value="Tab3"),
            submitButton("Submit"),
            ),
        mainPanel(
            tabsetPanel(
                tabPanel("Tab1",br(),textOutput("out1")),
                tabPanel("Tab2",br(),textOutput("out2")),
                tabPanel("Tab3",br(),textOutput("out3"))
                
            )
        )
    )
))