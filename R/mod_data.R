#' data UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_data_ui <- function(id){
  ns <- NS(id)
  tagList(

    fluidRow(
      column(12,
             box(title = "Raw Data",
                 status = "white",
                 solidHeader = TRUE,
                 collapsible = TRUE,
                 elevation = 3,
                 width = 12,
                 collapsed = F,
                 dataTableOutput(ns("rawtable"))),
             box(title = "Summary statistics",
                 status = "white",
                 solidHeader = TRUE,
                 collapsible = TRUE,
                 elevation = 3,
                 width = 12,
                 collapsed = T,
                 verbatimTextOutput(ns("summary")))
      )
    )
  )
}

#' data Server Functions
#'
#' @noRd
mod_data_server <- function(id,exampleMeta){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    # Render and output raw data and summary

    ## Input and read data

    data <- reactive({
      req(exampleMeta())
      path <- file.path("data-raw",paste0("cow", exampleMeta(), "Cant1997.csv"))

      df <- read.csv(path,
                     sep = ",",
                     header = T
      )
      df <- df %>%
        mutate(across(1:5, as.factor))


      return(df)
    })


    output$rawtable <- OutputTableRender(data())

    #output summary statistics
    output$summary <- renderPrint({
      skim(data())
    })

  })
}

## To be copied in the UI
# mod_data_ui("data_1")

## To be copied in the server
# mod_data_server("data_1")
