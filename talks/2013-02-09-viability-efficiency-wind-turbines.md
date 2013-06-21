---
title: Viability and efficiency of translating wind turbines.
description: something
author: Harish
date: 9 February, 2013
tags: Physics
---

Wind farms- are established in places where wind is consistent, otherwise it is not viable.

Can we run automobiles against wind and generate more energy than we get?
Black box Model- fan kind of thing that reduces the speed of wind against which it is running. We aren't concerned about how exactly it works.
Energy required to move the automobile Q1, what we get is W1
From its frame, loooks quite okay. 

From ground frame, what happens is that wind energy is zero initially, and there is some kinetic energy in the automobile. After that the fluid has some energy (because in the auto frame its velocity changes). Hence this is not viable!

Power P = f(v)
P' is positive. If we take P'' > 0 too, it'll be favourable for us.
V = velocity of wind. v= automobile velocity.
In the P-v curve, the power generated must be greater than the power consumed. 

We need something quantitative to say something definitve.

Betz law: Puts somethng like a cap on the maximum efficiency of a wind turbine. 
Assume that there is a plate that interacts with the wind. (Takes in energy like a  sail)
Inicoming velocity v1, final velocity v2. b = v2/v1.

Betz law says that maximum power is obtained when b = 1/3.

IN moving frame- suppose the automobile moves at velocity 3v/2, the incoming wind would be at v = 3v/2, outgong = v/2 in the moving frame. IT's thus moving at v =0 in the ground frame, and we've extractd the maximum possible power  from the wind..

The design of the blades is such that since the blades are rotating, the apparent wind is in  a different direction, and some of the drag contributes to the thrust, and vice versa. (End of digression on design)

1. wind rotor- ideal converter of KE, has an infinite number of blades so that it sweeps all the area. (but still allows wind to pass)
2. Rotor to be taken at rest.

The actuator- disk model.

Wind velocity when far- U_\infty. After doing work on turbine, at a  far distance- U_w (wake region of the wind)
Taking a  stream tue of all the wind that is impinging on the fan, it has an area A1. (smaller than that of the fan.) Area afterwards, wake area  = A_2.

Continuity equation- m\dot = \pho*A1*U_infty = \pho A2 *v_r


Thrust  = \pho A v_r (U_infty-U_w)
How we get it:
Bernoulli equation:

P2 + .5\pho*vr^2 =  P0+0.5\pho*vw^2
P0 + 0.5\pho*v_infty^2= P1+0.5*\pho*vr^2

P2-P1 = 0.5*\pho*(U\infty-U_w)^2

Thrust from decrease in pressure = P2-P1 = 0.5*\pho*A*(U\infty-U_w)^2. Using the mass balance equation too, we get Ur = (U_w+U_infty)/2
Put it back to get the above equation.

Axial induction factor:
(U_infty-U_r)/U_infty= a.
Power derived from wind = 0.5*\pho*A*(U_infty^2-Uw^2)*Ur
U_r = U_infty(1-a)
(U_infty+U_w)/2 = U_r = U_infty(1-2a)

Now T = 0.5\po*A*U_infty^2*4a(1-a)
P = 0.5\pho*A*U_infty^3*4a(1-a)^2

dP/da = 0 => a = 1/3 or -1.

Therefore a = 1/3
C_p = maximum power = 59%
C_p = 4a(1-a)
C_t = 4a(1-a)^2

P = 0.5\pho*A*U_infty^3C_p
T = 0.5\pho*A*U_infty^2C_t*v

0<a<1

Now in a moving case in opposite directions,
P = 0.5\pho*A*(V+v)^3C_p
T = 0.5\pho*A*(V+v)^2C_t*v

Cp<Ct, so we can have a way of producing net energy moving through wind.

P > T iff 1+V/v = Ct/Cp = 1/1-a

How do we do this? 
