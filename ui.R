
ui <- fluidPage(theme = shinytheme("slate"),
                navbarPage(
                  title = "Wordy Word Cloud",
                  tabPanel(
                    "Word Cloud",
                    tabsetPanel(
                      tabPanel(
                        title = "Test Cloud",
                        plotOutput("cloud_plot")
                      ),
                      tabPanel(
                        title = "Statistics",
                        tabsetPanel(
                          tabPanel("Tab1",
                                   plotOutput("cloud_statistic")
                                   )
                        )
                        
                      )
                    )
                  ),
                  tabPanel(
                    "Text Input",
                    fluidRow(fileInput("text", label = "Select a local text: ",
                              placeholder = ".txt file",
                              accept = ".txt")
                    ),
                    fluidRow(dataTableOutput("text_head"))
                  )
                  
                ))