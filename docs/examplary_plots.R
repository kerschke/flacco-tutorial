library(smoof)
library(flacco)

set.seed(123)
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

svg("example_info.svg", width = 9, height = 9)
par(mfrow = c(1, 1), mar = c(4, 4, 1, 1))
plotInformationContent(feat.object)
dev.off()



set.seed(12)
X = createInitialDesign(n.obs = 1000, dim = 2)
f = smoof::makeBBOBFunction(2, 15, 1)
feat.object = createFeatureObject(X = X, fun = f, blocks = c(4, 6))

png("example_cm1.png", width = 600, height = 600)
par(mfrow = c(1, 1), mar = c(1, 1, 1, 1))
plotCellMapping(feat.object)
dev.off()

png("example_cm2.png", width = 600, height = 600)
par(mfrow = c(1, 1), mar = c(1, 1, 1, 1))
plotCellMapping(feat.object, control = list(gcm.approach = "mean"))
dev.off()

png("example_cm3.png", width = 600, height = 600)
par(mfrow = c(1, 1), mar = c(1, 1, 1, 1))
plotCellMapping(feat.object, control = list(gcm.approach = "near"))
dev.off()

png("example_bt2d_1.png", width = 600, height = 600)
par(mfrow = c(1, 1), mar = c(1, 1, 1, 1))
plotBarrierTree2D(feat.object, control = list(gcm.approach = "near"))
dev.off()

png("example_bt2d_2.png", width = 600, height = 600)
par(mfrow = c(1, 1), mar = c(1, 1, 1, 1))
plotBarrierTree2D(feat.object, control = list(gcm.approach = "near", bt.cm_surface = FALSE))
dev.off()

svg("example_bt3d_1.svg", width = 9, height = 9)
par(mfrow = c(1, 1), mar = c(2, 1, 1, 1))
plotBarrierTree3D(feat.object, control = list(gcm.approach = "near"))
dev.off()

svg("example_bt3d_2.svg", width = 9, height = 9)
par(mfrow = c(1, 1), mar = c(2, 1, 1, 1))
ctrl = list(gcm.approach = "near", bt.color_surface = "lightblue",
  bt.persp_theta = 135, bt.persp_phi = 35)
plotBarrierTree3D(feat.object, control = ctrl)
dev.off()

svg("example_info1.svg", width = 9, height = 9)
par(mfrow = c(1, 1), mar = c(4, 4, 1, 1))
plotInformationContent(feat.object)
dev.off()

svg("example_info2.svg", width = 9, height = 9)
par(mfrow = c(1, 1), mar = c(4, 4, 1, 1))
ctrl = list(ic.info_sensitivity = 0.3, ic.plot.max_ic.lwd = 4, ic.plot.partial_ic.lwd = 3)
plotInformationContent(feat.object, control = ctrl)
dev.off()

svg("example_feat_imp1.svg", width = 9, height = 9)
par(mfrow = c(1, 1), mar = c(2, 4, 1, 1))
plotFeatureImportance(featureList)
dev.off()

svg("example_feat_imp2.svg", width = 9, height = 9)
par(mfrow = c(1, 1), mar = c(2, 4, 1, 1))
ctrl = list(featimp.string_angle = 20, featimp.pch_inactive = 8)
plotFeatureImportance(featureList, control = ctrl)
dev.off()
