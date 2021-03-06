
ui <- fluidPage(
  dashboardPage(
    dashboardHeader(
      title = "Wordy Word Cloud"
    ),
    dashboardSidebar(
      sidebarMenu(
        menuItem(
          "Word Cloud", tabName = "word_cloud", icon = icon("cloud")
        ),
        menuItem(
          "Statistics", tabName = "statistics", icon = icon("th")
        )
      )
    ),
    dashboardBody(
      
    )
  )
)