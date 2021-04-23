
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
                              tabPanel(title = "Word Cloud",
                                      # imageOutput("cloud_plot"),
                                       plotOutput("cloud_plot"),
                                       downloadButton("download_wordcloud",
                                                    "Save Image",
                                                    icon = icon("camera"))),
                              tabPanel(title = "Frequencies",
                                       plotOutput("cloud_statistic"),
                                       downloadButton("download_frequencies",
                                                      "Save Image",
                                                      icon = icon("camera"))
                                       )
                              )
                            )
                   )
                 )
               ),
             tabPanel("Wordcloud2",
                      sidebarLayout(
                        sidebarPanel(
                          selectInput("wordcloud2_color", "Background color",
                                      choices = c("black", "green", "blue",
                                                  "white")),
                          radioButtons("wordcloud2_shape_type", "Predefined shape or custom shape",
                                       choices = c("Predefined", "Custom"),
                                       selected = "Predefined"),
                          conditionalPanel(condition = "input.wordcloud2_shape_type == 'Predefined'",
                                           selectInput("wordcloud2_shape", "Shape of the cloud",
                                                       choices = c("circle", "cardioid", "diamond",
                                                                   "triangle-forward","triangle",
                                                                   "pentagon", "star")
                                                       )
                                           ),
                          conditionalPanel(condition = "input.wordcloud2_shape_type == 'Custom'",
                                           textInput("wordcloud2_word_shape", "Custom shape",
                                                     placeholder = "")
                                           ),
                          sliderInput("font_size", "Font size", value = 0.5, 
                                      min = 0.1, max = 1),
                          sliderInput("rotation_ratio", "Rotation probability",
                                      min = 0, max = 1, value = 0.4)
                          
                        ),
                        mainPanel(
                          wordcloud2Output("wordcloud2"),
                          downloadButton("download_wordcloud2",
                                         "Save Image",
                                         icon = icon("camera"))
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
