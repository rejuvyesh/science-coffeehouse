---
title: Ising Model and Spin Glass System
description: Neural Something
author: Nitica
date: 2 march, 2013
tags: physics, neuro
---
-------Nitica---------
Ising model and spin glass system.

Attractor Networks:
Attractor neural networks
1. McCulloch Pitts discrete model 1940
2. Hebbian learning 1960s
3. Hopfield network.

1975- Spin glass (metastable states) <--> Modelling for associative memory


memory was modelled initially through chaotic attractors- 

Computer architectuer v/s Brain architecture.
Comp- deterministic, stores info in bits.

Brain- neurons that either fire or do not. It was tempting to say that they were analogous, as in  each neuron stores a bit. But this is not the case.

INterlinking of neurons. dendrites are like  an input to neurons, and it fires or not depending on the "weights" associated to each neuron. 
Jij - the input taken by the i'th neuron given by the j'th one. Information is stored here- in the weights of the connections between neurons
Number of links goes as ~N Choose 2

1. First model 1940:
h_i^{t+1} = \sum_j J_{ij} \sigma_j^t
and \sigma_i^{t+1} = 

h_i - psp (post synaptic potential) 

\sigma_j^t = 1 if the jth neuron fires at time t, 0 otherwise.
Model- assumed to be synchronous (they all update at the same time)
Discrete time model

Weights- J_{ij}-  depends on how "good" the connection between the neurons is.

threshold- T_i: If the above, h_i is greater than T_i, then in the next step the i'th neuron will fire.
Or
\sigma_j^t = \Theta(h_i - T_i)

(Too simplistic)

2. Hebbian learning- "neurons that fire together are wired together".
Seemed to give more correct results in accordance with data from neuroscience. 
J_{ij} changes in this model according to whether they fire together or not (increases if they do)

May saturate in some cases. 

We can have computations with the gates:
NOT gate:
J_{ij} = -1, and T_i = -1/2

AND 
Let T = 3/2 Both J's are 1

OR
Both J's 1, T = 1/2

Identity
T = 1/2

(can also construct NAND and NOR and hence every other)

3. Hopield model- J_{ij} = J_{ji}
symmetric J matrix to make calculations simpler.

Learning involves a plastic J_{ij} to begin with; learning needs a change in it.

Attractors- can have metastable states. 
Associative Memory- if we want to use all connections NC2 in an optimal way, we need a system with a lot of metastable states and attractors, instead of one stable minimum of potential that is a very good attractor and stores only one memory.


"Energy function for this " : 
H =  \sum{i} h_i^t \sigma_i 
 = \sum_{ij} J_{ij} \sigma_i^t \sigma_i^t

reminds us of Ising model- we'll relate to this later.

We have T =0

s_i = 1 or -1 depending on whether the i'th spin aligns with the field or against it.

E = -B \mu \sigma_i s_i - \sigma_{ij} J_{ij}s_i s_j

In absence of interaction, all would align with the field. (T=0)

In presence of interaction:
we take the nearest neighbour interaction only. We may take d dimensions so that the co-ordination number is 2*d. 

1. SK model- the interacion is distributed like a Gaussian.
2. little Hopfield model- J_{ij} = 1/N s_i s_j
3. 


What these models do- solve for the minima and the stable points and not their evolution.
















