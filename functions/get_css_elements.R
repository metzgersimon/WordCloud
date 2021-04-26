get_datatable_style <- function(){
  css_string <- 
 ".dataTables_wrapper .dataTables_paginate .paginate_button {
  box-sizing: border-box;
  display: inline-block;
  min-width: 1.5em;
  padding: 0.5em 1em;
  margin-left: 2px;
  text-align: center;
  text-decoration: none !important;
  cursor: pointer;
  *cursor: hand;
  color: #ffffff !important;
  border: 1px solid transparent;
  border-radius: 2px;
}
.dataTables_wrapper .dataTables_paginate .paginate_button.current, .dataTables_wrapper .dataTables_paginate .paginate_button.current:hover {
  color: #ffffff !important;
  border: 1px solid #001172;
  background-color: #8c9dff;
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #8c9dff), color-stop(100%, #0026fc));
  /* Chrome,Safari4+ */
  background: -webkit-linear-gradient(top, #8c9dff 0%, #0026fc 100%);
  /* Chrome10+,Safari5.1+ */
  background: -moz-linear-gradient(top, #8c9dff 0%, #0026fc 100%);
  /* FF3.6+ */
  background: -ms-linear-gradient(top, #8c9dff 0%, #0026fc 100%);
  /* IE10+ */
  background: -o-linear-gradient(top, #8c9dff 0%, #0026fc 100%);
  /* Opera 11.10+ */
  background: linear-gradient(to bottom, #8c9dff 0%, #0026fc 100%);
  /* W3C */
}
.dataTables_wrapper .dataTables_paginate .paginate_button.disabled, .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:hover, .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:active {
  cursor: default;
  color: #666 !important;
  border: 1px solid transparent;
  background: transparent;
  box-shadow: none;
}
.dataTables_wrapper .dataTables_paginate .paginate_button:hover {
  color: white !important;
  border: 1px solid #00ffff;
  background-color: #8fffff;
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #8fffff), color-stop(100%, #00ffff));
  /* Chrome,Safari4+ */
  background: -webkit-linear-gradient(top, #8fffff 0%, #00ffff 100%);
  /* Chrome10+,Safari5.1+ */
  background: -moz-linear-gradient(top, #8fffff 0%, #00ffff 100%);
  /* FF3.6+ */
  background: -ms-linear-gradient(top, #8fffff 0%, #00ffff 100%);
  /* IE10+ */
  background: -o-linear-gradient(top, #8fffff 0%, #00ffff 100%);
  /* Opera 11.10+ */
  background: linear-gradient(to bottom, #8fffff 0%, #00ffff 100%);
  /* W3C */
}
.dataTables_wrapper .dataTables_paginate .paginate_button:active {
  outline: none;
  background-color: #33ffff;
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #33ffff), color-stop(100%, #00f5f5));
  /* Chrome,Safari4+ */
  background: -webkit-linear-gradient(top, #33ffff 0%, #00f5f5 100%);
  /* Chrome10+,Safari5.1+ */
  background: -moz-linear-gradient(top, #33ffff 0%, #00f5f5 100%);
  /* FF3.6+ */
  background: -ms-linear-gradient(top, #33ffff 0%, #00f5f5 100%);
  /* IE10+ */
  background: -o-linear-gradient(top, #33ffff 0%, #00f5f5 100%);
  /* Opera 11.10+ */
  background: linear-gradient(to bottom, #33ffff 0%, #00f5f5 100%);
  /* W3C */
  box-shadow: inset 0 0 3px #111;
}

.dataTables_wrapper .dataTables_filter,
.dataTables_wrapper .dataTables_info,
.dataTables_wrapper .dataTables_processing,
.dataTables_wrapper .dataTables_paginate {
  color: #ffffff;
}"
return(css_string)
}
#.dataTables_wrapper .dataTables_length,