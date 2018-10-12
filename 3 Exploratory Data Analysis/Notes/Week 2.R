##############################################################################
#                                Fun with Colors!                            #
##############################################################################

# Package contains support for creating color palettes and using various fonts
library(grDevices)

#It contains a pre-defined vector, containing all of the names of colors within the package. All these names can be used with any 'col=' argument for plot (etc) functions once the package is loaded
colors()

#colorRamp creates a function, which will then take a number between 0 and 1, and return a matrix of colors along the gradient specified:
redblue<-colorRamp(colors=("red","blue")) #initialize the function
redblue(0) #returns the rgb value of "red" as a matrix
redblue(1) #returns the rgb value of "blue" as a matrix
redblue(seq(0,1,by=.1)) #returns a 10x3 matrix with 10 colors forming a gradient from red to blue

#colorRampPalette creates a function that takes a number and returns a vector of that length of hexcodes for a gradient of colors
rb<-colorRampPalette(colors=c("red","blue"))
barplot(seq(1:10),col=rb(10))


color.scale


#This library has built in color palettes that can be used for various different situations.
library(RColorBrewer)

#Create a color palette of n colors from one of the library's pre-made palettes
p<-brewer.pal(9,"Greens")
barplot(seq(1:9),col=p)


##############################################################################
#                                    GG2Plot                                 #
##############################################################################
library(ggplot2)
data(mtcars)

#qplot is a quick way of plotting data:
qplot(disp,hp,data=mtcars,color=factor(cyl))#scatterplot
qplot(factor(cyl), wt, data=mtcars, geom="boxplot") #boxplot
qplot(mpg, data=mtcars, fill=factor(cyl)) #histogram
qplot(mpg, data=mtcars, geom="density") #density plot
qplot(mpg,wt,data=mtcars,facets=vs~am) #splits into panels with factor values as columns (.~ means nothing is in the y direction. ie, there are no rows, only columns of graphs)
qplot(disp,hp,data=mtcars)+geom_smooth(method="lm",se=FALSE) #Add linear regression line. Second arguments turns off standard error shading


#ggplot is a more intensive plotting function with more options. By itself, it does not create a plot and is used in conjunction with '+...' statements to produce plots.
g<-ggplot(mtcars,aes(mpg,disp)) #initializes the plot object
g+geom_point(color="seagreen", size=2, alpha=1/2) #add points
g+geom_point(aes(color=factor(cyl))) #Group points by color
g+geom_smooth() #add a fit line
g+geom_point()+facet_grid(vs~am) #plots in facets/panels
g+geom_point()+xlab("Miles per Gallon")+ylab("Displacement")+ggtitle("mtcars") #labeling axes
g+geom_point()+labs(title="TITLE", subtitle="SUB",caption="CAPTION",tag="TAG") #Other text

#There are also various 'themes' to change the overall look of the plot
g+geom_point()+theme_bw()

#If you want to use a continuous variable to group the data, it can be cut with cut()
cutpoints<-quantile(data$mpg, na.rm=TRUE)
data$mpg2<-cut(mtcars$mpg,cutpoints) #mpg2 is a factor
qplot(disp,hp,data=mtcars,color=mpg2)