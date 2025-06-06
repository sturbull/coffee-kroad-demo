# app/main.R

box::use(
  shiny[a, fluidPage, moduleServer, tags, NS],
  shiny.router[router_ui, router_server, route, route_link],
)

box::use(
  app / view / home,
  app / view / map,
  app / view / page_404,
)

#' @export
ui <- function(id) {
  ns <- NS(id)

  fluidPage(
    tags$nav(
      class = "navbar",
      tags$ul(
        class = "nav navbar-nav",
        tags$li(
          a("Home", href = route_link("/"))
        ),
        tags$li(
          a("Map", href = route_link("map"))
        )
      )
    ),
    router_ui(
      route("/", home$ui(ns("home"))),
      route("map", map$ui(ns("map"))),
      page_404 = page_404$ui(ns("page_404"))
    )
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    router_server("/")

    # Datasets are the only case when you need to use :: in `box`.
    # This issue should be solved in the next `box` release.
    data <- rhino::rhinos

    home$server("home")
    map$server("map")
  })
}
