# See
# http://what-when-how.com/artificial-intelligence/a-comparison-of-cooling-schedules-for-simulated-annealing-artificial-intelligence/

OUTDIR <- "./"

exp_cool <- function(i, ntot, a, b) {
  (1-b)*exp(-a*(i-1)/ntot)+b
}

pow_cool <- function(i, ntot, a, b) {
  (1-b)*(a^((i-1)/ntot))+b
}

lin_cool <- function(i, ntot, a, b) {
  (1-b)*(1/(1+a*(i-1)/ntot))+b
}

quad_cool <- function(i, ntot, a, b) {
  (1-b)*(1/(1+a*(((i-1)/ntot)^2)))+b
}

log_cool <- function(i, ntot, a, b) {
  (1-b)*(1/(1+a*log(1+(i-1)/ntot)))+b
}

ntot <- 10000

x <- seq(1, ntot, by=1)

cols <- c("blue", "green", "red", "orange")

pdf(file=file.path(OUTDIR, "cooling_schedules.pdf"), width=10, height=6)

oldpar <- par(no.readonly=TRUE)

par(mar=c(5, 6, 4, 2)+0.1, mgp=c(3, 1, 0))

plot(
  x,
  exp_cool(x, ntot, 30, 0),
  ylim=c(0, 1),
  type="l",
  col=cols[1],
  lwd=2,
  xlab="i",
  ylab="",
  cex.axis=1.8,
  cex.lab=1.7,
  yaxt="n"
)

axis(
  2,
  at=seq(0, 1, by=0.2),
  labels=seq(0, 1, by=0.2),
  cex.axis=1.8,
  las=1
)

mtext("p(i)", 2, line=4, cex=1.8)

lines(
  x,
  lin_cool(x, ntot, 30, 0),
  col=cols[2],
  lwd=2
)

lines(
  x,
  quad_cool(x, ntot, 30, 0),
  col=cols[3],
  lwd=2
)

lines(
  x,
  log_cool(x, ntot, 30, 0),
  col=cols[4],
  lwd=2
)

legend(
  "topright",
  c("Exponential", "Linear", "Quadratic", "Logarithmic"),
  lty=c(1, 1, 1),
  lwd=c(5, 5, 5),
  col=cols,
  cex=1.5,
  bty="n"
)

par(oldpar)

dev.off()
