library(leaflet)
library(sp)
library(mapproj)
library(maps)
library(mapdata)
library(maptools)
library(htmlwidgets)
library(magrittr)
library(XML)
library(plyr)
library(rgdal)
library(WDI)
library(raster)
library(noncensus)
library(stringr)
library(tidyr)
library(tigris)
library(rgeos)
library(ggplot2)
library(scales)

data(zip_codes)
data(counties)

# Reading the files
unemployment <- read.csv('unemployment.csv')
symbol <- read.csv('confederate_symbols.csv')

# Adding zeros to make a number five-digits
unemployment$GEOID <- sprintf("%05d", unemployment$GEOID)

# Subsetting by side
south <- subset(symbol, symbol['side']=='South')
north <- subset(symbol, symbol['side']=='North')

# US MAP
us.map <- readOGR(dsn = ".", layer = "cb_2016_us_county_20m", stringsAsFactors = FALSE)
us.map <- us.map[!us.map$STATEFP %in% c("72", "66", "78", "60", "69",
                                       "64", "68", "70", "74", "81", "84", "86", 
                                       "87", "89", "71", "76", "95", "79"),]
us.map <- us.map[!us.map$STATEFP %in% c("81", "84", "86", "87", "89", "71", "76",
                                        "95", "79"),]

# Plotting by GEOID
plotmap <- merge(us.map, unemployment, by = c("GEOID"))

# Popup
popup_un = paste0("<strong>County: </strong>", 
                   plotmap$county, 
                   "<br><strong>Unemployment Rate: </strong>", 
                   plotmap$unemployed_rate)

popup_north = paste0("<strong>Name: </strong>",
                  north$feature_name,
                  "<br><strong>City: </strong>",
                  north$city, 
                  "<br><strong>Category: </strong>", 
                  north$category)

popup_south = paste0("<strong>Name: </strong>",
                     south$feature_name,
                     "<br><strong>City: </strong>",
                     south$city, 
                     "<br><strong>Category: </strong>", 
                     south$category)

# Plotting choropleth with layering North and South on top
pal = colorQuantile("PuRd", NULL, n = 9)
gmap = leaflet(data = plotmap) %>%
  addTiles() %>%
  setView(lng = -105, lat = 40, zoom = 4) %>% 
  addPolygons(fillColor = ~pal(unemployed_rate), 
              fillOpacity = 0.6, 
              color = "#BDC3BD", 
              weight = 1,
              popup = popup_un,
              group = "Unemployment Rate") %>% 
              addCircleMarkers(data = north, lat = ~latitude, lng = ~longitude, 
              popup = popup_north, color = '#52E74B', label = north$side, group = "North") %>% 
              addCircleMarkers(data = south, lat = ~latitude, lng = ~longitude, 
              popup = popup_south, color = "#FF0000", label = south$side, group = "South") %>% 
  addLayersControl(
    baseGroups = c("Unemployment Rate"),
    overlayGroups = c("North","South"),
    options = layersControlOptions(collapsed = FALSE)
  )

gmap
saveWidget(gmap, 'unemploymentandsymbol.html', selfcontained = TRUE)
