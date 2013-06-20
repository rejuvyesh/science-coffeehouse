---
title: Implant Hair on a Ball
description: something
author: Soumyajit
date: 26 January, 2013
tags: math
---

Try combing it so as to flatten every strand.
One can't do it at every point, and at one, the hair will have to stand up.
This happens in even dimensional spheres. (hairy ball theorem)
Even dimensional spheres cannot have a ontinuously differentiable tangent field.

Proving it- notion of distances and metric spaces.
Metric space- 
1. d>= 0
2. d(x-y) = d(y-x)
3. d(x-y) <= d(x-z) + d(z-y)

Open set: Every point has a neghbourhood that has another point of the set. (Like an open interal (a,b) )
In the above, Neighbourhood - open ball B(x_o,r) such that |x-x_o| < r
Hence, defining a measure is required to define an open set.

Building metrics for a topological space:
A topological space X:

1. X and {} are open sets.
2 Union of any number (eevne infinite) of open sets is open.
3. Intersection of open sets( fiinte) is open.

A basis- collection of open sets that has all the points of the space.

Function f: X->Y
if V is an  open set in Y, then f^-1(V) is open in X.

Connectedness:
Two sets U and V that are disjoint, and non empty, and their intersection is the whole set. If such a discomposition cannot be found, then it is simply connected.
Closed set: one such that its complement is open.
Different way to define connectedness: the only sets that are both open and closed are the whole set X and the empty set itself.

Compactness:

If an infinite set has a finite number of subcovers.
Cover: A collection of open sets that cover the space. (can be any subset)

Now, to the sphere A(compact):

u vector, v(u) \dot u = 0 defines the tangent to u.
f = u + t*v(u). The transformation f is such that
f is one-one and f(A) has a volume polynomial in t provided it is  sufficiently small.

Proof:
Mean value theorem: 
|v_i(x)-v_i(y)| = \sigma \grad V|_c *|x-y|
<= c_ij* |x_j-y_j|

(where the maximum of c_ij= c_ij*)

|v(x)-V(y)| <= c|x-y|
.
.
.


2. if t is sufficienty small, f_t takes the unit sphere to a sphere of radius \sqrt(1+t^2)
(Valid for appropriately small values of t, otherwise the Jacobian of the transformation may become zero)
For a<=r<=b
f(r*u) = r*f(u)

VOlume of ft(a) goes to (1+t^2)^n/2.
But this does not go to a polynomial in t, for an even dimensional sphere.
Not differentiable..












