box::use(
  shiny[
    actionButton,
    column,
    div,
    fluidRow,
    h2,
    moduleServer,
    NS,
    observeEvent
  ],
  shiny.router[change_page]
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  fluidRow(
    column(
      width = 12,
      div(
        class = "jumbotron",
        h2("Click this button to check out the map:"),
        actionButton(
          inputId = ns("go_to_map"),
          label = "Map",
          class = "btn-primary btn-lg"
        )
      )
    )
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    observeEvent(input$go_to_map, {
      change_page("map")
    })
  })
}
