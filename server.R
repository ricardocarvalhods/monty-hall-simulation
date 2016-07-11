
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
source('MontyHall.R')

shinyServer(function(input, output) {

  # generate dist
  dist <- reactive({ dist.game(input$reps, input$n) })
  
  # generate plots
  output$distPlot <- renderPlot({ plot.probs.switching(dist()) })
  output$distPlot.not <- renderPlot({ plot.probs.not.switching(dist()) })
  
  # To conditionally load main panel at ui.R
  output$mainpanel <- renderUI({
    tagList(
      h3("Distributions of Probability"),
      tabsetPanel(width='100%',
        tabPanel("Switching", 
                 h4("Results of simulation"),
                 
                 plotOutput("distPlot"),
                 HTML(paste0("<h5>Mean of probability of Winnning Switching: <span style='color:red'>", round(mean(dist()$prob.win.switching), 2), "</span>" )),
                 HTML(paste0("<h5>Std of probability of Winnning Switching: <span style='color:red'>", round(sqrt(var(dist()$prob.win.switching)), 3), "</span>" )),
                 HTML(paste0("<h5>Var. of probability of Winnning Switching: <span style='color:red'>", round(var(dist()$prob.win.switching), 5), "</span>" ))
        ), 
        tabPanel("NOT Switching", 
                 h4("Results of simulation"),
                 
                 plotOutput("distPlot.not"),
                 HTML(paste0("<h5>Mean of probability of Winnning NOT Switching: <span style='color:red'>", round(mean(dist()$prob.win.not.switching), 2), "</span>")),
                 HTML(paste0("<h5>Std of probability of Winnning NOT Switching: <span style='color:red'>", round(sqrt(var(dist()$prob.win.not.switching)), 3), "</span>" )),
                 HTML(paste0("<h5>Var. of probability of Winnning NOT Switching: <span style='color:red'>", round(var(dist()$prob.win.not.switching), 5), "</span>" ))
                 
        )
      )
    )
  })

})
