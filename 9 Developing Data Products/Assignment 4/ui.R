library(shiny)
shinyUI(fluidPage(
  titlePanel("Shiny App Demo"),
  sidebarLayout(
    sidebarPanel(
        h1("Welcome!"),
        h6("This is a simple demo of shinyapps. It takes two numbers from sliders and returns their product. Simply choose some values to get started."),
        h2("First Value"),
        sliderInput("slider1", "Choose a number", 0, 100, 0),
        h2("Second Value"),
        sliderInput("slider2", "Choose a number", 0, 100, 0)
    ),
    mainPanel(
      h3("Product"),
      textOutput("val")
    )
  )
))