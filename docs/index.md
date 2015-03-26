# flacco Tutorial

This tutorial introduces you to the calculation of exploratory landscape analysis (ELA) features using the [**flacco** R package](https://github.com/kerschke/flacco).

The current development version of the R package can be obtained from [GitHub](https://github.com/kerschke/flacco).

## Quick start

### Calculation of a simple feature

For simple features you typically only need to supply the data that you have at hand. For this, the parameters `X` and `y` of the function `createFeatureObject` are used, as illustrated in the example below.

The function `createFeatureObject` creates a `FeatureObject` instance which holds relevant information about the input data. These instances are always the first argument to any feature-calculating function in **flacco**.

```{r}
library(flacco)

## (1) Create a feature object
X = t(replicate( n = 2000, expr = runif(n = 5, min = -10, max = 10) ))
y = apply(X, 1, function(x) { x^2 })
feat.object = createFeatureObject(X = x, y = y)

## (2) Have a look at feat.object, if you want to
print(feat.object)

## (3) Compute the meta model features
calculateMetaModel(feat.object)
```



### Calculation of a simple feature that needs additional function evaluations

Some features need to know the original function, so that they can perform further evaluations that are necessary to compute feature values. This is enabled by the `FeatureObject` which can also hold a function expression.

Note that you can also only pass `X` and `fun` for the creation of a `FeatureObject` -- values of `y` will be derived automatically!

For example, the `calculateConvexity` feature function needs to know the original function. But don't worry -- if you do not pass the function, `calculateConvexity` will complain and give you a hint.

```{r}
library(flacco)

## (1) Create a feature object
X = t(replicate( n = 2000, expr = runif(n = 5, min = -10, max = 10) ))
feat.object = createFeatureObject(X = x, fun = function(x) { x^2 })

## (2) Have a look at feat.object, if you want to
print(feat.object)

## (3) Compute the convexity features
calculateConvexity(feat.object)
```

The manual of the function typically indicates how many additional evaluations will be needed. In this specific example you may also control how large the generated sample should be:

```{r}
## (3.a) Compute the convexity features using a sample of 500, 
##                instead of the default of 1000
calculateConvexity(feat.object, control = list(
    convex.nsample = 500
  ))
```

Many functions support passing the `control` list parameter to configure some details on how features should be computed. However, each function supports different parameters. It is therefore useful to look into the documentation and find out what can be adapted.

