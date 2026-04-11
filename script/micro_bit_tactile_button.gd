

class_name MicroBitTactileButtonState
extends Node

signal on_pressing_updated(is_pressing:bool)
signal on_pressing_changed(is_pressing:bool)
signal on_ui_pressing_update(is_pressing:bool)
signal on_down()
signal on_up()

@export var pressing_state:bool =false
@export var was_pressed_last_frame:bool =false
var was_pressed_on_last_framed_delayed:bool=false

func is_pressed()->bool:
	return pressing_state==true
func is_released()->bool:
	return pressing_state==false
	
func was_pressed()->bool:
	return was_pressed_last_frame
	
func _ready():
	get_tree().process_frame.connect(_on_frame_end_start)

func _process(delta: float) -> void:
	
	#For testing need to be removed
	if was_pressed():
		print("Hey that was pressed once")


func _on_frame_end_start():
	#TODO: TEST THAT IT WORKS
	if was_pressed_on_last_framed_delayed==true:
		was_pressed_last_frame = was_pressed_on_last_framed_delayed
		was_pressed_on_last_framed_delayed=false
	else:
		was_pressed_last_frame = false
		
func set_as_pressing():
	set_pressing_value(true)
	
func set_as_released():
	set_pressing_value(false)

func override_pressing_value_and_ui_state(is_pressing:bool):
	pressing_state = is_pressing
	on_ui_pressing_update.emit(is_pressing)
	
func set_pressing_value(is_pressing:bool):
	var changed:bool = pressing_state !=is_pressing
	pressing_state = is_pressing
	if changed:
		if is_pressing:
			was_pressed_on_last_framed_delayed=true
			on_down.emit()
		else:
			on_up.emit()
		on_pressing_changed.emit(is_pressing)
	on_pressing_updated.emit(is_pressing)
	on_ui_pressing_update.emit(is_pressing)
	
