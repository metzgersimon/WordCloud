
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
    print(cloud_frame)
    wordcloud(words = cloud_frame$word, 
              freq = cloud_frame$frequency, min.freq = 1,
              max.words=200, random.order=FALSE, rot.per=0.35, 
              colors=brewer.pal(8, "Dark2"))
  })
  

  output$cloud_statistic <- renderPlot({
    plot_frame <- get_text()
    
    barplot(plot_frame[1:10,]$frequency, las = 2, 
            names.arg = plot_frame[1:10,]$word,
            col ="cyan", main ="Most frequent words",
            ylab = "Word frequencies")
    
  })
  
  output$text_head <- renderDataTable({
    
    get_text()
    
  })
}