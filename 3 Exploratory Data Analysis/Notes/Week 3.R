#Hierarchal Clustering

distances<-dist(df)
hc<-hclust(distances)
plot(hc)
plot(as.dendrogram(hc))

#Complete linkage: the distance between two clusters is equal to the greatest distance between the pairs of points in those clusters.
#Average linkage: the distance between two clusters is equal to the "average" point in each cluster (ie, the center of mass)
#Try different methods to see how your data changes.

heatmap(mtcars)


#K-Means Clustering

kmeans(mat, centers, iter.max, nstart)

#Principle Component Analysis and Singular Value Decomposition

image(mat)
heatmap(mat)

set.seed(678910)
for(i in 1:40){
  # flip a coin
  coinFlip <- rbinom(1,size=1,prob=0.5)
  # if coin is heads add a common pattern to that row
  if(coinFlip){
    dataMatrix[i,] <- dataMatrix[i,] + rep(c(0,3),each=5)
  }
}

svd(mat)

svd(scale(mat))
prcomp(scale(mat))