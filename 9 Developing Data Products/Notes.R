# library(shiny)

# # A shiny project is a directory contining at least two files:
# # ui.R (for user interface) controls how your app looks.
# # server.R controls what your app does

# # Can run apps directly from RStudio OR
# setwd("C:\\Users\\Sarah\\Documents\\DataScience\\CourseraSpecialization\\9 Developing Data Products")
# runApp()

# # All standard html tags exist in shiny, including heading tags h1() through
# # h6(), p(), a(), div(), and span(). See ?builder for more details.

# # Take input from a slider with the sliderInput() function
# # Define output in the server function with output$variable_name
# # It can then be output on the app with textOutput("variable_name")

# # Reactivity:
# # In server, define functions with 
# # model <- reactive({
# #     data<-input$data1
# #     lm(data$y~data$x, data=data)
# # })
# # Then the function model() will change when user input changes. To call the (variable)
# # linear model above, simply use model()

# # Delayed Reactivity:
# # To prevent app from running until told, include a submit button: submitButton("Submit")

# # Changing layout:
# # Can make more complex app layout with tabs, using:
# # mainPanel(
# #    tabsetPanel(type="tabs",
# #                tabPanel("Tab 1", br(), textOutput("out1")),
# #                tabPanel("Tab 2", br(), textOutput("out2")),
# #                tabPanel("Tab 3", br(), textOutput("out3"))
# #    )
# #)

# # Interactive Graphics
# # Can pass plotOutput an argument brush = brushOpts(id="brush1")
# # Access brushed points in server with brushedPoints(data, input$brush1, xvar, yvar)

# # Ployly
# library(plotly)

# # Interactive graphics that can be embeded in web apps or ever knitr documents.
# plot_ly(data, x, y,mode="markers") #scatterplot
# plot_ly(data,x,y) #Not setting mode defaults to a line graph
# plot_ly(data,x,type="histogram")
# plot_ly(data,y,type="box", color=x)
# plot_ly(z=matrix,type="heatmap")
# plot_ly(z=matrix,type="surface") # Remember that smoothing will be done automatically in this graphic!

# gg <- ggplotly(p) # Convert a ggplot, p, to a plotly interactive graphic
# plotly_POST(gg) # Post an interactive graphic on plotly's site. Can be edited in-window. Must have plotly username and api key set.


# Leaflet
# Leaflet is a Javascript library for creating interactive maps without knowing Java
#library(leaflet)
my_map <- leaflet() %>%
    addTiles() %>%
    addMarkers(lat=39.2980803, lng=-76.5898801, 
                popup="Jeff Leek's Office")
# my_map

# Popup text can be turned into links with html code:

my_map <- leaflet() %>%
    addTiles() %>%
    addMarkers(lat=39.2980803, lng=-76.5898801, 
                popup="<a href='https://leekspin.com/'>Jeff Leek's Office</a>")
# my_map

#Clusters markers when zoomed out. Use for multiple markers.
my_map <- leaflet() %>%
    addTiles() %>%
    addMarkers(lat=39.2980803, lng=-76.5898801, 
                popup="Jeff Leek's Office",
                clusterOptions = markerClusterOptions()) 
# my_map

# Add shapes to maps, perhaps to indicate a city's population or some other region.

my_map <- leaflet() %>%
    addTiles() %>%
    addCircles(lat= 39.2920592, lng=-76.6077852 ,weight=1, radius=sqrt(619493)*30) %>%
    addRectangles(lat1=39.3858, lng1=-76.0595,
                    lat2=39.4058, lng2=-76.0895, col="red") %>%
    addLegend(labels=c("Circle", "Rectangle"), colors=c("blue", "red"))
my_map



