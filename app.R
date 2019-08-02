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
   
  # select random choice of setntences
  output$value <- renderText({
    ifelse(input$action >= 1, 
           sentences_list[[sample(1:length(sentences_list), 1)]], 
           "Let's start!")
  })
  
  # show today's number of sentences
  output$count <- renderText({
    input$action
  })

}

# Run the application 
shinyApp(ui = ui, server = server)

