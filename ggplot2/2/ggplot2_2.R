# Michael Chon
# ANLY503 Portfolio
# ggplot2

library(ggplot2)
library(ggthemes)

# Reading the file 
data = read.csv('language.csv')

# Collecting the column needed for this visual
var <- data$parent

# Creating the table for a waffle chart
nrows <- 10
df <- expand.grid(y = 1:nrows, x = 1:nrows)
categ_table <- round(table(var) * ((nrows*nrows)/(length(var))))

# Adding category
df$category <- factor(rep(names(categ_table), categ_table))  

# Plotting a waffle chart 
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
