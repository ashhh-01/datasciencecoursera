library(readxl)

library(readxl)
Libro_1 <- read_excel("Libro 1.xlsx")

fluidPage(     
    
    titlePanel("Temperature State of Karnatka, India (The values are not accurate and should not be used for research) January 2022"), 
    
    sidebarLayout(       
        
        sidebarPanel(p(strong("Source:",style="color:red"), a("Meteored",href="https://www.meteored.mx/chihuahua/historico")), 
                     selectInput("temp", "Change selection:",  
                                 choices=colnames(Libro_1[-1]))
        ), 
        
        mainPanel( 
            plotOutput("alv")   
        ) 
        
    ) 
) 