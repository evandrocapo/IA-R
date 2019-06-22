# Import do dataset
plot(Mall_Customers)

shopping <- Mall_Customers

# Tira Coluna do ID
shopping$CustomerID = NULL
#View(shopping)

# Tira Coluna do Score
shopping$Spending.Score..1.100. = NULL
#View(shopping)

# Tira Coluna do Gender
shopping$Gender = NULL

# Definir quantidade otima de cluster
#install.packages("FactoMineR")
#install.packages("factoextra")
library("FactoMineR")
library("factoextra")

plot(Mall_Customers[c("Annual.Income..k..","Age")])

results <- kmeans(shopping, 2)
results$cluster

results$size

for(z in 1:95){
  if(results$cluster[z] != 2 ){
    results$cluster[z] = 7
  }
}
for(z in 96:200){
  if(results$cluster[z] != 1 ){
    results$cluster[z] = 7
  }
}

fviz_cluster(results, data = shopping)

plot(Mall_Customers[c("Age","Annual.Income..k..")], col = results$cluster)