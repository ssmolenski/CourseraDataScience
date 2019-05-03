library(shiny)
shinyServer(function(input, output) {
  output$val <- renderText(input$slider1 * input$slider2)
})