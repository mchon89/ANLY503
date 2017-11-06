# Michael Chon
# ANLY503 
# HW8
# Part II


library(igraph)
library(networkD3)


new_edges = read.csv('edges_part2.csv')
colnames(new_edges) <- c("SourceName", "TargetName", "Weight")
(head(new_edges))

gD <- igraph::simplify(igraph::graph.data.frame(new_edges, directed=FALSE))
nodeList <- data.frame(ID = c(0:(igraph::vcount(gD) - 1)), nName = igraph::V(gD)$name)

getNodeID <- function(x){
  which(x == igraph::V(gD)$name) - 1 # to ensure that IDs start at 0
}

getNodeID('anly501-1')
(head(new_edges)) 

new_edges <- plyr::ddply(new_edges, .variables = c("SourceName", "TargetName" , "Weight"), 
                         function (x) data.frame(SourceID = getNodeID(x$SourceName), 
                                                 TargetID = getNodeID(x$TargetName)))

(head(new_edges))

nodeList <- cbind(nodeList, nodeDegree=igraph::degree(gD, v = igraph::V(gD), mode = "all"))

betAll <- igraph::betweenness(gD, v = igraph::V(gD), directed = FALSE) / (((igraph::vcount(gD) - 1) * (igraph::vcount(gD)-2)) / 2)
betAll.norm <- (betAll - min(betAll))/(max(betAll) - min(betAll))
nodeList <- cbind(nodeList, nodeBetweenness=100*betAll.norm) # We are scaling the value by multiplying it by 100 for visualization purposes only (to create larger nodes)
rm(betAll, betAll.norm)
(head(nodeList))


dsAll <- igraph::similarity.dice(gD, vids = igraph::V(gD), mode = "all")
(head(dsAll))

F1 <- function(x) {data.frame(diceSim = dsAll[x$SourceID +1, x$TargetID + 1])}
(head(new_edges))
new_edges <- plyr::ddply(new_edges, .variables=c("SourceName", "TargetName", "Weight", "SourceID", "TargetID"), 
                         function(x) data.frame(F1(x)))
(head(new_edges))
rm(dsAll, F1, getNodeID, gD)


F2 <- colorRampPalette(c("#FFFF00", "#FF0000"), bias = nrow(new_edges), space = "rgb", interpolate = "linear")
colCodes <- F2(length(unique(new_edges$diceSim)))
edges_col <- sapply(new_edges$diceSim, function(x) colCodes[which(sort(unique(new_edges$diceSim)) == x)])

rm(colCodes, F2)
D3_network_LM <- networkD3::forceNetwork(Links = new_edges, # data frame that contains info about edges
                                         Nodes = nodeList, # data frame that contains info about nodes
                                         Source = "SourceID", # ID of source node 
                                         Target = "TargetID", # ID of target node
                                         Value = "Weight", # value from the edge list (data frame) that will be used to value/weight relationship amongst nodes
                                         NodeID = "nName", # value from the node list (data frame) that contains node description we want to use (e.g., node name)
                                         Nodesize = "nodeBetweenness",  # value from the node list (data frame) that contains value we want to use for a node size
                                         Group = "nodeDegree",  # value from the node list (data frame) that contains value we want to use for node color
                                         height = 500, # Size of the plot (vertical)
                                         width = 1000,  # Size of the plot (horizontal)
                                         fontSize = 20, # Font size
                                         linkDistance = networkD3::JS("function(d) { return 10*d.value; }"), # Function to determine distance between any two nodes, uses variables already defined in forceNetwork function (not variables from a data frame)
                                         linkWidth = networkD3::JS("function(d) { return d.value/5; }"),# Function to determine link/edge thickness, uses variables already defined in forceNetwork function (not variables from a data frame)
                                         opacity = 0.65, # opacity
                                         zoom = TRUE, # ability to zoom when click on the node
                                         opacityNoHover = 0.1, # opacity of labels when static
                                         linkColour = edges_col) # edge colors

# Plot network
D3_network_LM 

# Save 
networkD3::saveNetwork(D3_network_LM, "mc2153_hw8_part2.html", selfcontained = TRUE)
