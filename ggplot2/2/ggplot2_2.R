library(ggplot2)
library(ggthemes)


data = read.csv('language.csv')
var <- data$parent

nrows <- 10
df <- expand.grid(y = 1:nrows, x = 1:nrows)
categ_table <- round(table(var) * ((nrows*nrows)/(length(var))))
df$category <- factor(rep(names(categ_table), categ_table))  

ggplot2 <- ggplot(df, aes(x = x, y = y, fill = category)) + geom_tile(color = "black", size = 0.5)
ggplot2 + scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0), trans = 'reverse') +
  scale_fill_brewer(palette = "Set3") +
  labs(title="Waffle Chart", subtitle="Popular Computer Programming Languages") + 
  theme(axis.text = element_blank(),
        axis.title = element_blank(),
        axis.ticks = element_blank(),
        legend.title = element_blank(),
        plot.title = element_text(size = rel(1.2)),
        legend.position = "right")
