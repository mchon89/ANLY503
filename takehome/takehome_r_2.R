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


terror <- read.csv('~/Desktop/take-home/TerrorismDATA_Real_1970_2016.csv')
US = subset(terror, terror['country_txt']=='United States')
US_1970 = subset(US, US['iyear'] == '1970')
US_2016 = subset(US, US['iyear'] == '2016')

popup_1970 = paste0("<br><strong>Date: </strong>",
                  paste(US_1970$imonth, US_1970$iday, US_1970$iyear, sep = '/'),
                  "<br><strong>State: </strong>", 
                  US_1970$provstate, 
                  "<br><strong>City: </strong>", 
                  US_1970$city,
                  "<br><strong>Killed: </strong>",
                  US_1970$nkill,
                  "<br><strong>Attack Type: </strong>",
                  US_1970$attacktype1_txt,
                  "<br><strong>Target Type: </strong>",
                  US_1970$targsubtype1_txt)

popup_2016 = paste0("<br><strong>Date: </strong>",
                    paste(US_2016$imonth, US_2016$iday, US_2016$iyear, sep = '/'),
                    "<br><strong>State: </strong>", 
                    US_2016$provstate, 
                    "<br><strong>City: </strong>", 
                    US_2016$city,
                    "<br><strong>Killed: </strong>",
                    US_2016$nkill,
                    "<br><strong>Attack Type: </strong>",
                    US_2016$attacktype1_txt,
                    "<br><strong>Target Type: </strong>",
                    US_2016$targsubtype1_txt)

usa_lonlat = unlist(ggmap::geocode('usa', source='google'))

gmap = leaflet(data = US) %>%
        addTiles() %>%
        addProviderTiles('Stamen.Toner') %>% 
        setView(lng = usa_lonlat[1], lat = usa_lonlat[2], zoom = 4) %>% 
        addCircleMarkers(data = US_1970, lat = ~latitude, lng = ~longitude, 
                   popup = popup_1970, color = '#52E74B', label = US_1970$attacktype1_txt, group = "1970") %>% 
        addCircleMarkers(data = US_2016, lat = ~latitude, lng = ~longitude, 
                   popup = popup_2016, color = "#FF0000", label = US_2016$attacktype1_txt, group = "2016") %>% 
        addLayersControl(
                  overlayGroups = c("1970","2016"),
                  options = layersControlOptions(collapsed = FALSE))

gmap
saveWidget(gmap, 'takehome_r_2.html', selfcontained = TRUE)
