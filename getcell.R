#Script per l'individuazione della cella raster su cui estrarre i campi interpolati
#Le coordinate del raster dei nostri campi interpolati sono in Gauss-Boaga
#http://www.geoin.it/coordinate_converter/

library(raster)
#Il seguente raster è preso di esempio, tanto sono tutti uguale
r <- raster("C:\\Users\\mazanetti\\Downloads\\Basiano\\VU_2019100100UTCplus1.txt")

#Coordinate di esempio per lavoro su Concorezzo
cellx <- colFromX(r, 1525194.47)
celly <- rowFromY(r, 5047289.83)

#cellx = 60, celly = 87
