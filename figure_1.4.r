OUTDIR <- "./"

alsmmala_complexity <- function(x, a) {
  (1-exp(-a))*x^3/a+(1-(1-exp(-a))/a)*x^2
}

x <- seq(0.01, 100, by=0.01)

cols <- c("black", "green", "red", "blue", "orange")

pdf(file=file.path(OUTDIR, "alsmmala_complexity.pdf"), width=10, height=6)

oldpar <- par(no.readonly=TRUE)

par(mar=c(5, 8, 4, 2)+0.1, mgp=c(3, 1, 0))

plot(
  x,
  x^3,
  type="l",
  col=cols[1],
  lwd=2,
  xlab=expression("n"[theta]),
  ylab="",
  cex.axis=1.8,
  cex.lab=1.7,
  yaxt="n"
)

axis(
  2,
  at=seq(0, 1e+06, by=2*1e+05),
  labels=seq(0, 1e+06, by=2*1e+05),
  cex.axis=1.8,
  las=1
)

mtext("Complexity bound", 2, line=6, cex=1.8)

lines(
  x,
  alsmmala_complexity(x, 5),
  col=cols[2],
  lwd=2
)

lines(
  x,
  alsmmala_complexity(x, 7),
  col=cols[3],
  lwd=2
)

lines(
  x,
  alsmmala_complexity(x, 10),
  col=cols[4],
  lwd=2
)

lines(
  x,
  x^2,
  col=cols[5],
  lwd=2
)

legend(
  "topleft",
  c("Qubic", "a = 5", "a = 7", "a = 10", "Quadratic"),
  lty=c(1, 1, 1),
  lwd=c(5, 5, 5),
  col=cols,
  cex=1.5,
  bty="n"
)

par(oldpar)

dev.off()
