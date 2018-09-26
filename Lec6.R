library(ISLR)
fix(Hitters)
## fix의 기능?
names(Hitters)
dim(Hitters)
Hitters = na.omit(Hitters)

install.packages("leaps")
library(leaps)
regfit.full = regsubsets(Salary~., Hitters, nvmax = 19)
reg.summary= summary(regfit.full)
names(reg.summary)

par(mfrow = c(2,2))
plot(reg.summary$rss, main = "RSS", type = "l")
plot(reg.summary$adjr2, main = "adjr2", type = "l")
which.max(reg.summary$adjr2)
points(11,reg.summary$adjr2[11],col = "red")

plot(regfit.full, scale = "bic")
plot(regfit.full, scale = "adjr2")

Hitters[1,]
set.seed(1)

train = sample(263,132)
