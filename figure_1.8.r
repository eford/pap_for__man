# Exmaple taken from http://www.petrkeil.com/?p=1709

# Load required libraries
library(sp)
library(raster)

# Set environment variables
DATADIR <- "."
OUTDIR <- "."

# Load data
load(file.path(DATADIR, "bei.rda"))

pdf(file=file.path(OUTDIR, "tree_gradient.pdf"), width=10, height=6)

oldpar <- par(no.readonly=TRUE)

par(mar=c(6, 7, 4, 2)+0.1, mgp=c(4, 1, 0))

# Define gradient predictors
gradient <- raster(bei.extra[[2]])

# Crop the predictors so that they have exactly 500 x 1000 cells
ext <- extent(2.5, 1002.5, 2.5, 1002.5)
gradient <- crop(gradient, ext)

# Create coarse grid of predictors into 50 x 50 m grid by taking the mean of the 5 x 5 m grid cells
gradient50 <- aggregate(gradient, fact=10, fun=mean)

# Visualization of mean gradient of coarse data
plot(
  gradient50,
  main="", # "Predictor: mean gradient in coarse grid",
  xlab="x coordinate (meters)",
  ylab="y coordinate (meters)",
  # legend=FALSE,
  legend.shrink=1,
  # legend.args=list(text='Gradient', side=1, line=2.5, cex=1.7),
  axis.args=list(cex.axis=1.6),
  cex.axis=1.8,
  cex.lab=1.7,
  # frame=FALSE,
  # box=FALSE,
  las=1
)

par(oldpar)

dev.off()
