get_color_scheme <- function(color_scheme_string, n = 8){
  color_scheme <- get(color_scheme_string)
  return(color_scheme(n = n))
}