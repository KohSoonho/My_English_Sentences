library(shiny)
source("senteces.R")

# Define UI for application that shows English sentences
ui <- fluidPage(
  tags$head(tags$style("#value {font-size: 15px;}
                        #count {font-weight: bold;
                                font-size: 18px;}
                        #comment {color: blue; 
                                  font-size: 15px; 
                                  font-weight: bold; 
                                  margin-top: 5px; 
                                  padding-bottom: 0px}")), 
  
   # Application title
   titlePanel("Everyday 100 English sentences!!!"),
   
   # action button shows count and English sentences randomly
   # action button
   actionButton(
     "action", label = "NEXT"
     ), 
   
   mainPanel(
     # show the number of English sentences
     textOutput("count"), 
     # express a little comments
     textOutput("comment")
     ), 
   
   hr(), 
   
   mainPanel(
     wellPanel(textOutput("value"), 
               style = "padding: 10px;
                        margin-bottom: 0px;"), 
     width = "auto"
     ), 
   
   br(), 
   
   # links for searching words
   mainPanel(a(imageOutput("camb", height = 70), 
               href = "https://dictionary.cambridge.org")), 
   
   mainPanel(a(imageOutput("goo", height = 70), 
               href = "https://www.google.co.jp")), 
   
   mainPanel(a(imageOutput("power", height = 70), 
               href = "https://www.powerthesaurus.org"))
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
  
  # show comment
  output$comment <- renderText({
    case_when(input$action < 25 ~ 
                "a journey of a thousand miles begins with a single step!", 
              input$action == 25 ~ 
                "You reach a quarter of daily task!", 
              input$action > 25 && input$action < 50  ~ 
                "Slow and steady wins the race!", 
              input$action == 50 ~ 
                "You reach a half of daily task!", 
              input$action > 50 && input$action < 75 ~ 
                "Rome was not built in a day!", 
              input$action == 75 ~ 
                "You reach three-quarters of daily task!", 
              input$action > 75 && input$action < 100 ~ 
                "There's many slips between the cup and the lip!", 
              input$action >= 100 ~ 
                "You achieve your daily task! You are awsome!")
  })
  
  # imges of links
  output$camb <- renderImage({
    list(src = "images/cambridge.png", 
         width = 150)
  }, deleteFile = FALSE)
  
  output$goo <- renderImage({
    list(src = "images/google.png", 
         width = 150)
  }, deleteFile = FALSE) 
  
  output$power <- renderImage({
    list(src = "images/power.png", 
         width = 150)
  }, deleteFile = FALSE)

}

# Run the application 
shinyApp(ui = ui, server = server)

