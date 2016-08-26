# Exmaple taken from http://www.petrkeil.com/?p=1709

# Load required libraries
library(sp)
library(raster)

# Set environment variables
DATADIR <- "."
OUTDIR <- "."

# Load data
load(file.path(DATADIR, "bei.rda"))

pdf(file=file.path(OUTDIR, "tree_locations.pdf"), width=10, height=6)

oldpar <- par(no.readonly=TRUE)

par(mar=c(5, 7, 4, 2)+0.1, mgp=c(3, 1, 0))

# Visualize tree locations
plot(
  bei$x,
  bei$y,
  pch=20,
  cex=0.75,
  col="darkgreen",
  main="", # "Location of trees in the Barro Colorado plot", 
  xlab="x coordinate (meters)",
  ylab="",
  frame=FALSE,
  cex.axis=1.8,
  cex.lab=1.7,
  yaxt="n"
)

axis(
  2,
  at=seq(0, 500, by=100),
  labels=seq(0, 500, by=100),
  cex.axis=1.8,
  las=1
)

mtext("y coordinate (meters)", 2, line=5, cex=1.8)

par(oldpar)

dev.off()
