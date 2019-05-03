library(shiny)
library(leaflet)

shinyUI(fluidPage(
    h1("April 18, 2019"),
    h3("Precipitation in Major US Cities"),
    leafletOutput("mymap")
))

