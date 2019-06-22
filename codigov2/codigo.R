# Import do dataset
plot(Mall_Customers)

shopping <- Mall_Customers

# Tira Coluna do ID
shopping$CustomerID = NULL
#View(shopping)

# Tira Coluna do Score
shopping$Age = NULL
#View(shopping)

# Tira Coluna do Gender
shopping$Gender = NULL

# Definir quantidade otima de cluster
#install.packages("FactoMineR")
#install.packages("factoextra")
library("FactoMineR")
library("factoextra")

results <- kmeans(shopping, 7, nstart = 10)
results$cluster

results$size



fviz_cluster(results, data = shopping)

plot(Mall_Customers[c("Annual.Income..k..","Spending.Score..1.100.")], col = results$cluster)

