
# @caiomsouza
# Multas Madrid


#Multas 
# Multas de circulación: detalle
# http://datos.madrid.es/portal/site/egob/menuitem.c05c1f754a33a9fbe4b2e4b284f1a5a0/?vgnextoid=fb9a498a6bdb9410VgnVCM1000000b205a0aRCRD&vgnextchannel=374512b9ace9f310VgnVCM100000171f5a0aRCRD
# http://datos.madrid.es/datosabiertos/MULTAS/2015/04/201504_detalle.csv

setwd("~/git/github.com/it4dgroup/datosabiertosespana")
#multas <- read.csv('http://datos.madrid.es/datosabiertos/MULTAS/2015/04/201504_detalle.csv', sep=",", header = T, stringsAsFactors=FALSE)
multas <- read.csv('~/git/github.com/it4dgroup/datosabiertosespana/dat/ayuntamiento-madrid/multas/201504_detalle.csv', sep=",", header = T, stringsAsFactors=FALSE)



dim(multas)
lapply(multas, class)
str(multas)
