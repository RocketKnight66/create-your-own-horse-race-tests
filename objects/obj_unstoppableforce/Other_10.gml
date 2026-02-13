/// @description controlled step event
var _targetgoalmove = noone
var _targetgoaldistance = 9999
if instance_exists(obj_goal_apple)
{
    for (var _i=0; _i<instance_number(obj_goal_apple); _i++)
    {
        var _currentgoal = instance_find(obj_goal_apple,_i)
		var _currentgoaldistance = point_distance(x,y,_currentgoal.x,_currentgoal.y)
		if _currentgoaldistance < _targetgoaldistance
		{
			_targetgoalmove = _currentgoal
			_targetgoaldistance = _currentgoaldistance
		}
    }
	if _targetgoalmove != noone
	{
		currentmovespeed = 0.15
		//currentmovespeed = 1.5
		targetangle = point_direction(x,y,_targetgoalmove.x,_targetgoalmove.y)
		var _targethorse = noone
		var _targethorsedistance = 9999
		/*
		if instance_exists(obj_horseparent)
		{
		    for (var _i=0; _i<instance_number(obj_horseparent); _i++)
		    {
		        var _currenthorse = instance_find(obj_horseparent,_i)
				var _currenthorsedistancefromcomely = point_distance(x,y,_currenthorse.x,_currenthorse.y)
				var _currenthorsedistancefromgoal = point_distance(_targetgoalmove.x,_targetgoalmove.y,_currenthorse.x,_currenthorse.y)
				if _currenthorsedistancefromgoal < point_distance(x,y,_targetgoalmove.x,_targetgoalmove.y) && _currenthorsedistancefromcomely < _targethorsedistance
				{
					_targethorse = _currenthorse
					_targethorsedistance = _currenthorsedistancefromcomely
				}
		    }
			if _targethorse != noone
			{
				//currentmovespeed = 0.25
				currentmovespeed = 0.15
				targetangle = point_direction(x,y,_targethorse.x,_targethorse.y)
			}
		}
		*/
	}
}
func_move_towards_point_alt(targetangle,currentmovespeed)
//move_and_collide(hsp,vsp,obj_null)
func_collide([obj_null])



if place_meeting(x,y,obj_horseparent)
{
	var _collidingobject = instance_place(x,y,obj_horseparent)
	var _funnysound = audio_play_sound(sfx_stompfunny1,10,false)
	audio_sound_pitch(_funnysound,random_range(0.8,1.2))
	//x = _collidingobject.x
	//y = _collidingobject.y
	instance_destroy(_collidingobject)
}
if place_meeting(x,y,obj_pinball)
{
	var _collidingobject = instance_place(x,y,obj_pinball)
	var _funnysound = audio_play_sound(sfx_stompfunny1,10,false)
	audio_sound_pitch(_funnysound,random_range(0.8,1.2))
	//x = _collidingobject.x
	//y = _collidingobject.y
	instance_destroy(_collidingobject)
}
if place_meeting(x,y,obj_goal) && global.REMAINING_WIN_SLOTS > 0 && global.GAME_STATE = "normal"
{
	audio_play_sound(winsound,20,false)
	var _wineffect = instance_create_depth(x,y,0,obj_horsewineffect)
	_wineffect.sprite_index = sprite_index
	if array_length(global.WINNERS_LIST) <= 0
		global.WINJINGLE = winjingle
	array_insert(global.WINNERS_LIST,array_length(global.WINNERS_LIST),horseidentity)
	global.REMAINING_WIN_SLOTS--
	if global.REMAINING_WIN_SLOTS <= 0
	{
		audio_play_sound(sfx_gong,20,false)
		global.GAME_STATE = "raceend"
	}
	var _winninghorse = instance_create_depth(x,y,0,obj_winninghorse)
	_winninghorse.sprite_index = winsprite
	_winninghorse.winplacement = array_length(global.WINNERS_LIST)
	//_winninghorse.hsp = clamp(hsp,_winninghorse.maxhsp*-1.25,_winninghorse.maxhsp*1.25)
	//_winninghorse.vsp = clamp(vsp,_winninghorse.maxvsp*-1.25,_winninghorse.maxvsp*1.25)
	_winninghorse.hsp = clamp(hsp,_winninghorse.maxhsp*-1.25,_winninghorse.maxhsp*1.25)
	_winninghorse.vsp = clamp(vsp,_winninghorse.maxvsp*-1.25,_winninghorse.maxvsp*1.25)
	var _targetgoal = instance_place(x,y,obj_goal)
	if _targetgoal != -4
	{
		_winninghorse.targetgoal = _targetgoal
		global.CAM_TARGET_GOAL = _targetgoal
	}
	instance_destroy()
}
targetangle = func_fixangle(targetangle)
targetangle = round(targetangle)
eyeframe = round(targetangle/22.5)

