## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE, comment = "#>", message = FALSE, error = FALSE, tidy = TRUE
)

## ----ex1-----------------------------------------------------------------
library(tiler)
library(raster)
tile_dir <- file.path(tempdir(), "tiles")
map <- system.file("maps/map_wgs84.tif", package = "tiler")
(r <- raster(map))
plot(r)

tile(map, tile_dir, "0-3")

list.files(tile_dir)

## ----unlink1, echo=FALSE-------------------------------------------------
unlink(tile_dir, recursive = TRUE, force = TRUE)

## ----ex2-----------------------------------------------------------------
map <- system.file("maps/map_albers.tif", package = "tiler")
(r <- raster(map))
plot(r)

tile(map, tile_dir, "0-3")

## ----unlink2, echo=FALSE-------------------------------------------------
unlink(tile_dir, recursive = TRUE, force = TRUE)

## ----ex3-----------------------------------------------------------------
map <- system.file("maps/map_albers_NA.tif", package = "tiler")
(r <- raster(map))
plot(r)

tile(map, tile_dir, "0-3")

## ----unlink3, echo=FALSE-------------------------------------------------
unlink(tile_dir, recursive = TRUE, force = TRUE)

## ----ex4-----------------------------------------------------------------
crs <- "+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs +towgs84=0,0,0"
tile(map, tile_dir, "0-3", crs)

## ----unlink4, echo=FALSE-------------------------------------------------
unlink(tile_dir, recursive = TRUE, force = TRUE)

## ----ex5-----------------------------------------------------------------
map <- system.file("maps/map_wgs84.tif", package = "tiler")
pal <- colorRampPalette(c("darkblue", "lightblue"))(20)
nodata <- "tomato"
tile(map, tile_dir, "0-3", col = pal, colNA = nodata)

## ----unlink5, echo=FALSE-------------------------------------------------
unlink(tile_dir, recursive = TRUE, force = TRUE)

## ----ex6-----------------------------------------------------------------
map <- system.file("maps/map_albers_rgb.tif", package = "tiler")
(r <- brick(map))
plot(r)

tile(map, tile_dir, "0-3")

## ----unlink6, echo=FALSE-------------------------------------------------
unlink(tile_dir, recursive = TRUE, force = TRUE)

## ----ex7-----------------------------------------------------------------
map <- system.file("maps/map.png", package = "tiler")
plotRGB(brick(map))

tile(map, tile_dir, "0-3")

## ----unlink7, echo=FALSE-------------------------------------------------
unlink(tile_dir, recursive = TRUE, force = TRUE)

