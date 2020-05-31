library(ggplot2)

coffee <- read.csv('weights.csv')

coffee$Difference <- (coffee$After - coffee$Before)

qplot(x = BagType, y = Difference, data=coffee, geom = "boxplot")

with(coffee,unlist(lapply(split(Difference,BagType),length)))
with(coffee,unlist(lapply(split(Difference,BagType),mean)))

coffee.aov <- aov(Difference~BagType, data = coffee)
anova(coffee.aov)

qplot(Difference, data=coffee, geom="histogram") + facet_grid(BagType ~ .)

plot(coffee.aov,which=1)

qqnorm(coffee$Difference)

qqline(coffee$Difference, col = "steelblue", lwd = 2)


## Coffee T Test
with(coffee,unlist(lapply(split(Difference,Notes),length)))


with(coffee,summary(Difference[Notes=='brushed']))
with(coffee,summary(Difference[Notes=='']))
qplot(Difference, data=coffee, geom="histogram", xlab = "Loss of Weight") + facet_grid(Notes ~ .)

qplot(Notes, Difference, data=coffee, geom="boxplot", ylab = "Loss of Weight", xlab = "Treatment")

t.test(Difference~Notes, data = coffee, var.equal=TRUE, alternative = 'greater')


