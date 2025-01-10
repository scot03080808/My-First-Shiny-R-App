####################################
# Data Professor                   #
# http://youtube.com/dataprofessor #
# http://github.com/dataprofessor  #
####################################

# Modified from Winston Chang, 
# https://shiny.rstudio.com/gallery/shiny-theme-selector.html

# Concepts about Reactive programming used by Shiny, 
# https://shiny.rstudio.com/articles/reactivity-overview.html

# Load R packages
library(shiny)
library(shinythemes)


  # Define UI
  ui <- fluidPage(theme = shinytheme("cerulean"),
    navbarPage(
      # theme = "cerulean",  # <--- To use a theme, uncomment this
      "My first app",
      tabPanel("Navbar 1",
               sidebarPanel(
                 tags$h3("Input:"),
                 textInput("txt1", "Given Name:", ""),
                 textInput("txt2", "Surname:", ""),
                 h4("Name: "),
                 textOutput("name_display1") # Dynamic text display
                 
               ), # sidebarPanel
               mainPanel(
                  h1("Header 1"),
                  h4("Output 1"),
                  verbatimTextOutput("txtout")

               ) # mainPanel
      ), # Navbar 1, tabPanel
      tabPanel("Navbar 2", 
               sidebarPanel(
                 tags$h3("Input:"),
                 textInput("txt3", "Profession:", ""),
                 textInput("txt4", "Company:", ""),
                 h4("Name:"),
                 textOutput("name_display1") # Dynamic text display
               ), #sidebarpanel
               mainPanel(
                  h1("Header 2"),
                  h4("Name and Company"), 
                  verbatimTextOutput("txtout2")
                  
               ) #mainpanel
      ), #Navbar 2, tabPanel1
      tabPanel("Navbar 3", "This panel is intentionally left blank")
  
    ) # navbarPage
  ) # fluidPage

  
  # Define server function  
  server <- function(input, output) {
    
    output$txtout <- renderText({
      paste( input$txt1, input$txt2, sep = " " )
    })
    
    # Dynamic name display for Navbar1
    output$name_display1 <- renderText({
      if (input$txt1 != "" | input$txt2 != "") {
        paste(input$txt1, input$txt2)
      }
    })
    
    output$txtout2 <- renderText({
      paste( input$txt3, input$txt4, sep= " ")
    })
  } # server


  # Create Shiny object
  shinyApp(ui = ui, server = server)
