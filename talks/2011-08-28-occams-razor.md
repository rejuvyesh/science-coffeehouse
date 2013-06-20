---
title: Occom's Razor
description: something
author: Jayesh Kumar Gupta 
date: 28 August, 2011
tags: math
---

Definition: When there are competing hypotheses equal in all respects to explain something, the one that makes the fewest assumptions is the easiest, and the most basic one.
How do we quantify it? -solomonoff's induction
Definition of complexity- length of a sentence cannot be taken as complexity (The witch did it is a simple explanation)
(Similarly, Maxwell's eqn seems tougher than an angry god to explain a thunderstorm)
it is easier to write a program for Maxwell's eqns than to simulate an angry God.
The shortest comp program that gives a description is the easiest one..
(Turing machine programs cans serve to quantify this)
In other times, some programs can give a correct prediction most of the time, prob of error is small- so these programs can be considered. 
eg a computer predicting results of a tossed coin:
1. Assume that it's fixed- always gives HTTHH- need to store 6 bits of data, and gives 64 times better fit to the data.
2. Coin is fair- also gives the fit, but don't need to store any data..

Minimum message length- need to minimise log(universal prob of model) + log(prob of data matching, given model is true)
The minimum message length also minimises sum of the strings that describe the code and describes data in the code..
