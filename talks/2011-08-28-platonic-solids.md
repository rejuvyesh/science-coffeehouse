---
title: Platonic Solids - Why only five?
description: something
author: Nitica
date: 28 August, 2011
tags: math
---

V = 4, 6, 8, 10, 12
Discreteness comes about because of the constraint that V etc must be integers..
prove Euler's eqn: Let o=V + F - E =2
Puncture a cube, remove a face. reduces V+F-E by 1. (will compensate later)
Add an edge (Now, I can't draw all that!) and remove a face. Doesn't change o,
Finally reduces to a triangle, for which o = 1
So, add one again- gives 2!

Convex polyhedron: sum of angles around a vertex < 2pi.
Thus, we can have at most 3 of them (3 faces that meet at an edge.)
x = no. of edges in a face.
y = no. of edges that meet at a vertex.

yV = 2E
xF = 2E

Sub: 1/y +1/x - 1/2 = 1/E
>0

also, x>3 and y>3
Thus, there are only five configurations: (3,3), (3,4), (3,5), (4,3), (5,3)
(Math talk about homemorphic, isomorphic, topology etc..)


Ish- interesting generalisations of V,E, F, HF to higher dimensions:
Therefore, a hypercube has V = 16, E =32, F=24, HF = 8.
Euler characteristic alternates- 0,2,0,2.. 0 for all even dimensions.
