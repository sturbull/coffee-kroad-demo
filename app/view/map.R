box::use(
  shiny[moduleServer, NS, div, h1, p]
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  div(
    h1("Map View"),
    p("This is where the map will be displayed.")
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # Add any map page specific server logic here
  })
}
