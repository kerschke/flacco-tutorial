# Barrier Trees

After discretizing the search space using [generalized cell mapping (GCM)](gcm.md) and choosing a representative value for every cell, **barrier trees** can be a helpful tool for characterizing a function's landscape. 

Since GCM is the basis, all barrier trees are also calculated for all three approaches `"min"`, `"mean"`, and `"near"` (see [GCM](gcm.md)).

The idea of barrier trees is to represent the landscape of an optimization function using trees. Every mininum -- no matter whether it is a local or global minimum -- is represented by a leaf of the tree. The remaining nodes in the tree represent saddle points, which connect the minima. A *saddle point* is the point of minimum height within a landscape, which has to be crossed in order to go from one local minimum to another one.

So far, the implementation of the barrier trees is only able to handle 2-dimensional problems.

## Calculating Barrier Tree Features 

The barrier tree features consist of the feature set `bt`. 

To calculate the `bt` features in **flacco** run the following code.

```{r}
library(flacco)

X = createInitialSample(n.obs = 5000, dim = 2)
fun = function(x) sum(x**2)

feat.object = createFeatureObject(X = X, fun = fun, blocks = 10)

calculateFeatureSet(
  feat.object = feat.object, 
  set = "bt"
)
```
For a complete overview of the features and their controll parameters, please refer to the documentation of `calculateFeatureSet`.

To calculate the `bt` features in **flaccoGUI** select "bt" under "Feature Set" as shown in the picture below.

![BT](example_gui_feat_bt.png)

Also have a look into the [visualization](viz_bt.md) techniques that come with barrier trees.


## Literature Reference
Flamm, C. et al. (2012), "Barrier Trees of Degenerate Landscapes", in Z. Phys. Chem. (216:2), pp. 155--173 ([http://dx.doi.org/10.1524/zpch.2002.216.2.155](http://dx.doi.org/10.1524/zpch.2002.216.2.155)).

