### R code from vignette source 'descomponer_texto.Rnw'

###################################################
### code chunk number 1: descomponer_texto
###################################################
options(keep.source = TRUE, width = 60)
descomponer_texto <- packageDescription("descomponer")


###################################################
### code chunk number 2: rdf
###################################################
library(descomponer)
data(PIB)
data (celec)
rdf(celec,PIB)
gtd(rdf(celec,PIB)$datos$res)


###################################################
### code chunk number 3: predictrdf
###################################################
mod1=rdf(celec,PIB)
newdata=c(100)
predictrdf(mod1,newdata)


###################################################
### code chunk number 4: descomponer
###################################################
data(ipi)
descomponer(ipi,12,1)$datos
gdescomponer(ipi,12,1,2002,1)


