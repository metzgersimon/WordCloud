
ui <- fluidPage(theme = shinytheme("slate"),
                navbarPage(
                  title = "Wordy Word Cloud",
                  tabPanel(
                    "Word Cloud",
                    tabsetPanel(
                      tabPanel(
                        title = "Test Cloud"
                      ),
                      tabPanel(
                        title = "Statistics"
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