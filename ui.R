require(rCharts)
shinyUI(pageWithSidebar(
    headerPanel("Interactive Charts"),
    
    sidebarPanel(
        selectInput(inputId = "x",
                    label = "Choose X",
                    choices = c('SepalLength', 'SepalWidth', 'PetalLength', 'PetalWidth'),
                    selected = "SepalLength"),
        selectInput(inputId = "y",
                    label = "Choose Y",
                    choices = c('SepalLength', 'SepalWidth', 'PetalLength', 'PetalWidth'),
                    selected = "SepalWidth")
    ),
    mainPanel(
        tabsetPanel(id="foobar", type="pills", position="above",
            tabPanel(title="chart1",
                     fluidRow(chartOutput("chart1", "polycharts"))
            ),
            tabPanel(title="chart2",
                     fluidRow(chartOutput("chart2", "polycharts"))
            ),
            tabPanel(title="chart3",
                     fluidRow(chartOutput("chart3", "nvd3"))
            ),
            tabPanel(title="chart4",
                     fluidRow(chartOutput("chart4", "nvd3"))
            ),
            tabPanel(title="chart5",
                     fluidRow(chartOutput("chart5", "nvd3"))
            ),
            tabPanel(title="chart6",
                     fluidRow(chartOutput("chart6", "nvd3"))
            ),
            tabPanel(title="chart7",
                     fluidRow(chartOutput("chart7", "nvd3"))
            ),
            tabPanel(title="chart8",
                     fluidRow(chartOutput("chart8", "nvd3"))
            ),
            tabPanel(title="chart9",
                     fluidRow(chartOutput("chart9", "nvd3"))
            ),
            tabPanel(title="chart10",
                     fluidRow(chartOutput("chart10", "nvd3"))
            ),
            tabPanel(title="chart11",
                     fluidRow(chartOutput("chart11", "nvd3"))
            ),
            tabPanel(title="chart12",
                     fluidRow(chartOutput("chart12", "nvd3"))
            ),
            tabPanel(title="chart13",
                     fluidRow(chartOutput("chart13", "morris"))
            ),
            tabPanel(title="chart14",
                     fluidRow(chartOutput("chart14", "highcharts"))
            )       
        )
    )
))