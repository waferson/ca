#############################################################################
# IE Business School
# Customer Analytics with R
# S8 - Customer Segmentation
# @JosepCurto | jcurto@faculty.ie.edu | 2018
# Version: 2.0
#############################################################################

# Clear console
cat("\f")

# Clear plots
graphics.off()

# Cleaning the environment
rm(list=ls())

# List of packages for session
.packages = c("ggplot2", "NbClust","ggfortify","GGally","cluster","factoextra","clustertend")

# Install CRAN packages (if not already installed)
.inst <- .packages %in% installed.packages()
if(length(.packages[!.inst]) > 0) install.packages(.packages[!.inst])

# Load packages into session 
lapply(.packages, require, character.only=TRUE)

## Seed
set.seed(1234)

# Load data
data <- read.csv('data/s8.csv', header = T,sep=',')

# Data Structure
str(data)

# Statistics summary
summary(data)

# Correlation
ggcorr(data, label = TRUE, label_size = 4, label_round = 2, size = 2)

# Clustering Tendency: Hopkins Statistic
hopkins(data,n = nrow(data)-1)

# PCA
pca <- prcomp(data, scale=TRUE)
pca

# PCA summary
summary(pca)

# PCA plot
screeplot(pca, type="lines",col=3)

# pc1 vs pc2}
autoplot(pca, data = data)

# Tweaking the previous plot
autoplot(pca, data = data, colour = 'Channel')

# Adding eigen values/vectors
autoplot(pca, data = data, colour = 'Channel', loadings = TRUE, loadings.colour = 'blue',
         loadings.label = TRUE, loadings.label.size = 3)

# Data normalization
df <- scale(data) 

# Elbow method
fviz_nbclust(df, kmeans, method = "wss") +
  geom_vline(xintercept = 3, linetype = 2)

# Average silhouette method
fviz_nbclust(df, kmeans, method = "silhouette")

# NbClust
res <- NbClust(df, diss=NULL, distance = "euclidean", min.nc=2, max.nc=20, 
               method = "kmeans", index = "all")
fviz_nbclust(res) + theme_minimal()

# Kmeans
fit <- kmeans(df, centers = 2, nstart = 20)

# Centers and size
fit$centers
fit$size

# Average points
clusters <- aggregate(data,by=list(fit$cluster),FUN=mean)
clusters

# Adding clusters to the original data
data_cluster <- data.frame(data, Cluster = fit$cluster)
head(data_cluster)

# Plot using clusters to color the data
ggplot(data, aes(Fresh, Detergents_Paper, color = as.factor(fit$cluster))) + geom_point()

# Clustering validation
sil <- silhouette(fit$cluster, dist(df))
fviz_silhouette(sil)
neg_sil_index <- which(sil[, "sil_width"] < 0)
sil[neg_sil_index, , drop = FALSE]