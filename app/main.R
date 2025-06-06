box::use(
  shiny[moduleServer, NS],
  shiny.router[router_ui, route, router_server],
  shinycssloaders[showPageSpinner, hidePageSpinner],
  shiny[div],
  bslib[page_fillable]
)

box::use(
  app / view / map,
  app / view / home,
  app / view / page_not_found,
  app / view / root
)

ROOT_PAGE <- "root"
HOME_PAGE <- "home"
MAP_PAGE <- "map"
PAGE_404 <- "page_404"


#' @title Main Application UI Module
#'
#' @description
#' This UI module serves as the root layout for the entire application, incorporating different pages through routing mechanisms.
#' It includes navigation buttons for accessing various pages such as Home, Map, and 404.
#' The UI is built with a flexible and responsive layout that allows users to easily switch between pages.
#'
#' The main UI components include:
#' - **Root Layout**: Uses the `Root` module to define the main layout.
#' - **App Menu**: Provides navigation buttons for accessing the different sections of the app.
#' - **Router UI**: Defines the routes for different pages such as Home, Map, and 404.
#'
#' @param id A unique identifier for the module, used to create distinct namespaces for each UI element.
#'
#' @return A Shiny UI element that provides the overall layout for the application, including navigation and routing.
#'
#' @examples
#' # In a Shiny app, the UI can be integrated as follows:
#' ui <- fluidPage(
#'   main_app_ui("app")
#' )
#'
#' @export
ui <- function(id) {
  ns <- NS(id)

  page_fillable(
    div(
      class = "app-container",
      root$ui(id = ns(ROOT_PAGE)),
      router_ui(
        route("/", home$ui(id = ns(HOME_PAGE))),
        route(MAP_PAGE, map$ui(id = ns(MAP_PAGE))),
        page_404 = page_not_found$ui(id = ns(PAGE_404))
      )
    )
  )
}

#' @title Main Application Server Module
#'
#' @description
#' This server module manages the routing and backend logic for the main application pages. It initializes the server components for each of the pages defined in the UI.
#'
#' The main server components include:
#' - **Routing Server**: Manages the routing logic using `router_server()` to dynamically serve different pages.
#' - **Page Server Initialization**: Initializes the server-side logic for each of the individual pages, such as HomePage, MapPage
#'
#' @param id A unique identifier for the module, ensuring all reactive components are properly namespaced.
#'
#' @return None. The module sets up the reactive backend logic for the different pages of the application.
#'
#' @examples
#' # In a Shiny app, the server can be integrated as follows:
#' server <- function(input, output, session) {
#'   main_app_server("app")
#' }
#'
#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # Show loading spinner
    showPageSpinner(
      color = "#410280",
      caption = "Loading..."
    )

    # Initialize router
    router_server()

    # Initialize server modules
    root$server(ROOT_PAGE)
    home$server(HOME_PAGE)
    map$server(MAP_PAGE)

    # Hide spinner after initialization
    hidePageSpinner()
  })
}
