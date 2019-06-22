shopping <- Mall_Customers
shop <- Mall_Customers

# Tira Coluna do ID
shopping$CustomerID = NULL
#View(shopping)

# Tira Coluna do Score
shopping$Spending.Score..1.100. = NULL
#View(shopping)

# Tira Coluna do Gender
#shopping$Gender = NULL

plot(shopping)
View(shopping)

#treino e teste
set.seed(runif(1, 0, 1000))
train_ind <- sample(seq_len(nrow(shopping)), size = 160)
train <- shopping[train_ind, ]
test <- shopping[-train_ind, ]

#Graficos
plot(train)
plot(test)

results <- kmeans(shopping, 4)
results

plot(shop$Annual.Income..k..,results$cluster)
