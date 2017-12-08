library(shiny)


fluidPage(
  titlePanel("Differential equation y'=Y-2X/Y"),
  fluidRow(
    column(3, wellPanel(
      sliderInput("step", "step:", min = 0, max = 5, value = 1,
                  step = 0.01),
      numericInput('a', 'start a', 3),
      numericInput('b', 'start b', 6),
      numericInput('y', 'y(0)', 1),
      
      submitButton("Submit")
    )),
    
           mainPanel(
             plotOutput("plot"),
             verbatimTextOutput("text")
             
           
    )
  )
)
