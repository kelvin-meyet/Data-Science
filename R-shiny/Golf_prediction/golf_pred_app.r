library(shiny)
library(shinythemes)
library(randomForest)
library(RCurl)
library(data.table)

#https://raw.githubusercontent.com/kelvin-meyet/Data-Science/ML-AI-PROJECTS/Datasets/weather-weka.csv



weather <- read.csv(text = getURL("https://raw.githubusercontent.com/kelvin-meyet/Data-Science/ML-AI-PROJECTS/Datasets/weather-weka.csv"),
                    stringsAsFactors = TRUE)


rf_model <- randomForest(formula = play ~ ., data = weather, ntree = 500, mtry = 4, importance = TRUE)



ui <- fluidPage(theme = shinytheme("superhero"),
                navbarPage(title = "Data Driven Application",
                           
                           # ---Tab Panel 1---
                           tabPanel(title = "Golf Prediction",
                                    
                                    sidebarPanel(
                                      HTML("<h3> Input Parameters </h3>"),
                                      selectInput(inputId = "outlook", label = "Outlook:",
                                                  choices = list("Sunny" = "sunny", "Rainy" = "rainy", "Overcast" = "overcast"),
                                                  selected = "Rainy"),
                                      sliderInput(inputId = "temperature", label = "Temperature:", 
                                                  min = min(weather$temperature), 
                                                  max = max(weather$temperature), 
                                                  value = median(weather$temperature)),
                                      sliderInput(inputId = "humidity", label = "Humidity:", 
                                                  min = min(weather$humidity), max = max(weather$humidity), 
                                                  value = median(weather$humidity)),
                                      selectInput(inputId = "windy", label = "Windy", 
                                                  choices = list("Yes" = "TRUE", "No" = "FALSE"), 
                                                  selected = "FALSE"),
                                      actionButton(inputId = "submitbutton", label = "submit", class = "btn btn-primary")
                                    ),
                                    
                                    mainPanel(
                                      tags$label(h3('Status')),  # A text box
                                      verbatimTextOutput("contents"),
                                      tableOutput("tabledata") # Table for prediction results
                                      
                                      
                                    )
                           )
                  
                )
  
)

#====================================
#----Server Function----
#====================================

server <- function(input, output, session){
  
  #---Input Data---
  datasetInput <- reactive({
    #outlook, temperature, humidity, windy, play
    df <- data.frame(
      variable = c("outlook", "temperature", "humidity", "windy"),
      value = as.character(c(input$outlook, input$temperature, input$humidity, input$windy)),
      stringsAsFactors = FALSE 
      )
    
    play <- "play"
    
    df <- rbind(df, play)
    
    input <- transpose(df)
    
    write.table(input, "input.csv", sep=",", quote = FALSE, row.names = FALSE, col.names = FALSE)
    
    test <- read.csv(paste("input", ".csv", sep = ""), header = T)
    
    test$outlook <- factor(test$outlook, levels = c("overcast", "rainy", "sunny"))
      
    Output <- data.frame(Prediction = predict(rf_model, test), round(predict(rf_model, test, type = "prob"), 2))
    #print(Output)
  
  })
  
  #--- status / output Textbox -----
  output$contents <- renderPrint({
    if (input$submitbutton>0) {
      isolate("Calculation Complete!")
    } else {
      return("Server is ready for calculation")
    }
  })
  
  #-- Prediction Results table
  output$tabledata <- renderTable({
    if (input$submitbutton > 0) {
      isolate(datasetInput())
    }
  })
  
}

#================================================
#---Create Shiny APP-------
#================================================
shinyApp(ui = ui, server = server)

