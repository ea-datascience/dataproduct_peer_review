# Load packages
library(d3Network)
library(igraph)

erdos.renyi <- function(input) {
    numberOfNodes = input$numberOfNodes
    connectivity  = input$connectivity
    opacity       = input$slider
    directedGraph = input$directedGraph
    loops         = input$loops
    
    # Instantiating the erdos.renyi graph
    g <- erdos.renyi.game(numberOfNodes, connectivity, type=c('gnp'),
                          directed = directedGraph, loops = loops)       
    
    d3ForceNetwork(Links = get.data.frame(g),
                   Nodes = data.frame(name = seq(1,numberOfNodes + 1)),
                   Source = "from", Target = "to",
                   width = 800, height = 600,
                   opacity = opacity, standAlone = FALSE,
                   parentElement = '#networkPlot')   
}


#### Shiny ####
shinyServer(function(input, output) {

    currentGraph <- reactive({erdos.renyi(input)})
    
    output$networkPlot <- renderPrint({
        currentGraph()
    })
})