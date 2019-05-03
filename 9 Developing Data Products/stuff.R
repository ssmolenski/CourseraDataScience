library(shiny)
library(rsconnect)

setwd('CourseraSpecialization\\9 Developing Data Products\\Assignment 4')

#runApp()


rsconnect::setAccountInfo(name='', token='', secret='')
deployApp()