box::use(
  shiny[moduleServer, NS, titlePanel, fluidPage],
  leaflet[
    leaflet,
    addTiles,
    setView,
    addMarkers,
    leafletOutput,
    renderLeaflet,
    `%>%`
  ]
)

#' @export
#' @title Map Page UI
#' @description This module provides the UI for the map page.
#' @param id The ID of the module.
#' @return A Shiny UI element that represents the map page.
#' @examples
#' ui <- map_page_ui("map")
#' server <- map_page_server("map")
ui <- function(id) {
  ns <- NS(id)
  fluidPage(
    titlePanel("Karangahape Road Map"),
    leafletOutput(ns("map"), height = "600px")
  )
}

#' @export
#' @title Map Page Server
#' @description This module provides the server for the map page.
#' @param id The ID of the module.
#' @return A Shiny server function that represents the map page.
#' @examples
#' server <- map_page_server("map")
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$map <- renderLeaflet({
      leaflet() %>%
        addTiles() %>%
        setView(lng = 174.7633, lat = -36.8575, zoom = 16) %>%
        addMarkers(
          lng = 174.7633,
          lat = -36.8575,
          popup = "Karangahape Road, Auckland"
        )
    })
  })
}
