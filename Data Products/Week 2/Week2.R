library(dplyr)
library(tidyr)
library(leaflet)

m <- leaflet() %>%
  addTiles() %>%  #
  addMarkers(lat=25.3150, lng=66.4600, popup="Place") %>%
  addMarkers(lat=12.5379,lng=64.3188, popup="Place") %>%
  addMarkers(lat=16.1361,lng=64.6173, popup="Place") %>%
  addMarkers(lat=11.0240,lng=64.4899, popup="Place")


df <- data.frame(lat=runif(500, min=14.09, max = 15.33 ),
                 lng=runif(500, min=74.31, max = 76.46 )) 

df %>%
  leaflet() %>%
  addTiles() %>%  
  addMarkers(~lng, ~lat, popup = ~as.character(df), label = ~as.character(df))
