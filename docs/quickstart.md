# Calculation of a Simple Feature

For simple features you typically only need to supply the data that you have at hand.  For this, the arguments `X` and `y` should be passed towards `createFeatureObject`, as illustrated in the example below.

The function `createFeatureObject` creates a `FeatureObject` instance which holds relevant information about the input data. These instances are always the first argument to any feature-calculating function in **flacco**.

```{r}
library(flacco)

## (1) Create some example-data
X = t(replicate( n = 2000, expr = runif(n = 5, min = -10, max = 10) ))
y = apply(X, 1, function(x) sum(x^2))

## (2) Compute the feature object
feat.object = createFeatureObject(X = X, y = y)

## (3) Have a look at feat.object
print(feat.object)

## (4) Calculate a feature set, e.g. the meta model features
calculateMetaModel(feat.object)
```


# Calculation of Expensive Features

Some features need to perform further function evaluations in order to compute the feature values. Therefore, one can pass the function `fun` to the `FeatureObject`.

Note, that it is also possible to only pass `X` and `fun` to `createFeatureObject` -- the values of `y` will be automatically be computed!

For example, the `calculateConvexity` feature function needs to know the original function. But don't worry -- if you don't pass the function, `calculateConvexity` will complain and give you a hint.

```{r}
library(flacco)

## (1) Create data (note that objective values are not set here!)
X = t(replicate( n = 2000, expr = runif(n = 5, min = -10, max = 10) ))

## (2) Compute the feature object
feat.object = createFeatureObject(X = X, fun = function(x) sum(x^2))

## (3) Have a look at feat.object
print(feat.object)

## (4) Calculate the convexity features
calculateConvexity(feat.object)
```

The manual of the function typically indicates how many additional evaluations will be needed. The following example shows you, how you could control the size of the generated sample:

```{r}
## Calculate the convexity features using a sample of size 500, 
## instead of the default of 1000.
calculateConvexity(feat.object, control = list(convex.nsample = 500))
```

A lot of our functions allow to configure certain details on how features
should be computed using the `control` list parameter. However, as each
function supports different parameters it is advisable to have a look into the
documentation of each function and find out which parameters can be adapted.


# Calculation of a Cell Mapping Feature

Cell mapping features differ from the others in the fact that they convert a
continuous search space into a discretized one. This is achieved by dividing
the entire search space into a grid with a finite amount of cells (per
dimension) and assigning each observation to exactly one cell. Afterwards, the
search space is only regarded as a set of discrete cells.

Consequently, you need to define the grid by setting the number of cells per
dimension when creating a `FeatureObject`, since -- from the perspective of
the cell mapping features -- it is part of the input data. If you don't provide
them, the attempt of computing a cell mapping feature will abort with an error.

```{r}
library(flacco)

## (1) Create data
X = t(replicate( n = 2000, expr = runif(n = 5, min = -10, max = 10) ))
y = apply(X, 1, function(x) sum(x^2))

## (2) Compute a feature object
feat.object = createFeatureObject(X = X, y = y, blocks = c(10, 5, 5, 8, 4))

## (3) Have a look at feat.object
print(feat.object)

## (4) Calculate cell mapping features, e.g. the gradient homogeneity features
calculateGradientHomogeneity(feat.object)
```

The above example splits the data into 10 blocks in the first dimension, 5
blocks in the second and third, 8 blocks in the fourth, and 4 blocks in the
fifth. If you always want the same amount of blocks in every dimension, you can
simplify your input by writing:

```{r}
## Compute the feature object
feat.object = createFeatureObject(X = X, y = y, blocks = 5)
``` 


# Creating Explanatory Plots

Some features come with additional plots that visualize the features or intermediate results. For example, the mechanics behind the [Generalized Cell Mapping approach](gcm.md) are sometimes hard to grasp.  For that reason, a plot visualizes a (two-dimensional) grid and indicated the transition probabilities from any cell to its basins using proportional arrows. 

```{r}
library(flacco)

## (1) Create data
X = replicate(n = 2000, expr = runif(n = 2, min = -10, max = 10))
X = t(X)
y = apply(X, 1, function(x) { 
  x[1]^4 + 100 * (x[1] - 3)^3 + 1000 * x[1] + x[2] 
})

## (2) Compute a feature object
feat.object = createFeatureObject(X = X, y = y, 
	lower = -10, upper = 10, blocks = 10)

## (3) Have a look at feat.object
print(feat.object)

## (4) Since three plots will be created -- one for each of the three
## approaches (Minimum, Average and Nearest Prototype) -- you might want to
## show them side-by-side
par(mfrow = c(1, 3))

## (5) Calculate the gradient homogeneity features
calculateGCMFeatures(feat.object, control = list(gcm.plot = TRUE))
```