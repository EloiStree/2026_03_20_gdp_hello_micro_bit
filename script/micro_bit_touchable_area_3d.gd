class_name MicroBitTouchableArea3D
extends Area3D

signal on_down()
signal on_up()

@export var use_print_debug:bool =true
@export var pressing_state:bool = false

func is_pressed()->bool:
	return pressing_state==true
func is_released()->bool:
	return pressing_state==false

func _set_pressing_state(value_on:bool):
	var changed := value_on != pressing_state
	pressing_state= value_on
	if changed:
		if value_on:
			on_down.emit()
		else:
			on_up.emit()

func _input_event(camera, event, position, normal, shape_idx):
	# print(event)
	if (event is InputEventMouseButton or event is InputEventScreenTouch) and event.pressed:
		if use_print_debug:
			print("Pressed:",str(event)," Named:",name)
		_set_pressing_state(true)
	if (event is InputEventMouseButton or event is InputEventScreenTouch) and not event.pressed:
		if use_print_debug:
			print("Released:",str(event)," Named:",name)
		_set_pressing_state(false)
		
