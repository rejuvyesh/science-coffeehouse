---
title: Cloth Line Problem
description: cloth something
author: Aditya Degala
date: 3 February, 2013
tags: physics
---

Pain- If one holds a 20 kg weight on 100 cm2 area, say the foot,  one feels
pain, but if he goes underwater, one doesn't, even if the pressure is the same
at a reasonable depth..

The point is that pain is felt by the nerves under shear stress..
if a weight is kept on the foot, the pressure is not isotropic, and there's
deformation.

Underwater, the only pain you feel is in the places where the body is hollow,
i.e lungs and sinuses.. 


Clothes line-\

To minimize tension at one end.
Minimization- trivial solution of one placed at the other end.

Mass of rope is neglected
The locus of the mass that is placed on the line is an ellipse. (since the rope
is taken to be massless)

Intuitively, one would say that it is maximum if it  is placed at the far end.

it turns out that it is minimum if it is placed neither midway nor near the
end, but somewhere in between.

FBD Drawn:
*-------------*
.           .
.        .
.     .
.  .
*

x = length of rope till mass. l-x = other end.
t1 tension in section x
t2 other section

d = distance between the endds (linear) = 1 (normalised)

mg/sin(theta) = T1/cos(alpha)

We must minimize x*cos(alpha)/(d*sin(alpha))

Solution:
8 lx^3 -12 l62x^2 - (2l^3-6l)x+l^4-1 =0

For l = 1.1, it comes out that the optimal x = 0.7 (maximizes tension)
