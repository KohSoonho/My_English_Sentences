library(shiny)
source("senteces.R")

# Define UI for application that shows English sentences
ui <- fluidPage(
   
   # Application title
   titlePanel("Everyday 100 English sentences!!!"),
   
   # acction button shows count and English sentences randomly
   actionButton("action", label = "NEXT"), 
   
   mainPanel(textOutput("count")), 
   
   hr(), 
   
   mainPanel(verbatimTextOutput("value"))
   
   )

# Define server logic required to show English sentences
server <- function(input, output) {
   
  # define n and numbers
  n <- length(sentences_list)
  numbers <- sample(1:n, n, replace = FALSE)
  
  # select random choice of setntences
  output$value <- renderText({
    ifelse(input$action >= 1, 
           ifelse(input$action <= n, 
                  sentences_list[[ numbers[[input$action]] ]], 
                  "too many!"), 
           "Let's start!")
  })
  
  # show today's number of sentences
  output$count <- renderText({
    input$action
  })

}

# Run the application 
shinyApp(ui = ui, server = server)

