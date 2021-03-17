

ui <- fluidPage(theme = shinytheme("slate"),
                navbarPage(
                  title = "Wordy Word Cloud",
                  tabPanel("Word Cloud",
                           sidebarLayout(
                             sidebarPanel(
                               sliderInput(
                                 "freq",
                                 "Minimum Frequency:",
                                 min = 1,
                                 max = 100,
                                 value = 10
                               ),
                               sliderInput(
                                 "max",
                                 "Maximum Number of Words:",
                                 min = 1,
                                 max = 500,
                                 value = 250
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
