library(smoof)
library(flacco)

X = expand.grid(seq(0, 1, length.out = 50), seq(0, 1, length.out = 50))
f = makeBBOBFunction(dimension = 2, fid = 17, iid = 9)
y = apply(X, 1, f)
feat.object = createFeatureObject(X = X, y = y, fun = f, blocks = c(10, 10))

svg("example_persp.svg", width = 9, height = 9)
par(mfrow = c(1, 1), mar = c(1, 1, 1, 1))
persp(matrix(y, nrow = 50), shade = 0.1, theta = 35, phi = 25,
  border = "lightgrey", zlab = "f(x, y)", xlab = "x", ylab = "y", col = "pink")
dev.off()

svg("example_bt_3d.svg", width = 9, height = 9)
par(mfrow = c(1, 1), mar = c(1, 1, 1, 1))
plotBarrierTree3D(feat.object, control = list(gcm.approach = "near", bt.persp_border = "lightgrey",
  bt.persp_theta = 35, bt.persp_phi = 25, bt.color_surface = "pink", bt.persp_shade = 0.1,
  bt.persp_ticktype = "simple", bt.persp_xlab = "x", bt.persp_ylab = "y", bt.persp_zlab = "f(x, y)"))
dev.off()

svg("example_cm.svg", width = 9, height = 9)
par(mfrow = c(1, 1), mar = c(1, 1, 1, 1))
plotCellMapping(feat.object, control = list(gcm.approach = "near"))
dev.off()

svg("example_bt_2d.svg", width = 9, height = 9)
par(mfrow = c(1, 1), mar = c(1, 1, 1, 1))
plotBarrierTree2D(feat.object, control = list(gcm.approach = "near", bt.cm_surface = FALSE))
dev.off()
