get_text <- function(text_input){
  if(!is.null(text_input)){
    file <- text_input
    ext <- tools::file_ext(file$datapath)
    
    req(file)
    validate(need(ext == "txt", "Please upload a .txt file"))
    text <- readLines(file$datapath)
    cleaned_text <- get_clean_text(text)
    frequency_frame <- get_term_document_matrix(cleaned_text)
  }
  else{
    text <- readLines("data/text.txt")
    cleaned_text <- get_clean_text(text)
    frequency_frame <- get_term_document_matrix(cleaned_text)
  }
  return(frequency_frame)
}