
server <- function(input, output){
  
  get_text <- reactive({
    file <- input$text
    ext <- tools::file_ext(file$datapath)
    
    req(file)
    validate(need(ext == "txt", "Please upload a .txt file"))
    
    text = readLines(file$datapath)
    
    cleaned_text <- get_clean_text(text)
    
    frequency_frame <- get_term_document_matrix(cleaned_text)
    
    frequency_frame
  })
  
  output$cloud_plot <- renderPlot({
    set.seed(991)
    
    cloud_frame <- get_text()

    wordcloud(words = cloud_frame$word, 
              freq = cloud_frame$frequency, min.freq = input$freq,
              max.words = input$max, random.order = FALSE, rot.per = 0.35, 
              colors = brewer.pal(8, "Dark2"))
  })
  

  output$cloud_statistic <- renderPlot({
    plot_frame <- get_text()
    plot_frame$word <- 
      factor(plot_frame$word, 
             levels = plot_frame$word[order(plot_frame$frequency)])
    
   
    plot_frame <- head(plot_frame, 15)
    
    # barplot(plot_frame[1:10,]$frequency, las = 2, 
    #         names.arg = plot_frame[1:10,]$word,
    #         col ="cyan", main ="Most frequent words",
    #         ylab = "Word frequencies")
    
    ggplot(plot_frame, aes(x = frequency, y = word, color = word))+
      geom_bar(stat = "identity", fill = "black")+
      scale_fill_manual(values = rainbow(15))+
      theme_bw()
      
    
  })
  
  output$text_head <- renderDataTable({
    
    get_text()
    
  })
}