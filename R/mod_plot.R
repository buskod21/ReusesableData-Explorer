#' plot UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_plot_ui <- function(id){
  ns <- NS(id)
  tagList(
    # The plot tab with option to select X and Y variable.
    #The X and Y will be updated after loading the data
    fluidRow(
      column(3,
             box(title = "Select Plot Type",
                 status = "white",
                 solidHeader = TRUE,
                 collapsible = F,
                 elevation = 3,
                 width = 12,
                 awesomeRadio(
                   inputId = ns("button"),
                   label = "Plot type",
                   choices = c("Boxplot","Scatter plot"),
                   selected = "Boxplot",
                   inline = TRUE
                 )),

             box(title = "Select Variables",
                 status = "white",
                 solidHeader = TRUE,
                 collapsible = F,
                 elevation = 3,
                 width = 12,
                 selectInput(ns("Xvar"),
                             "X",
                             choices = ""),
                 selectInput(ns("Yvar"),
                             "Y",
                             choices =""))),
      column(9,
             box(title = "Plot Area",
                 status = "white",
                 solidHeader = TRUE,
                 collapsible = F,
                 elevation = 3,
                 width = 12,
                 plotOutput(ns("plot"))
             )
      )
    )
  )
}

#' plot Server Functions
#'
#' @noRd
mod_plot_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_plot_ui("plot_1")

## To be copied in the server
# mod_plot_server("plot_1")
