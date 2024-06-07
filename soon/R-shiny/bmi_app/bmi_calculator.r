#==================================================================
#-------------BMI Calculator ---------------------------------
#============================================================

library(shiny)
library(shinythemes)

#------------- UI Block -----------------
ui <- fluidPage( theme = shinytheme("united"),
                 
                 navbarPage(title = "BMI Web App",
                            
                            #-----Tab Panel 1  ---------
                            tabPanel(title = "Home",
                                     
                                     sidebarPanel(
                                       HTML("<h3>Input BMI Parameters</h3>"),
                                       sliderInput(inputId = "height", 
                                                   label = "Height (cm)",
                                                   min = 40, max = 250, value = 175),
                                       sliderInput(inputId = "weight", 
                                                   label = "Weight (kg)", 
                                                   min = 20 , max = 100 , value = 70),
                                       actionButton(inputId = "submitbutton", label = "Submit",
                                                    class = "btn btn-primary")
                                     ),
                                     
                                     mainPanel(
                                       
                                       HTML(text = "<h2> BMI Result </h2>"),
                                       verbatimTextOutput("contents"),
                                       tableOutput("tabledata") #Results Table
                                     )
                            ),
                            
                            #-----Tab Panel 2-----
                            tabPanel(title = "About Application",
                                     div(includeMarkdown("about.md"), 
                                         align = "justify")
                            )
                   
                 )
  
)


#------------- Server Block -------------------
server <- function(input, output, session){
  
  #Input Data
  datasetInput <- reactive({
    
    bmi_calc <- input$weight / ((input$height/100) * (input$height/100) )
    bmi <- data.frame(BMI = bmi_calc)
    #names(bmi) <- "BMI"
    print(bmi)
    
  })
  
  
  #Results Textbox
  output$contents <- renderPrint({
    if (input$submitbutton > 0){
      isolate("Calculation Complete")
    } else {
      return("Server is ready for Calculation")
    }
  })
  
  #Prediction Results Table - Activates the datasetInput function when submit is pressed
  output$tabledata <- renderTable({
    
    if (input$submitbutton>0){
      isolate(datasetInput())
    }
    
  })
  
}



# ------------- Launch Shiny App -------------------
shinyApp(ui = ui, server = server)