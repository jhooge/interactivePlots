require(rCharts)
shinyServer(function(input, output) {
    output$chart1 <- renderChart({
        names(iris) = gsub("\\.", "", names(iris))
        p <- rPlot(input$x, input$y, data = iris, 
                    color = "Species", 
                    facet = "Species", 
                    type = 'point')
        p$addParams(dom = 'chart1')
        return(p)
    })
        
    output$chart2 <- renderChart({
        hair_eye <- as.data.frame(HairEyeColor)
        p2 <- rPlot(Freq ~ Hair | Eye, 
                    color = "Eye",
                    data = hair_eye,
                    type = "bar")
        p2$addParams(dom = 'chart2')
        return(p2)
    })
    
    output$chart3 <- renderChart({
        hair_eye_male <- subset(as.data.frame(HairEyeColor), Sex == "Male")
        p <- nPlot(Freq ~ Hair, group = 'Eye', data = hair_eye_male, 
                   type = 'multiBarChart')
        p$addParams(dom = "chart3")
        return(p)
    })
    
    output$chart4 <- renderChart({
        dat <- data.frame(
            t = rep(0:23, each = 4), 
            var = rep(LETTERS[1:4], 4), 
            val = round(runif(4*24,0,50))
        )
        p <- nPlot(val ~ t, group =  'var', data = dat, 
                    type = 'stackedAreaChart', id = 'chart4')
        p$addParams(dom = "chart4")
        return(p)
    })
    
    output$chart5 <- renderChart({
        p <- nPlot(mpg ~ wt, group = 'cyl', data = mtcars, type = 'scatterChart')
        p$xAxis(axisLabel = 'Weight (in lb)')
        p$addParams(dom = "chart5")
        return(p)
    })
    
    output$chart6 <- renderChart({
        p <- nPlot(~ cyl, data = mtcars, type = 'pieChart')
        p$addParams(dom = "chart6")
        return(p)
    })
    
    output$chart7 <-  renderChart({
        p <- nPlot(~ cyl, data = mtcars, type = 'pieChart')
        p$chart(donut = TRUE)
        p$addParams(dom = "chart7")
        return(p)
    })
    
    output$chart8 <-  renderChart({
        p <- nPlot(uempmed ~ date, data = economics, type = 'lineChart')
        p$addParams(dom = "chart8")
        return(p)
    })
    
    output$chart9 <-  renderChart({
        ecm <- reshape2::melt(economics[,c('date', 'uempmed', 'psavert')], id = 'date')
        p <- nPlot(value ~ date, group = 'variable', data = ecm, type = 'lineWithFocusChart')
        p$addParams(dom = "chart9")
        return(p)
    })
    
    output$chart10 <-  renderChart({
        ecm <- reshape2::melt(economics[,c('date', 'uempmed', 'psavert')], id = 'date')
        p <- nPlot(value ~ date, group = 'variable', data = ecm, type = 'lineChart')
        p$xAxis( tickFormat="#!function(d) {return d3.time.format('%b %Y')(new Date( d * 86400000 ));}!#" )
        #try new interactive guidelines feature
        p$chart(useInteractiveGuideline=TRUE)
        p$addParams(dom = "chart10")
        return(p)
    })
    
    output$chart11 <-  renderChart({
        p <- nPlot(mpg ~ wt, data = mtcars, group = "gear", type = "scatterChart")
#         p$params$facet = "cyl"
        p$addParams(dom = "chart11", facet = "cyl")
        return(p)
    })
    
    output$chart12 <-  renderChart({
        p <- nPlot(uempmed ~ date, data = economics, type = 'sparklinePlus',height=100,width=500)
        p$chart(xTickFormat="#!function(d) {return d3.time.format('%b %Y')(new Date( d * 86400000 ));}!#")
        p$addParams(dom = "chart12")
        return(p)
    })
    
    output$chart13 <- renderChart({
        data(economics, package = "ggplot2")
        econ <- transform(economics, date = as.character(date))
        p <- mPlot(x = "date", y = c("psavert", "uempmed"),
                   type = "Line", data = econ)
        p$set(pointSize = 0, lineWidth = 1)
        p$addParams(dom = "chart13")
        return(p)
    })
    
    output$chart14 <- renderChart({
        p <- hPlot(Pulse ~ Height, 
                   data = MASS::survey, 
                   type = "bubble",
                   title = "Zoom demo", 
                   subtitle = "bubble chart", 
                   size = "Age", 
                   group = "Exer")
        p$chart(zoomType = "xy")
        p$chart(backgroundColor = NULL)
        p$set(dom = 'chart14')
        return(p)
    })
})