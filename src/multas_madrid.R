# @caiomsouza
# Multas Madrid

#Multas Ayuntamiento de Madrid
# Multas de circulación: detalle
# http://datos.madrid.es/portal/site/egob/menuitem.c05c1f754a33a9fbe4b2e4b284f1a5a0/?vgnextoid=fb9a498a6bdb9410VgnVCM1000000b205a0aRCRD&vgnextchannel=374512b9ace9f310VgnVCM100000171f5a0aRCRD
# http://datos.madrid.es/datosabiertos/MULTAS/2015/04/201504_detalle.csv

# Install adminpackage4r
source("https://raw.githubusercontent.com/caiomsouza/adminpackage4r/master/adminpackage4r_install.R")

#Load adminpackage4r
library("adminpackage4r")

# Specify the list of required packages to be installed and load
Required_Packages=c("modeest", "fmsb", "GGally", "ggplot2", "data.table", "ggthemes");

# Call the Function
Install_And_Load(Required_Packages);

# Set path
setwd("~/git/github.com/it4dgroup/datosabiertosespana")


# 
# http://datos.madrid.es/egob/catalogo/210104-46-multas-circulacion-detalle.csv


# Multas Abril/2015
# http://datos.madrid.es/egob/catalogo/210104-30-multas-circulacion-detalle.csv
multas.042015 <- read.csv('http://datos.madrid.es/egob/catalogo/210104-30-multas-circulacion-detalle.csv', sep=";", header = T, stringsAsFactors=FALSE)
dim(multas.042015)
lapply(multas, class)
head(multas.042015)

str(multas.042015$MES)

# Read dataset from http://datos.madrid.es/datosabiertos/MULTAS/2015/04/201504_detalle.csv
multas <- read.csv('http://datos.madrid.es/datosabiertos/MULTAS/2015/04/201504_detalle.csv', sep=";", header = T, stringsAsFactors=FALSE)


# Show the dimensions
dim(multas)

# Show the class from the dataset
lapply(multas, class)

# 
str(multas)

# Summary the dataset
summary(multas)

head(multas)

tail(multas)

multas$PUNTOS
multas$IMP_BOL

mean(multas$IMP_BOL)

min(multas$IMP_BOL)

max(multas$IMP_BOL)

median(multas$IMP_BOL)

quantile(multas$IMP_BOL)

sd(multas$IMP_BOL)

var(multas$IMP_BOL)

#install.packages("modeest")
#library(modeest)
# moda
mfv(multas$IMP_BOL) 

#install.packages("fmsb")
#library(fmsb)
percentile(multas$IMP_BOL)

fivenum(multas$IMP_BOL)


sort(multas$IMP_BOL)

order(multas$IMP_BOL)

sum(multas$IMP_BOL)

cumsum(multas$IMP_BOL)

length(multas$IMP_BOL)

log(multas$IMP_BOL)

floor(multas$IMP_BOL)

ceiling(multas$IMP_BOL)

trunc(multas$IMP_BOL)

round(multas$IMP_BOL, digits=2)

signif(multas$IMP_BOL, digits=6)

range(multas$IMP_BOL)


#install.packages("GGally")
#library(GGally)
#ggpairs(iris, colour = "Species", alpha = 0.4)
#ggpairs(multas, colour = "CALIFICACION", alpha = 0.4)

head(multas)

# The relation between points and value 
g1 <- ggplot(multas, aes(PUNTOS, IMP_BOL)) + layer(geom="step")
g1
print("Podemos ver que cuanto mas puntos mas es el valor de la multa.")


g2 <- ggplot(multas, aes(IMP_BOL)) + geom_bar()
g2
print("Podemos ver que las multas tienen valores mas entre 0 y 250 euros")

g3 <- ggplot(multas, aes(PUNTOS, IMP_BOL)) + geom_point(size=4)
g3 
print("Podemos ver que existe relacion entre Puntos y IMP_BOL")

g4 <- ggplot(multas, aes(PUNTOS, IMP_BOL)) + geom_point(size=4) + geom_line(colour="blue") + geom_smooth(method="loess", colour="red", size=2)
g4

g5 <- ggplot(multas, aes(PUNTOS, IMP_BOL)) + geom_boxplot()
g5   

# Type Cast from Data Frame to Data Table
dt.multas <- as.data.table(multas)


g6 <- ggplot(dt.multas[ CALIFICACION == "LEVE" ], aes(ANIO, PUNTOS)) + geom_line() + theme_bw()
g6

head(dt.multas)

g7 <- ggplot(dt.multas [CALIFICACION == "LEVE"], aes(ANIO, PUNTOS)) + geom_line(aes(group=DENUNCIANTE))
g7


#g8 <- ggplot(dt.multas, aes(ANIO, PUNTOS)) + geom_line()
#g8 <- ggplot(dt.multas, aes(MES, PUNTOS)) + geom_line()
g8 <- ggplot(multas.042015, aes(MES, PUNTOS)) + geom_line()
g8

# Pie Chart 
g9 <- ggplot(multas.042015, aes(factor(1), fill=factor(CALIFICACION))) + geom_bar(width=1) + coord_polar(theta="y")
g9  

g9 <- ggplot(multas.042015, aes(IMP_BOL, fill=factor(CALIFICACION))) + geom_bar(width=1) + coord_polar(theta="y")
g9  


g10 <- ggplot(multas.042015, aes(factor(1), fill=factor(CALIFICACION))) + geom_bar(width=1)
g10 

g10 <- ggplot(multas.042015, aes(factor(1), fill=CALIFICACION)) + geom_bar(width=1)
g10 

g11 <- ggplot(multas.042015, aes(factor(1), fill=factor(CALIFICACION))) + geom_bar=(width=1) + coord_polar()
g11


# Probabiliad




# Tiramos una moneda 100 veces y obtenemos 54 caras

# ¿Es un resultado compatible con que la probabilidad de cara sea del 50%?

# Calculo de probabilidad 
#1-pbinom(54, 100, 0.5)
#prop.test(54, 100, 0.5)

# Distribución Normal

#rnorm(100, 1, 0)

#?rnorm

# Diferecia de Medias ... 
#t.test(extra ~ group, data = sleep,)

# Diferencia de medias
#boxplot(extra ~ group, data = sleep, col = "gray")

#head(sleep,15)




