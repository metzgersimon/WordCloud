
server <- function(input, output, session){
  
  sync <- reactiveValues(colors = NULL)
  
  #### #### observer #### ####
  observeEvent(input$color_picker, {
    sync$colors <- c(sync$colors, input$color_picker)
    updateSelectizeInput(session, "colors", choices = sync$colors,
                         selected = sync$colors)
  })
  
  observeEvent(input$delete_colors, {
    sync$colors <- NULL
    updateSelectizeInput(session, "colors", choices = "",
                         selected = "")
  })
  
  observeEvent(input$download_wordcloud, {
    saveWidget(wordcloud_rep, file = "test.html")
  })
  
  observe({
    text <- get_text(input$text)
    updateSliderInput(session,inputId = "freq", max = max(text$frequency))
    updateSliderInput(session, inputId = "max", max = nrow(text))
    updateTextInput(session, inputId = "colors2", value = input$color_picker)
  })
  
  #### #### reactive functions #### ####
  
  wordcloud_rep <- repeatable(wordcloud)
  
  wordcloud_reac <- reactive({
    set.seed(991)
    
    cloud_frame <- get_text(input$text)
    
    if(input$color_system == "Predefined"){
      color <- get_colors(color_scheme = input$color_scheme)
    } else{
      req(input$apply_colors)
      color <- get_colors(is_custom = TRUE, custom_colors = input$colors)
    }
    # create word cloud with custom parameters
    wordcloud_rep(words = cloud_frame$word, 
                  freq = cloud_frame$frequency, min.freq = input$freq,
                  max.words = input$max, random.order = FALSE, rot.per = input$rotation, 
                  colors = color)
  })
  
  wordcloud_image <- reactive({
    set.seed(991)
    
    cloud_frame <- get_text(input$text)
    
    if(input$color_system == "Predefined"){
      color <- get_colors(color_scheme = input$color_scheme)
    } else{
      req(input$apply_colors)
      color <- get_colors(is_custom = TRUE, custom_colors = input$colors)
    }
   
    png("wordcloud.png")
    # create word cloud with custom parameters
    wordcloud_rep(words = cloud_frame$word, 
                  freq = cloud_frame$frequency, min.freq = input$freq,
                  max.words = input$max, random.order = FALSE, rot.per = input$rotation, 
                  colors = color)
    dev.off()
    
    filename = "wordcloud.png"
  })
  
  # creates the frequency plot of the word in the data set
  # which is displayed in the "Statistic" tab
  get_frequency_plot <- reactive({
    plot_frame <- get_text(input$text)
    plot_frame$word <- 
      factor(plot_frame$word, 
             levels = plot_frame$word[order(plot_frame$frequency, 
                                            decreasing = TRUE)])
    
    
    plot_frame <- head(plot_frame, 15)
    
    ggplot(plot_frame, aes(x = word, y = frequency))+
      geom_bar(stat = "identity", fill = "darkblue")+
      theme(legend.position = "none",
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            plot.title = element_text(hjust = 0.5))+
      ggtitle("15 Most frequent words")+
      labs(x = "Word", y = "Frequency")
  })


  cloud_reactive <- reactive({
    if(input$wordcloud2_shape_type == "Predefined"){
      cloud <-
        wordcloud2(get_text(input$text), backgroundColor = input$wordcloud2_color,
                   shape = input$wordcloud2_shape, size = input$font_size,
                   rotateRatio = input$rotation_ratio)
    }else if(input$wordcloud2_shape_type == "Custom"){
      cloud <- letterCloud(get_text(input$text), word = "O")
    }
    return(cloud)
  })
  
  wordcloud2_image <- reactive({
    saveWidget(cloud_reactive(), "tmp.html", selfcontained = F)
    webshot("tmp.html", "wordcloud2.png", delay = 120, vwidth = 2000, vheight = 2000)
  })
  #### #### #### ####
  
  #### #### download images #### ####
  output$download_wordcloud <- downloadHandler(
    filename = "wordcloud.png",
    content = function(cloud) {
      file.copy(wordcloud_image(), cloud)
    })

  
  output$download_frequencies <- downloadHandler(
    filename = "frequency_bars.png",
    contentType = "image/png",
    content = function(file) {
      png(file)
      print(get_frequency_plot())
      dev.off()
    }
  )
  
  output$download_wordcloud2 <- downloadHandler(
    filename = "wordcloud2.png",
    contentType = "image/png",
    content = function(file) {
      png(file)
      print(wordcloud2_image())
      dev.off()
    }
  )
  
  #### #### #### #### #### ####
  
  
  #### #### render output #### ####
  output$cloud_plot <- renderPlot({
    wordcloud_reac()
  })
  
  output$cloud_statistic <- renderPlot({
    get_frequency_plot()
  })
  
  output$wordcloud2 <- renderWordcloud2({
    cloud_reactive()
  })
  
  output$text_head <- renderDataTable({
    get_text(input$text)
    
  })
  
 


}