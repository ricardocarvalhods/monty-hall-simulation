
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(shinythemes)

shinyUI(fluidPage(
  fluidPage(theme = shinytheme("journal"),
            tags$head(
              tags$style(HTML("
                              @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');
                              
                              h1 {
                              font-family: 'Verdana';
                              font-weight: 500;
                              line-height: 1.1;
                              color: brown;
                              }
                              h2 {
                              font-family: 'Lobster', cursive;
                              font-weight: 500;
                              line-height: 1.1;
                              color: gray;
                              }
                              h3 {
                              font-family: 'Lobster', cursive;
                              font-weight: 500;
                              line-height: 1.1;
                              color: blue;
                              }
                              
                              "))
                  ),                
                  
  headerPanel("Monty Hall Simulation"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("reps", "Number of repetitions:", min = 300, max = 1000, value = 300, step = 100),
      sliderInput("n", "Number of runs in each repetition:", min = 300, max = 1000, value = 300, step=100),
      
      HTML("<br/><br/><b>About the problem:</b><br/><li><a target='blank' href='https://en.wikipedia.org/wiki/Monty_Hall_problem'>Understand the Monty Hall problem!</a></li>"),
      HTML("<li><a target='blank' href='https://ricardosc.shinyapps.io/MontyHallGame/'>Play a Monty Hall Game!</a></li><br/>"),
      
      HTML("<br/><br/><b>Credits:</b> <a target='blank' href='http://ricardoscr.github.io/'>Ricardo Carvalho</a> (ricardosc at gmail.com)<br/>"),
      
      HTML("<li>Complete code for this shiny app<a target='blank' href='https://github.com/ricardoscr/monty-hall-simulation'> available on Github.</a><br/>")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      mainPanel(
        uiOutput('mainpanel')
      )
    )
  )
)))
