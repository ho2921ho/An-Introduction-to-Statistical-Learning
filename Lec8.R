install.packages("tree")

library(tree)
library(ISLR)
attach(Carseats)
High = ifelse(Sales <=8,"No","Yes")
Carseats = data.frame(Carseats, High)
tree.carseats = tree(High ~.-Sales,Carseats)

summary(tree.carseats)

plot(tree.carseats)
text(tree.carseats, pretty = 0)

set.seed(2)

train = sample(1:nrow(Carseats),200)
Car.test = Carseats[-train,]
High.test = High[-train]
tree.carseats = tree(High~.-Sales,Carseats, subset = train)
tree.pred = predict(tree.carseats, Car.test, type = "class")
table(tree.pred,High.test)

