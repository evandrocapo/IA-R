# Import do dataset
plot(Mall_Customers)

shopping <- Mall_Customers

# Quantidade de Linhas e Colunas
nrow(shopping)
ncol(shopping)

# Grafico
plot(shopping)

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
fviz_nbclust(shopping, kmeans, method = "gap_stat")

#K-Means Genero
results <- kmeans(shopping, 5)
results
results$cluster

#Quantidade de cada
results$size

#Cor por idade
for(z in 1:31){
  if(results$cluster[z] != 5 ){
    results$cluster[z] = 7
  }
}
for(z in 32:81){
  if(results$cluster[z] != 2 ){
    results$cluster[z] = 7
  }
}
for(z in 82:139){
  if(results$cluster[z] != 1 ){
    results$cluster[z] = 7
  }
}
for(z in 140:159){
  if(results$cluster[z] != 3 ){
    results$cluster[z] = 7
  }
}
for(z in 160:200){
  if(results$cluster[z] != 4 ){
    results$cluster[z] = 7
  }
}


#fviz graphic
fviz_cluster(results, data = shopping)

results$size
results$cluster

plot(Mall_Customers[c("Age","Spending.Score..1.100.")], col = results$cluster)

#1 = preto
#2 = vermelho
#3 = verde
#4 = Azul Escuro
#5 = Azul Ciano
#7 = amarelo

