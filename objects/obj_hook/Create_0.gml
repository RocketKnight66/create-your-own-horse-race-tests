/// @description Insert description here
// You can write your code in this editor
depth = -1
func_collisioninit()
func_collisioninit_pointdir()

horseidentity = "Hook"
hasdonecollisionthisframe = false

currentmovespeed = 1
//targetangle = -22.5
targetangle = random_range(0,359)
acceleration = 0
overtimeacceleration = 0
knockbackrecieved = 0
knockbackangle = 0

defaultmovespeed = 0.5
accelerationamount = 0.0025
maxacceleration = 4
overtimeaccelerationamount = 1/func_minutestoframes(6)
overtimemaxacceleration = 6

knockbackintensity = 1
knockbackresistance = 1

angleincrement = 22.5
angleincrementdirectionmin = -2
angleincrementdirectionmax = 2
anglechangechance = 3

canxscaleflip = false
xscaleflipspeed = 0.1
xscaleflipdir = 1
xscalefliptargetdir = 1
eyeframe = 0
stepsoundcooldown = 0
afterimagecooldown = 0
dashlinecooldown = 0

bodycolor = make_color_rgb(17,240,13)
customstepsound = sfx_null
eyesprite = spr_null
winsprite = spr_fishhook
losesprite = -1
portraitsprite = spr_horseportrait_superstitionalrealism
portraitbgsprite = spr_horseportrait_bg_default
winsound = sfx_horse1
winjingle = sfx_winjingle_defaultdearly
jinglelength = func_secondstoframes(3.5)

introx = obj_fisher.x
introy = obj_fisher.y
drawx = introx
drawy = introy



