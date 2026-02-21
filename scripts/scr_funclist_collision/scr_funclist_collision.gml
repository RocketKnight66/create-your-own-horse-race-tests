function func_collisioninit()
{
	hsp = 0
	vsp = 0
	//mass = 1
	//hdir = 1
	//vdir = 1
	hasdonecollisionthisframe = false
}
function func_physicsbounce()
{
	
}
function func_solidcheck(argument0,argument1)
{
	///obsolete...maybe?
	var old_x = x
	var old_y = y
	x = argument0
	y = argument1
	if place_meeting(x, y, obj_mapparent)
	{
	    x = old_x
	    y = old_y
	    return 1;
	}
	//if instance_exists(obj_platformdown)
    //{
	//	for (var i = 0; i < instance_number(obj_platformdown); i++)
	//	{
	//		enemy[i] = instance_find(obj_platformdown, i)
	//		if (y > old_y) && ((!place_meeting(x, old_y, enemy[i])) && place_meeting(x, y, enemy[i]))
	//		{
	//			x = old_x
	//			y = old_y
	//			return 1;
	//		}
	//	}
	//}
	x = old_x
	y = old_y
	return 0;
}
function func_collide()
{
	///!!!OBSOLETE!!!
	// CODE CLEANED UP
	var i = abs(vsp);
	var j = i;
	var k = 0
	var l = 0
	var shifted = false
	var maxdist = 12

	while (i > 0)
	{
	    if !func_solidcheck(x, y + sign(vsp))
	    {
	        y += sign(vsp);
	        j -= 1;
		
	        if j
	            continue;
	    }
	    else  //shift to the side
		{
			k = 0
			l = floor(abs(vsp))
			shifted = false
			/*while k < maxdist
			{
				k++
				if !func_solidcheck(x+(k*hdir), y + sign(vsp)) && l > 0
				{
					while l > 0
					{
						x += (hdir)
						if !func_solidcheck(x, y + sign(vsp))
							y += sign(vsp)
						l--
					}
					shifted = true
					break;
				}
				if !func_solidcheck(x+(k*-hdir), y + sign(vsp)) && l > 0
				{
					while l > 0
					{
						x += (-hdir)
						if !func_solidcheck(x, y + sign(vsp))
							y += sign(vsp)
						l--
					}
					shifted = true
					break;
				}
				
			}*/
			if shifted == false
				vsp = 0;
		}
		break; // not in original code put prevents the game from crashing
	}

	i = abs(hsp);
	j = i;
	while (i > 0)
	{
	    if !func_solidcheck(x + sign(hsp), y)
	    {
	        x += sign(hsp);
	        j -= 1;
		
	        if j
	            continue;
	    }
		else  //shift to the side
		{
			k = 0
			l = floor(abs(hsp))
			shifted = false
			/*while k < maxdist
			{
				k++
				if !func_solidcheck(x + sign(hsp), y+(k*vdir)) && l > 0
				{
					while l > 0
					{
						y += (vdir)
						if !func_solidcheck(x + sign(hsp), y)
							x += sign(hsp)
						l--
					}
					shifted = true
					break;
				}
				if !func_solidcheck(x + sign(hsp), y+(k*-vdir)) && l > 0
				{
					while l > 0
					{
						y += (-vdir)
						if !func_solidcheck(x + sign(hsp), y)
							x += sign(hsp)
						l--
					}
					shifted = true
					break;
				}
			}*/
			if shifted == false
				hsp = 0;
		}
		break; // not in original code put prevents the game from crashing
	}
}
function func_move_towards_point_alt(argument0,argument1)
{
	hsp = lengthdir_x(argument1,argument0)
	vsp = lengthdir_y(argument1,argument0)
}
function func_collisioninit_pointdir()
{
	spd = 0
	targetx = 0
	targety = 0
}
function func_solidcheck_pointdir(argument0,argument1,argument2)
{
	var old_x = x
	var old_y = y
	move_towards_point(argument0,argument1,argument2)
	if place_meeting(x, y, obj_mapparent)
	{
	    x = old_x
	    y = old_y
	    return 1;
	}
	//if instance_exists(obj_platformdown)
    //{
	//	for (var i = 0; i < instance_number(obj_platformdown); i++)
	//	{
	//		enemy[i] = instance_find(obj_platformdown, i)
	//		if (y > old_y) && ((!place_meeting(x, old_y, enemy[i])) && place_meeting(x, y, enemy[i]))
	//		{
	//			x = old_x
	//			y = old_y
	//			return 1;
	//		}
	//	}
	//}
	x = old_x
	y = old_y
	return 0;
}
function func_collide_pointdir()
{
	// CODE CLEANED UP
	var i = abs(spd);
	var j = i;
	while (i > 0)
	{
	    if !func_solidcheck_pointdir(targetx,targety,sign(spd)*0.2)
	    {
	        move_towards_point(targetx,targety,sign(spd)*0.1)
	        j -= 0.1;
		
	        if j
	            continue;
	    }
	    else
		{
			spd = 0;
			speed = 0;
		}
		break; // not in original code put prevents the game from crashing
	}
}
function func_placemeetingalt(argument0,argument1,argument2)
{
	///obsolete...maybe?
	var old_x = x
	var old_y = y
	x = argument0
	y = argument1
	var _targetobject = argument2
	if place_meeting(x, y, _targetobject)
	{
	    x = old_x
	    y = old_y
	    return 1;
	}
	x = old_x
	y = old_y
	return 0;
}