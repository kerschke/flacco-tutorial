# Barrier Trees

After discretizing the search space using [generalized cell mapping (GCM)](gcm.md) and choosing a representative value for every cell, **barrier trees** can be a helpful tool for characterizing a function's landscape. 

Since GCM is the basis, all barrier trees are also calculated for all three approaches `"min"`, `"mean"`, and `"near"` (see [GCM](gcm.md)).

The idea of barrier trees is to represent the landscape of an optimization function using trees. Every mininum -- no matter whether it is a local or global minimum -- is represented by a leaf of the tree. The remaining nodes in the tree represent saddle points, which connect the minima. A *saddle point* is the point of minimum height within a landscape, which has to be crossed in order to go from one local minimum to another one.

So far, the implementation of the barrier trees is only able to handle 2-dimensional problems.

The following (visual) example might be useful to get a better understanding of the barrier trees.

```{r}
library(smoof)
library(flacco)

## (1) Create data
X = expand.grid(seq(0, 1, length.out = 50), seq(0, 1, length.out = 50))
f = smoof::makeBBOBFunction(dimension = 2, fid = 17, iid = 9)
y = apply(X, 1, f)

## (2) Compute a feature object
feat.object = createFeatureObject(X = X, y = y, fun = f, blocks = c(10, 10))

## (3) Plot a 2D version of the barrier trees
plotBarrierTree2D(feat.object, control = list(gcm.approach = "near", bt.cm_surface = FALSE))
```

![2D Barrier Tree](example_bt_2d.svg)

If a 2-dimensional figure is to abstract, the following 3-dimensional representation might be more helpful.

```{r}
## First, define a control object for a prettier figure (angles, colors, labels, etc.)
ctrl = list(gcm.approach = "near", bt.persp_border = "lightgrey",
  bt.persp_theta = 35, bt.persp_phi = 25, bt.color_surface = "pink",
  bt.persp_shade = 0.1, bt.persp_ticktype = "simple",
  bt.persp_xlab = "x", bt.persp_ylab = "y", bt.persp_zlab = "f(x, y)")

## Now, let's plot the barrier tree in 3D
plotBarrierTree3D(feat.object, control = ctrl)
```

![3D Barrier Tree](example_bt_3d.svg)

Based on the barrier trees, features describing the structure of the trees, can be computed using `set = "bt"`. These features encompass, amongst others, the number of levels, the distance between the leaves (i.e. the local optima) and the basin structure.

For a complete overview of the features, please refer to the documentation of `calculateFeatureSet`.

## Literature Reference
Flamm, C. et al. (2012), "Barrier Trees of Degenerate Landscapes", in Z. Phys. Chem. (216:2), pp. 155--173 ([http://dx.doi.org/10.1524/zpch.2002.216.2.155](http://dx.doi.org/10.1524/zpch.2002.216.2.155)).

