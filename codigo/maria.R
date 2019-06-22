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
View(shopping)

# Tira Coluna do Score
