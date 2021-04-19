
viridis_colors <-
  c("cividis", "inferno", "magma", "plasma", "viridis")

ui <- fluidPage(
  theme = shinytheme("slate"),
  navbarPage(title = "Wordy Word Cloud",
             tabPanel("Word Cloud",
               sidebarLayout(
                 sidebarPanel(sliderInput("freq", "Minimum frequency:", min = 1,
                                          max = 100, value = 10),
                              sliderInput("max", "Maximum number of words:", min = 1,
                                          max = 500, value = 250),
                              sliderInput("rotation", "Rotation of words:", min = 0,
                                          max = 1, value = 0),
                              radioButtons("color_system", "Predefined or custom color scheme",
                                           choices = c("Predefined", "Custom"),
                                           selected = "Predefined"),
                              conditionalPanel(condition = "input.color_system == 'Predefined'",
                                               selectInput("color_scheme",
                                                           "Choose a color scheme:",
                                                           choices = c(viridis_colors,
                                                                       rownames(brewer.pal.info)),
                                                           selected = "")),
                              conditionalPanel(condition = "input.color_system == 'Custom'",
                                               colourInput("color_picker",
                                                           "Choose custom colors:",
                                                           closeOnClick = TRUE),
                                               selectizeInput("colors", "Colors: ",
                                                              selected = NULL,
                                                              choices = NULL,
                                                              multiple = TRUE),
                                               actionButton("apply_colors", "Apply colors"),
                                               actionButton("delete_colors", "Delete colors",
                                                          icon = icon("trash-alt"))
                              )
                   ),
                 mainPanel(
                   tabPanel("Word Cloud", 
                            tabsetPanel(
                              tabPanel(title = "Test Cloud",
                                       plotOutput("cloud_plot"),
                                       actionButton("download_wordcloud",
                                                    "Save Image",
                                                    icon = icon("camera"))),
                              tabPanel(title = "Statistics",
                                       plotOutput("cloud_statistic"),
                                       fluidRow(
                                         column(
                                           width = 4,
                                           div(style = "margin-top:15px",
                                               downloadBttn("download_statistic",
                                                            "Save Image",
                                                            style = "jelly",
                                                            color = "success")
                                               )
                                           )
                                         )
                                       )
                              )
                            )
                   )
                 )
               ),
             tabPanel("Text Input",
                      fluidRow(
                        fileInput("text", label = "Select a local text: ",
                                  placeholder = ".txt file", accept = ".txt")
                        ),
                      fluidRow(
                        dataTableOutput("text_head"))
                      )
  )
)
