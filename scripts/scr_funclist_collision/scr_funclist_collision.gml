function func_collisioninit()
{
	hsp = 0
	vsp = 0
	hasdonecollisionthisframe = false
}
function func_solidcheck(_newx,_newy)
{
	///deprecated and set for deletion, do not use
	var _old_x = x
	var _old_y = y
	x = _newx
	y = _newy
	if place_meeting(x, y, obj_mapparent)
	{
	    x = _old_x
	    y = _old_y
	    return 1;
	}
	x = _old_x
	y = _old_y
	return 0;
}
function func_collide(_targetobjects=[obj_mapparent])
{
	///!!!BACK IN BUSINESS!!!
	var _i = abs(vsp);
	var _j = _i;

	while (_i > 0)
	{
		var _foundcollision = false
		var _amounttoadd = sign(vsp)
		if _j < 1
			_amounttoadd = _j*sign(vsp)
		for (var _m = 0; _m < array_length(_targetobjects); _m++)
		{
			if func_placemeetingalt(x,y+_amounttoadd,array_get(_targetobjects,_m))
				_foundcollision = true
		}
	    if _foundcollision == false
	    {
	        y += _amounttoadd;
	        _j -= abs(_amounttoadd);
	        if _j > 0
				continue;
	    }
	    else
		{
			//vsp = 0;
		}
		break;
	}

	_i = abs(hsp);
	_j = _i;
	while (_i > 0)
	{
		var _foundcollision = false
		var _amounttoadd = sign(hsp)
			if _j < 1
				_amounttoadd = _j*sign(hsp)
		for (var _m = 0; _m < array_length(_targetobjects); _m++)
		{
			if func_placemeetingalt(x+_amounttoadd,y,array_get(_targetobjects,_m))
				_foundcollision = true
		}
	    if _foundcollision == false
	    {
	        x += _amounttoadd;
	        _j -= abs(_amounttoadd);
	        if _j > 0
	            continue;
	    }
		else
		{
			//hsp = 0;
		}
		break;
	}
}
function func_move_towards_point_alt(argument0,argument1)
{
	hsp = lengthdir_x(argument1,argument0)
	vsp = lengthdir_y(argument1,argument0)
}
function func_placemeetingalt(_newx,_newy,_targetobject)
{
	var _old_x = x
	var _old_y = y
	x = _newx
	y = _newy
	if place_meeting(x,y,_targetobject)
	{
	    x = _old_x
	    y = _old_y
	    return 1;
	}
	x = _old_x
	y = _old_y
	return 0;
}
function func_placemeetingpath(_newx,_newy,_targetobject)
{
	var _old_x = x
	var _old_y = y
	x = _newx
	y = _newy
	var lerpprog = 0
	while lerpprog < 1
	{
		lerpprog += 0.1
		if place_meeting(lerp(_old_x,x,lerpprog),lerp(_old_y,y,lerpprog),_targetobject)
		{
		    x = _old_x
		    y = _old_y
		    return 1;
		}
	}
	x = _old_x
	y = _old_y
	return 0;
}
function func_instanceplacepath(_newx,_newy,_targetobject)
{
	var _instanceatposition = noone
	var _old_x = x
	var _old_y = y
	var lerpprog = 0
	while lerpprog < 1
	{
		lerpprog += 0.1
		_instanceatposition = instance_place(lerp(_old_x,_newx,lerpprog),lerp(_old_y,_newy,lerpprog),_targetobject)
		if _instanceatposition != noone
		{
			break;
		}
	}
	return _instanceatposition;
}