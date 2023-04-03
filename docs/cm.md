# Cell Mapping Features

The idea of *cell mapping* is that a continuous search space is partitioned in every dimension and thus achieving a discretization of the original search space into cells. This discretization of the original sample into cells allows the computation of features, which help to characterize the *global structure* or *multimodality* of an optimization problem.
Based on this approach, three different feature sets can be computed: angle (`"cm_angle"`), convexity (`"cm_conv"`) and gradient homogeneity (`"cm_grad"`).

## Angle

The initial idea of the *angle features* (`"cm_angle"`) is that the best and worst values within the cells might return some insight of the underlying function's landscape. If those two observations lie in opposite directions, it indicates a trend within the cell. In that case the angle between the vectors from cell center to worst value and cell center to best value would be close to 180&deg;.
The angles of all cells from the grid will then be aggregated using the mean and the standard deviation.

Furthermore, the standard deviation and mean of the lengths of the two above-mentioned vectors (i.e. distances from the center of a cell to the best/worst observation within that cell) are used as additional features. In case of simple functions (such as the sphere function), the variation should be low as the majority of the cells should have similar distances -- due to the fact that they usually lie close to the borders of the cells. In case of very multimodal functions, the variation should be rather high as cells with local optima result in contrary distances (short distances of the best values and long distances of the worst values) compared to cells without any local optima.

Since interactions between cells are ignored, i.e. these features are computed locally per cell, the features are considered to be independent from the search space dimensionality.

![Illustration of the idea of Angle](angle.svg)

(Inspired by Kerschke, P. et al., 2014)


## Cell Convexity

For this feature set (`"cm_conv"`), all possible combinations of three (linearly) neighbouring cells within the grid are computed. Per default, only horizontally and vertically neighbouring cells are considered, however this can be specified as a control parameter to consider diagonally neighbouring cells aswell.

During the computation of the cell mapping convexity features, only the cells' representatives are considered. Based on those prototypes, the concavity or convexity of the landscape is approximated.

Given the function evaluations of the three neighbouring cells, this feature computes the convex-combination between f(x<sub>1</sub>) and f(x<sub>3</sub>). That value is then compared to the corresponding value of f(x<sub>2</sub>). The figure below illustrates the resulting decision, i.e. whether a combination indicates convexity or concavity. Just place the value of f(x<sub>2</sub>) above x<sub>2</sub> and infer the corresponding decision.

![Illustration of the decision for or against (strong) convexity](convexity.svg)

(Inspired by Kerschke, P. et al., 2014)

## Gradient Homogeneity

For every point within a cell's sample, the nearest neighbor is identified and afterwards, the normalized vectors, which are always rotated towards the better points, are computed. Then, all normalized vectors are summed up and divided by the maximal possible vector length (i.e. the number of points). In case of rather randomly distributed objective values, the fraction should be close to zero as this would indicate vectors, which are pointing in different directions. In case of a strong trend the value should be close to one (i.e., all vectors point into the same direction).

Those values are then aggregated over all cells -- again, using the mean and the standard deviation. Simple unimodal functions shall thus generate very high mean values.

![Illustration of the idea of Gradient Homogeneity](gradienthomogeneity.svg)

(Inspired by Kerschke, P. et al., 2014)

## Calculating Cell Mapping Features 

The cell mapping features consist of the feature sets `cm_angle`, `cm_conv` and `cm_grad`. Note that `cm_conv` requires an exact function to be stored in the feature object as additional calculations need to be performed. 

To calculate the `cm_angle` features in **flacco** run the following code, for the other feature sets substitute `"cm_angle"` with the desired set.

```{r}
library(flacco)

X = createInitialSample(n.obs = 5000, dim = 2)
fun = function(x) sum(x**2)

feat.object = createFeatureObject(X = X, fun = fun, blocks = 10)

calculateFeatureSet(
  feat.object = feat.object, 
  set = "cm_angle"
)
```
For a complete overview of the features and their controll parameters, please refer to the documentation of `calculateFeatureSet`.

To calculate the `cm_angle` features in **flaccoGUI** select "cm_angle" under "Feature Set" as shown in the picture below, for the other feature sets choose the desired alternative from the dropdown menu.

![CM angle](example_gui_feat_cm.png)

Also have a look into the [visualization](viz_cm.md) techniques that come with cell mapping.


## Literature Reference
Kerschke, P., Preuss, M., Hernandez, C., Schuetze, O., Sun, J.-Q., Grimme, C., Rudolph, G., Bischl, B., and Trautmann, H. (2014): "Cell Mapping Techniques for Exploratory Landscape Analysis", in: EVOLVE -- A Bridge between Probability, Set Oriented Numbers, and Evolutionary Computation V, pp. 151--131, Springer ([http://dx.doi.org/10.1007/978-3-319-07494-8_9](http://dx.doi.org/10.1007/978-3-319-07494-8_9)).
