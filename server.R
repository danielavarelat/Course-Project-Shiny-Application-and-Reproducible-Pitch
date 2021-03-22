#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
    variable_plot <- reactive({
        
        df<-data.frame(A=mtcars["mpg"], B=mtcars[input$inGen])
        colnames(df) <- c("A", "B")
        if (input$inGen %in% c("cyl", "gear", "vs", "am", "carb")){
            df$B <- as.factor(df$B)
            p <-ggplot(df,aes(x=B, y=A)) + geom_boxplot() + 
                xlab(input$inGen) + ylab('mpg')
        } else {
            p <-ggplot(df,aes(x=B, y=A)) + geom_point() + 
                xlab(input$inGen) + ylab('mpg') + geom_smooth(method='lm')
        }
        return(p)
    })
    output$plot1 <- renderPlot({
        plot(variable_plot())
    })
    
})


