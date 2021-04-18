get_colors <- function(is_custom = FALSE, color_scheme = NULL, custom_colors = NULL){
  if(!is_custom){
    if(color_scheme %in% rownames(brewer.pal.info)){
      color <- brewer.pal(n = 8, input$color_scheme)
    } else {
      color <- get_color_scheme(color_scheme)
    }
  } else {
    color <- custom_colors
  }
  return(color)
}