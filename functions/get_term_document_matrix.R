get_term_document_matrix <- function(docs){
  
  # create term document matrix and convert it into a matrix
  term_document_matrix <- TermDocumentMatrix(docs) %>%
    as.matrix()
  
  # order the matrix in decreasing order
  tdm_ordered <- sort(rowSums(term_document_matrix), decreasing = TRUE)
  
  # convert the matrix into a data frame
  tdm_frame <- data.frame(word = names(tdm_ordered), frequency = tdm_ordered)
  
  # reset the indices
  rownames(tdm_frame) <- 1:nrow(tdm_frame)
 
  return(tdm_frame)
}