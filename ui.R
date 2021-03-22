library(shiny)
shinyUI(fluidPage(
    titlePanel("Variable plots with mtcars dataset"),
    sidebarLayout(
        sidebarPanel(
            helpText("Select the variable you want to use as the independant one"),
            helpText("The dependant variable will always be = MPG (Miles/(US) gallon)"),
            radioButtons(inputId = "inGen",
                         label = "Select variable: ",
                         choices = c("Displacement"="disp",
                                    "Gross horsepower"="hp",
                                     "Rear axle ratio"="drat",
                                     "Weight"="wt",
                                     "1/4 mile time"="qsec",
                                    "Cylinders"="cyl",
                                    "V/S" = "vs",
                                    "Automatic/Manual"="am",
                                    "Forward gears"="gear",
                                    "Number carburetors"="carb"
                                    ),
                         inline = TRUE)
        ),
        mainPanel(
            plotOutput("plot1")
        )
    )
))

