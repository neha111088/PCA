View(wine)
help(princomp)

View(wine[-1])

attach(wine)

cor(wine)

pcaObj<-princomp(wine[-1], cor = TRUE, scores = TRUE, covmat = NULL)

summary(pcaObj)
loadings(pcaObj)

plot(pcaObj)

pcaObj$scores

pcaObj$scores[,1:3]

mydata<-cbind(wine,pcaObj$scores[,1:3])
View(mydata)

install.packages("openxlsx")
library(openxlsx)

my_data <- mydata[1:178,c(2:17)]
View(my_data)

normalised_data <- scale(my_data[,1:16])
View(normalised_data)

fit <- kmeans(normalised_data, 4)
str(fit)


fit$centers
fit$cluster


final<- data.frame(my_data, fit$cluster)
View(final)


final1 <- final[,c(ncol(final),1:(ncol(final)-1))]
View(final1)

aggregate(mydata[,1:4], by= list(fit$cluster), FUN = mean)


install.packages("factoextra")
library(factoextra)


fviz_nbclust(mydata,kmeans,method="wss")+labs(subtitle = "Elbow method")




