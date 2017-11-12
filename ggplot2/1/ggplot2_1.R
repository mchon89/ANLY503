# Michael Chon
# ANLY503 Portfolio
# ggplot2

library(ggplot2)
library(ggthemes)

# Reading the csv file
data = read.csv('burden.csv')

# Plotting using the ggplot2 and economist ggtheme
ggplot_1 <- ggplot(data, aes(x=Burden, y=Value, fill=Benefit)) + geom_boxplot()
ggplot_1 + theme_economist() + scale_colour_economist() + ggtitle('Mutation Burden vs Neoantigen Burden')
