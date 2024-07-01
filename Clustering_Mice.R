# Load libraries
library(stats)
library(factoextra)
library(NbClust)
library(ggplot2)
library(GGally)
 
# Scale dataframe and estimate k
df<-scale(d)
fviz_nbclust(df, kmeans, method="wss")
fviz_nbclust(df, kmeans, method="silhouette")
NbClust(df, diss=NULL, distance="euclidean", min.nc=2, max.nc=10, method="kmeans")

# Compute k-means
set.seed(1)
km<-kmeans(df, centers=3, nstart=25)
km_mean<-aggregate(df, by=list(cluster=km$cluster), mean)
km_final<-cbind(df, cluster=km$cluster)
 
# Visualise the clusters and generate a parallel coordinate plot
fviz_cluster(km, data=df)
ggparcoord(km_mean, columns=2:7, groupColumn=1)
