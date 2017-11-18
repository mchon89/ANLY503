# Michael Chon
# ANLY503 Portfolio
# ggplot2

library(ggplot2)
library(ggthemes)
library(gridExtra)

# Reading the csv file
data = read.csv('burden.csv')

# Plotting using the ggplot2 and economist ggtheme
ggplot_1 <- ggplot(data, aes(x=Burden, y=Value, fill=Benefit)) + geom_boxplot()
ggplot_1 + theme_economist() + scale_colour_economist() 

ggplot_2 <- ggplot(data, aes(x=Burden, y=Value, fill=Benefit)) + geom_bar(stat = "identity")

ggplot_3 <- ggplot(data, aes(x=Burden, y=Value, fill=Benefit)) + geom_violin()

ggplot_4 <- ggplot(data, aes(x=Burden, y=Value, fill=Benefit, color = Benefit)) + geom_jitter()

grid.arrange(ggplot_1, ggplot_2, ggplot_3, ggplot_4, ncol=2, top = 'Mutation Burden vs Neoantigen Burden')
