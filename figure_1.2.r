OUTDIR <- "./"

exp_cool <- function(i, ntot, a, b) {
  (1-b)*exp(-a*(i-1)/ntot)+b
}

b <- 0.1

ntot <- 10000

x <- seq(1, ntot, by=1)

cols <- c("blue", "green", "red", "orange")

pdf(file=file.path(OUTDIR, "exp_schedule_a_b.pdf"), width=10, height=6)

oldpar <- par(no.readonly=TRUE)

par(mar=c(5, 6, 4, 2)+0.1, mgp=c(3, 1, 0))

plot(
  x,
  exp_cool(x, ntot, 3, b),
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
  at=c(0, 0.1, 0.2, 0.4, 0.6, 0.8, 1),
  labels=c(0, 0.1, 0.2, 0.4, 0.6, 0.8, 1),
  cex.axis=1.8,
  las=1
)

mtext("p(i)", 2, line=4, cex=1.8)

lines(
  x,
  exp_cool(x, ntot, 5, b),
  col=cols[2],
  lwd=2
)

lines(
  x,
  exp_cool(x, ntot, 7, b),
  col=cols[3],
  lwd=2
)

lines(
  x,
  exp_cool(x, ntot, 15, b),
  col=cols[4],
  lwd=2
)

legend(
  "topright",
  c("a = 3", "a = 5", "a = 7", "a = 15"),
  lty=c(1, 1, 1),
  lwd=c(5, 5, 5),
  col=cols,
  cex=1.5,
  bty="n"
)

abline(h=b, lty=2)

par(oldpar)

dev.off()
