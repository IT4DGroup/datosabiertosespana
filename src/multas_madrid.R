# @caiomsouza
# Multas Madrid

#Multas Ayuntamiento de Madrid
# Multas de circulación: detalle
# http://datos.madrid.es/portal/site/egob/menuitem.c05c1f754a33a9fbe4b2e4b284f1a5a0/?vgnextoid=fb9a498a6bdb9410VgnVCM1000000b205a0aRCRD&vgnextchannel=374512b9ace9f310VgnVCM100000171f5a0aRCRD
# http://datos.madrid.es/datosabiertos/MULTAS/2015/04/201504_detalle.csv

# Set path
setwd("~/git/github.com/it4dgroup/datosabiertosespana")

# Install adminpackage4r
source("https://raw.githubusercontent.com/caiomsouza/adminpackage4r/master/adminpackage4r_install.R")

#Load adminpackage4r
library("adminpackage4r")

# Specify the list of required packages to be installed and load
Required_Packages=c("modeest", "fmsb", "GGally", "ggplot2", "data.table", "ggthemes", "hexbin", "RColorBrewer", "plyr", "treemap");

# Call the Function
Install_And_Load(Required_Packages);




# 
# http://datos.madrid.es/egob/catalogo/210104-46-multas-circulacion-detalle.csv


# Multas Abril/2015
# http://datos.madrid.es/egob/catalogo/210104-30-multas-circulacion-detalle.csv
#multas.042015 <- read.csv('http://datos.madrid.es/egob/catalogo/210104-30-multas-circulacion-detalle.csv', sep=";", header = T, stringsAsFactors=FALSE)
#dim(multas.042015)
#lapply(multas, class)
#head(multas.042015)

#str(multas.042015$MES)

# Read dataset from http://datos.madrid.es/datosabiertos/MULTAS/2015/04/201504_detalle.csv
#multas <- read.csv('http://datos.madrid.es/datosabiertos/MULTAS/2015/04/201504_detalle.csv', sep=";", header = T, stringsAsFactors=FALSE)
multas <- read.csv('dat/ayuntamiento-madrid/multas/201504_detalle.csv', sep=";", header = T, stringsAsFactors=FALSE)


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

# Fast Chart
# The relation between points and value 
g1 <- ggplot(multas, aes(PUNTOS, IMP_BOL)) + layer(geom="step")
g1
print("Podemos ver que cuanto mas puntos mas es el valor de la multa.")

# Fast Chart
g2 <- ggplot(multas, aes(IMP_BOL)) + geom_bar()
g2
print("Podemos ver que las multas tienen valores mas entre 0 y 250 euros")

# Fast Chart
g3 <- ggplot(multas, aes(PUNTOS, IMP_BOL)) + geom_point(size=4)
g3 
print("Podemos ver que existe relacion entre Puntos y IMP_BOL")

# Slow Chart 
#g4 <- ggplot(multas, aes(PUNTOS, IMP_BOL)) + geom_point(size=4) + geom_line(colour="blue") + geom_smooth(method="loess", colour="red", size=2)
#g4

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
g8 <- ggplot(dt.multas, aes(MES, PUNTOS)) + geom_line()
g8

# Pie Chart 
g9 <- ggplot(dt.multas, aes(factor(1), fill=factor(CALIFICACION))) + geom_bar(width=1) + coord_polar(theta="y")
g9  

g9 <- ggplot(dt.multas, aes(IMP_BOL, fill=factor(CALIFICACION))) + geom_bar(width=1) + coord_polar(theta="y")
g9  


g10 <- ggplot(dt.multas, aes(factor(1), fill=factor(CALIFICACION))) + geom_bar(width=1)
g10 

g10 <- ggplot(dt.multas, aes(factor(1), fill=CALIFICACION)) + geom_bar(width=1)
g10 



g11 <- ggplot(dt.multas, aes(IMP_BOL, PUNTOS, colour=CALIFICACION)) + geom_point() + theme_economist() + scale_colour_economist() + ggtitle("Multas - Ayuntamiento")
g11


g12 <- ggplot(dt.multas, aes(IMP_BOL, PUNTOS, colour=CALIFICACION)) + geom_point() + scale_color_fivethirtyeight() + theme_fivethirtyeight() + ggtitle("Multas - Ayuntamiento")
g12


g13 <- ggplot(dt.multas, aes(factor(1), fill=factor(DESCUENTO))) + geom_bar(width=1) + coord_polar(theta="y")
g13  


g14 <- ggplot(dt.multas, aes(IMP_BOL, PUNTOS)) +
  stat_density2d(aes(fill = ..level..),
                 geom="polygon") + scale_x_log10() +
  scale_y_log10() + theme_minimal()

g14

g15 <- ggplot(dt.multas, aes(IMP_BOL, PUNTOS)) + geom_point(alpha=0.01) + geom_density2d() + scale_x_log10() + scale_y_log10() + theme_minimal()
g15

