box::use(
  shiny[moduleServer, NS],
  bslib[page_navbar, nav_panel],
  htmltools[a]
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  page_navbar(
    title = "Coffee Kroad Demo",
    nav_panel(
      title = "Home",
      home$ui(id = ns(HOME_PAGE))
    ),
    nav_panel(
      title = "Map",
      map$ui(id = ns(MAP_PAGE))
    )
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # Add any global server logic here
  })
}
