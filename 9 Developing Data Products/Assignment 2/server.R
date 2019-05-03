library(shiny)
library(leaflet)

shinyServer(function(input, output) {
    data <- read.csv("./Data/leafletdat.csv")


    output$mymap <- renderLeaflet({
        data %>% 
            leaflet() %>%
            setView(lng = -98, lat = 39, zoom=05) %>%
            addTiles() %>%
            addCircles(weight=1, radius=data$precip*1000)
  })
})
