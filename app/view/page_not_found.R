box::use(
  shiny[moduleServer, NS, div, h1, p]
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  div(
    h1("404 - Page Not Found"),
    p("Sorry, the page you're looking for doesn't exist.")
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # No server logic needed for 404 page
  })
}
