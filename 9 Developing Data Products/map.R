library(leaflet)
setwd("C:\\Users\\Sarah\\Documents\\DataScience\\CourseraSpecialization\\9 Developing Data Products")

data <- read.csv("leafletdat.csv")

data %>% 
    leaflet() %>%
    setView(lng = -98, lat = 39, zoom=05) %>%
    addTiles() %>%
    addCircles(weight=1, radius=data$precip*1000)