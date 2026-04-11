class_name MicroBitTactileButtonScriptAnimation
extends Node

signal on_button_changed_pression(percent_pressed_0_1:float)
signal on_button_updated_pression(percent_pressed_0_1:float)

@export_range(0,1,0.001) var pressing_state :float=0.0
@export var to_move:Node3D
@export var where_when_pressed:Node3D
@export var where_when_released:Node3D


func _ready() -> void:
	set_pressing_state_as_percent(pressing_state)
	
func set_as_pressing():
	set_pressing_state_as_percent(1)
	
func set_as_released():
	set_pressing_state_as_percent(0)
func set_pressing_state(is_pressing:bool):
	set_pressing_state_as_percent(1 if is_pressing else 0) 
	
func set_pressing_state_as_percent(percent_0_1:float):
	var changed :bool = pressing_state!=percent_0_1
	pressing_state =percent_0_1
	
	var v3_start :Vector3 =where_when_pressed.global_position
	var v3_end :Vector3=where_when_released.global_position
	#var v3_direction :Vector3 = v3_end -v3_start
	var v3_point_position = lerp(v3_start,v3_end,1.0-pressing_state )
	to_move.global_position = v3_point_position
	if changed:
		on_button_changed_pression.emit(percent_0_1)
	on_button_updated_pression.emit(percent_0_1)
	
	
