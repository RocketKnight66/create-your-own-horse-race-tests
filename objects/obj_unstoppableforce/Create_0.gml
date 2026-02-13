/// @description Insert description here
// You can write your code in this editor
depth = 1
func_collisioninit()

horseidentity = "Comely Material Morning"

currentmovespeed = 0.15
//targetangle = -22.5
targetangle = random_range(0,359)
acceleration = 0
overtimeacceleration = 0
knockbackrecieved = 0
knockbackangle = 0

defaultmovespeed = 1.5
accelerationamount = 0.02
maxacceleration = 4
overtimeaccelerationamount = 1/func_minutestoframes(2)
overtimemaxacceleration = 6

knockbackintensity = 1
knockbackresistance = 1

angleincrement = 22.5
angleincrementdirectionmin = -2
angleincrementdirectionmax = 2
anglechangechance = 3

spritedirectionfacing = 1
eyeframe = 0
stepsoundcooldown = 0
afterimagecooldown = 0
dashlinecooldown = 0

bodycolor = make_color_rgb(255,175,255)
customstepsound = sfx_step
eyesprite = spr_horse_comelymaterialmorning_eyes
winsprite = spr_horse_comelymaterialmorning_win
portraitsprite = spr_horseportrait_comelymaterialmorning
portraitbgsprite = spr_horseportrait_bg_default
winsound = sfx_horse1
winjingle = sfx_winjingle_comelymaterialmorning
jinglelength = func_secondstoframes(6)

hiddenindarkness = false
