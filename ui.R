

ui <- fluidPage(theme = shinytheme("slate"),
                navbarPage(
                  title = "Wordy Word Cloud",
                  tabPanel("Word Cloud",
                           sidebarLayout(
                             sidebarPanel(
                               sliderInput(
                                 "freq",
                                 "Minimum frequency:",
                                 min = 1,
                                 max = 100,
                                 value = 10
                               ),
                               sliderInput(
                                 "max",
                                 "Maximum number of words:",
                                 min = 1,
                                 max = 500,
                                 value = 250
                               ),
                               sliderInput(
                                 "rotation",
                                 "Rotation of words:",
                                 min = 0,
                                 max = 1,
                                 value = 0
                               ),
                               # radioButtons(
                               #   "color_system",
                               #   "Predefined or custom color scheme",
                               #   choiceNames = c("Predefined","Custom"),
                               #   choiceValues = 
                               # )
                               selectInput(
                                 "color_scheme",
                                 "Choose a color scheme:",
                                 choices = rownames(brewer.pal.info),
                                 selected = ""
                               ),
                               colourInput(
                                 "color_picker",
                                 "Choose custom colors:",
                                 closeOnClick = TRUE
                               ),
                               selectizeInput(
                                 "colors",
                                 "Colors: ",
                                 choices = NULL,
                                 multiple = TRUE,
                                 options = list(
                                   placeHolder = ""
                                 )
                               )
                             ),
                             mainPanel(tabPanel(
                               "Word Cloud",
                               tabsetPanel(
                                 tabPanel(title = "Test Cloud",
                                          plotOutput("cloud_plot")),
                                 tabPanel(title = "Statistics",
                                      
                                            plotOutput("cloud_statistic")
                                          ))
                               )
                             ))
                           ),
                  tabPanel(
                    "Text Input",
                    fluidRow(
                      fileInput(
                        "text",
                        label = "Select a local text: ",
                        placeholder = ".txt file",
                        accept = ".txt"
                      )
                    ),
                    fluidRow(dataTableOutput("text_head"))
                  )
                ))
