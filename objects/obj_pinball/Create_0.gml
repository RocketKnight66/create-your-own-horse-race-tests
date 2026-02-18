/// @description Insert description here
// You can write your code in this editor
event_inherited()
func_collisioninit()
func_collisioninit_pointdir()

currentmovespeed = 4
acceleration = 0
grav = 0
gravamount = 0.1
maxgrav = 20
//targetangle = 90
targetangle = irandom_range(0,360)
percievedangle = targetangle
gravangleamount = 2
gravdirection = 1
knockbackintensity = 2
knockbackresistance = 2

disappearing = false
disappearx = 0
disappeary = 0
