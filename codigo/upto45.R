# Import do dataset
plot(Mall_customers_upto45)

shopping <- Mall_customers_upto45

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
results <- kmeans(shopping, 2)
results
results$cluster

#Quantidade de cada
results$size

#Cor por idade
for(z in 1:39){
  if(results$cluster[z] != 2 ){
    results$cluster[z] = 7
  }
}
for(z in 40:68){
  if(results$cluster[z] != 1 ){
    results$cluster[z] = 7
  }
}
for(z in 69:90){
  if(results$cluster[z] != 1 ){
    results$cluster[z] = 7
  }
}
for(z in 91:97){
  if(results$cluster[z] != 3 ){
    results$cluster[z] = 7
  }
}
for(z in 98:134){
  if(results$cluster[z] != 4 ){
    results$cluster[z] = 7
  }
}


#fviz graphic
fviz_cluster(results, data = shopping)

results$size
results$cluster

plot(Mall_Customers[c("Annual.Income..k..","Spending.Score..1.100.")], col = results$cluster)

#1 = preto
#2 = vermelho
#3 = verde
#4 = Azul Escuro
#5 = Azul Ciano
#7 = amarelo