g16 <- ggplot(dt.multas, aes(IMP_BOL, PUNTOS))+ stat_binhex() + theme_minimal()
g16

g17 <- ggplot(dt.multas, aes(IMP_BOL, PUNTOS))+ stat_bin2d() + theme_minimal()
g17

g18 <- ggplot(dt.multas, aes(IMP_BOL, PUNTOS))+ stat_binhex() + theme_minimal()
g18

# We have to put more months to show in the chart
g19 <- ggplot(dt.multas,aes(ANIO,IMP_BOL,colour=CALIFICACION)) + geom_line()
g19


# ejemplos
ejemplo01 <- ggplot(diamonds, aes(price, carat))+ stat_binhex(binwidth=c(0.05,0.05))+ scale_x_log10() + scale_y_log10()+ theme_minimal() + scale_fill_gradient(low="wheat", high="red")
ejemplo01

dt.data <- read.csv("http://datasets.flowingdata.com/expenditures.txt", sep="\t")
ejemplo2 <- ggplot(dt.data,aes(year,expenditure,fill=category)) + geom_area(position="fill")
ejemplo2

ejemplo3 <- ggplot(arrange(dt.data, expenditure, category),aes(year,expenditure,fill=category))+  geom_area(position="fill") # arrange requires plyr
ejemplo3


# Paquetes requeridos
#install.packages("plyr")
#install.packages("devtools")
library(devtools)
install_github("wilkox/treemapify")
library(treemapify)
data(G20)
treeMapCoordinates <- treemapify(G20,
                                   area="Nom.GDP.mil.USD", fill="HDI",
                                   label="Country", group="Region")
ggplotify(treeMapCoordinates)


# Paquetes requeridos
install.packages("portfolio")
library(portfolio)
map.market(id=G20$Country,
              area=G20$Nom.GDP.mil.USD,
              color=G20$HDI,
              group=G20$Region, lab=T)

# Paquetes requeridos
#install.packages("treemap")
library(treemap)
treemap(G20,
          index=c("Region", "Country"),
          vSize="Nom.GDP.mil.USD",
          vColor="HDI", type="value")


ggplot(economics, aes(date, unemploy/pop)) +  geom_line()

ggplot(economics, aes(date, uempmed)) +  geom_line()

ggplot(economics, aes(date, unemploy/pop)) + geom_line() + geom_smooth(method="loess", se=F, colour="red", size=2)

ggplot(economics, aes(date, unemploy/pop)) + geom_line() + geom_smooth(method="lm", se=F, colour="blue", size=2)

ggplot(economics, aes(unemploy/pop, uempmed))+ geom_path()

ggplot(economics, aes(unemploy/pop, uempmed, colour=year(date))) + geom_path()


# Convertimos a data.table
dt.economics <- as.data.table(economics)
# Normalizamos
dt.economics[, unemploy_norm :=
                 (unemploy - min(unemploy))/(max(unemploy)-
                                               min(unemploy)) ]
dt.economics[, uempmed_norm := (uempmed
                                  - min(uempmed))/(max(uempmed)-
                                                     min(uempmed)) ]
# Podemos probar llamar a ggplot
ggplot(dt.economics, aes(date)) + geom_line(aes(y=unemploy_norm))+ geom_line(aes(y=uempmed_norm))


# Convertimos a data.table
dt.economics <- as.data.table(economics)
# Normalizamos
dt.economics[, unemploy_norm :=
                 (unemploy - min(unemploy))/(max(unemploy)-
                                               min(unemploy)) ]
dt.economics[, uempmed_norm := (uempmed
                                  - min(uempmed))/(max(uempmed)-
                                                     min(uempmed)) ]
# Solución poco elegante
ggplot(dt.economics, aes(date) + geom_line(aes(y=unemploy_norm, color="unemploy_norm")) + geom_line(aes(y=uempmed_norm, color="uempmed_norm")) + labs(color="variable")

       
#Cargamos paquete reshape
require(reshape2)
dt.economics.melted <- melt(dt.economics, id="date", measure=c("unemploy_norm", "uempmed_norm"))
ggplot(dt.economics.melted, aes(date, value, colour=variable)) + geom_line()       


# Nueva variable
dt.economics[, unemploy_rate := unemploy/ pop ]
# Volver a hacer un melt pero con
# diferentes variables
dt.economics.melted <-  melt(dt.economics, id="date", measure=c("unemploy_rate", "uempmed"))
# Usar facet grid
ggplot(dt.economics.melted, aes(date, value))+ geom_line()+ facet_grid(variable~., scales="free_y")


head(dt.multas)

# GGThemes
install.packages('ggthemes')



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




devtools::install_github('rCharts', 'ramnathv', ref = 'dev')
library("rCharts")
r1 <- rPlot(mpg ~ wt, data = mtcars, type = 'point', color = 'gear')
r1$addControls('x', 'wt', names(mtcars))
r1$addControls('y', 'mpg', names(mtcars))
r1$addControls('color', 'gear', names(mtcars))



