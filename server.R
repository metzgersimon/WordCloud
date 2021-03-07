
server <- function(input, output){
  
  # output$cloud <- renderPlotly({
  #   
  # })
  
  output$text_head <- renderDataTable({
    file <- input$text
    ext <- tools::file_ext(file$datapath)
    
    req(file)
    validate(need(ext == "txt", "Please upload a .txt file"))
    
    text = readLines(file$datapath)
    
    cleaned_text <- get_clean_text(text)
    
    frequency_frame <- get_term_document_matrix(cleaned_text)
    
    frequency_frame
    

  })
}