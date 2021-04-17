
server <- function(input, output, session){
  
  observe({
    # req(input$text)
    text <- get_text()
    updateSliderInput(session,inputId = "freq", max = max(text$frequency))
    updateSliderInput(session, inputId = "max", max = nrow(text))
    # updateSelectInput(session, inputId = "color_scheme", choices =
  })
  
  get_text <- reactive({
    if(!is.null(input$text)){
      file <- input$text
      ext <- tools::file_ext(file$datapath)
      
      req(file)
      validate(need(ext == "txt", "Please upload a .txt file"))
      
      text = readLines(file$datapath)
      
      cleaned_text <- get_clean_text(text)
      
      frequency_frame <- get_term_document_matrix(cleaned_text)
      
      frequency_frame
    }
    else{
      text = readLines("data/text.txt")
      
      cleaned_text <- get_clean_text(text)
      
      frequency_frame <- get_term_document_matrix(cleaned_text)
      
      frequency_frame
    }
    
  })
  
  wordcloud_rep <- repeatable(wordcloud)
  
  
  output$cloud_plot <- renderPlot({
    set.seed(991)
    
    cloud_frame <- get_text()
    # set user chosen color
    color = brewer.pal(n = 8, input$color_scheme)
    # create word cloud with custom parameters
    wordcloud_rep(words = cloud_frame$word, 
                  freq = cloud_frame$frequency, min.freq = input$freq,
                  max.words = input$max, random.order = FALSE, rot.per = input$rotation, 
                  colors = color)
  })
  

  output$cloud_statistic <- renderPlot({
    plot_frame <- get_text()
    plot_frame$word <- 
      factor(plot_frame$word, 
             levels = plot_frame$word[order(plot_frame$frequency)])
    
   
    plot_frame <- head(plot_frame, 15)
    
    ggplot(plot_frame, aes(x = frequency, y = word, color = word))+
      geom_bar(stat = "identity", fill = "black")+
      scale_fill_manual(values = rainbow(15))+
      theme_dark()+
      theme(legend.position = "none",
            panel.grid.major.y = element_blank(),
            panel.grid.minor.y = element_blank())+
      scale_x_discrete("Frequency", )
      
    
  })
  
  output$text_head <- renderDataTable({
    
    get_text()
    
  })
}