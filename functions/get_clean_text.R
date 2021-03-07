get_clean_text <- function(raw_text){
  
  # convert the text into a corpus object
  docs <- Corpus(VectorSource(raw_text))
  
  # make needed transformations to the corpus
  docs <- docs %>%
    tm_map(content_transformer(tolower)) %>%
    tm_map(removeNumbers) %>%
    tm_map(removePunctuation) %>%
    tm_map(removeWords, stopwords("english")) %>%
    tm_map(stripWhitespace)
  
  return(docs)
}