box::use(
  shiny[moduleServer, NS, div, h1, p]
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  div(
    h1("Welcome to the Coffee Kroad Demo"),
    p("This is the home page of our application.")
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # Add any home page specific server logic here
  })
}
