# # # Lesson 1: Graphs

# # The principles of presenting data effectively:

# 1. Show some comparison
# 2. Show causality or some mechanism (ie, make a guess at the cause of trends)
# 3. Multivariate data - Don't restrict yourself to two variables. Consider other variables or breaking data into groups, etc. to uncover trends
# 4. Integrate evidence: Don't let the tool drive the analysis. Use words, numbers, images, and diagrams to show the most complete picture.
# 5. Document everything. Record your sources and keep your scripts.
# 6. Content is king


# # Exploratory Graphs
# We use exploratory graphs to: understand data properties, to find patterns in data, to suggest modeling strategies, and to debug analysis.

#First look at the data:
head(data)
summary(data)
quantile(data)

#Then plot potentially interesting variables to explore
boxplot(data)
#Once base-package plots are made, they can be added to by calling more commands:
abline(h=12,lwd=2) #Adds a horizontal line to the graph 

hist(data,breaks=20) #Too many or too few breaks can be problematic
rug(data)

barplot(data,main="Main title")

boxplot(pm25~region,data=data) #The first argument, y ~ x, tells the boxplot that the first variable depends on the second.

?par #The help page has all of the arguments/customization options for base-package plotting functions.
names(par())

par(mfrow=c(2,1)) #All plots done after setting this will show up in two rows and one column.

with(data,plot(col1,col2)) #The with command tells plot where to look for the data col1 and col2.

plot(data$col1,data$col2,col=data$col3) #The third argument separates the data into color groups based on their value in column 3
title(main="Title of Plot")
legend("topright",pch=c(17,8),col=c("blue","red"),legend=c("thing 1", "thing 2"))

?Devices
#pdf(file="filename.pdf") #creates pdf
#Now when you plot, it will go to this pdf instead of a window
#dev.off() #Closes the current graphics device
#dev.cur() #tells current device

#dev.copy(filetype, "filename") #copies from device to file


# # # Plotting Systems

# # Lattice System
#Everything specified in a single function call
xyplot(col1~col2 | col3,data=data,layout=c(2,2))

# # ggplot2
qplot(col1,col2,data=data)