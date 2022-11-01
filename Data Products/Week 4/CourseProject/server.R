library(readxl)
Libro_1 <- read_excel("Libro 1.xlsx")
function(input, output, session) { 
    
    output$alv <- renderPlot({ 
        
        serie2 <- ts(Libro_1[, input$temp], start = 1, end = 31, frequency = 1)
        
        plot(serie2, col = "blue",
             main = input$temp,
             xlab = "Day",
             ylab = input$temp,
        )
        
    })
}