# Cell Mapping Features

The idea of *cell mapping* is that a continuous search space is partitioned in every dimension, thus achieving a discretization of the original search space into cells. This discretization of a sample into a number of cells, with several points per cell, allows for an improved estimation of properties such as the *global structure* and *multimodality* of an optimization problem.

# Angle

The initial idea of the *angle features* (`"cm_angle"`) is that the best and worst values within the cells might return some insight of the underlying function's landscape. If those two observations lie in opposite directions, it indicates a trend within the cell. In that case the angle between the vectors from cell center to worst value and cell center to best value would be close to 180&deg;.
By aggregating the angles of all cells from the grid (using the mean and the standard deviation), two features are provided.

```{r}
X = createInitialDesign(n.obs = 1200, dim = 3)
y = rowSums(X^2)
feat.object = createFeatureObject(X = X, y = y, blocks = c(4, 6, 3))
calculateFeatureSet(feat.object, set = "cm_angle")
``` 

Furthermore, the standard deviation and mean of the lengths of the two above-mentioned vectors (i.e. distances from the center of a cell to the best/worst observation within that cell) are used as additional features. In case of simple functions (such as the sphere function), the variation should be low as the majority of the cells should have similar distances -- due to the fact that they usually lie close to the borders of the cells. In case of very multimodal functions, the variation should be rather high as cells with local optima result in contrary distances (short distances of the best values and long distances of the worst values) compared to cells without any local optima.

Since interactions between cells are ignored, i.e. these features are computed locally per cell, the features are considered to be independent from the search space dimensionality.

![Illustration of the idea of Angle](angle.svg)

(Inspired by Kerschke, P. et al., 2014)


# Cell Convexity

For this feature set (`"cm_conv"`), all possible combinations of three (linearly) neighbouring cells within the grid are computed. Per default, only horizontally and vertically neighbouring cells are considered. By adding `cm_conv.diag = TRUE` to the list of control parameters, diagonally neighbouring cells are considered as well.

```{r}
X = createInitialDesign(n.obs = 1200, dim = 3)
y = rowSums(X^2)
feat.object = createFeatureObject(X = X, y = y, blocks = c(4, 6, 3))
calculateFeatureSet(feat.object, set = "cm_conv")
``` 

In all of those cases, each of the three cells is represented by a single prototype. Those are then used to approximate the concavity or convexity of the landscape.

Given the function evaluations of the three neighbouring cells, this feature is calculated by computing the convex-combination between f(x<sub>1</sub>) and f(x<sub>3</sub>) and comparing it to the value of f(x<sub>2</sub>). The figure below illustrates the resulting decision, i.e. whether a combination indicates convexity or concavity: Place the value of f(x<sub>2</sub>) above x<sub>2</sub> and infer the corresponding decision.

![Illustration of the decision for or against (strong) convexity](convexity.svg)

(Inspired by Kerschke, P. et al., 2014)

# Gradient Homogeneity

For every point within a cell's sample, the nearest neighbor is identified and afterwards, the normalized vectors, which are always rotated towards the better points, are computed. Then, all normalized vectors are summed up and divided by the maximal possible vector length (i.e. the number of points). In case of rather randomly distributed objective values, the fraction should be close to zero, because that would mean that the vectors are pointing in different directions. In case of a strong trend the value should be close to one (i.e., all vectors point into the same direction).

```{r}
X = createInitialDesign(n.obs = 1200, dim = 3)
y = rowSums(X^2)
feat.object = createFeatureObject(X = X, y = y, blocks = c(4, 6, 3))
calculateFeatureSet(feat.object, set = "cm_grad")
``` 

Based on the individual values of each cell, we then obtain two features by computing the mean and the standard deviation over all cells. Simple unimodal functions shall thus generate very high mean values.

![Illustration of the idea of Gradient Homogeneity](gradienthomogeneity.svg)

(Inspired by Kerschke, P. et al., 2014)

# Literature Reference
Kerschke, P. et al. (2014), "Cell Mapping Techniques for Exploratory Landscape Analysis", in EVOLVE-A Bridge between Probability, Set Oriented Numbers, and Evolutionary Computation V, pp. 151--131, Springer ([http://dx.doi.org/10.1007/978-3-319-07494-8_9](http://dx.doi.org/10.1007/978-3-319-07494-8_9)).