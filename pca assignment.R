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


clus_data<-mydata[,15:17]
clus_data


norm_clus<-scale(clus_data)
dist1<-dist(norm_clus,method = "euclidean")


fit1<-hclust(dist1,method="complete")
plot(fit1, hang=-1)


groups<-cutree(fit1,5)

membership_1<-as.matrix(groups)
View(membership_1)


final1<-cbind(membership_1,mydata)
View(final1)

View(aggregate(final1[,-c(2,15:17)],by=list(membership_1),FUN=mean))


write.csv(final1,file="wine.csv",row.names = F,col.names = F)
getwd()
