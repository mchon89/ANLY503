library(ggplot2)
library(ggthemes)

data = read.csv('burden.csv')
ggplot_1 <- ggplot(data, aes(x=Burden, y=Value, fill=Benefit)) + geom_boxplot()
ggplot_1 + theme_economist() + scale_colour_economist() + ggtitle('Mutation Burden vs Neoantigen Burden')