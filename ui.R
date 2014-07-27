library(shiny)

shinyUI(fluidPage(
    
    # Load D3.js
    tags$head(
        tags$script(src = 'http://d3js.org/d3.v3.min.js')
    ),
    
    # Application title
    titlePanel('Erdos-Renyi graph demo application'),
    p('This application allows the user to try different parameters of a ',
      'Erdos-Renyi random graph.'
    ),
    p('This application is uses the igraph package to generate the graphs ',
      'and the d3Network library to render the interactive graphs.'),
    
    # Sidebar with a slider input for node opacity
    sidebarLayout(
        sidebarPanel(
            sliderInput('slider', label = 'Choose node opacity',
                        min = 0, max = 1, step = 0.01, value = 0.5
            ),
            
            numericInput('numberOfNodes','Number of nodes:',50, max = 100, min = 2, step = 1),
            numericInput('connectivity','Connectivity:',.05, min = 0.01, max = 1, step = .01),
            
            selectInput('directedGraph','Directed Graph',
                        choices = c(FALSE, TRUE)),
            
            selectInput('loops','Loops', 
                        choices = c(FALSE, TRUE))
            
        ),
        
        # Show network graph
        mainPanel(
            htmlOutput('networkPlot')
        )
    )
))