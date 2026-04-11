class_name MicroBitRelayLedsIfScreenOn
extends Node

signal on_screen_turned_on_changed(is_on:bool)
signal on_screen_turned_on_updated(is_on:bool)
signal on_screen_turned_off()
signal on_screen_turned_on()

signal on_relay_float_array_percent_0_1(value:Array[float])
signal on_relay_string_array_percent_0_9(value:String)

@export var screen_on:bool

@export_group("Screen On Off Options")
@export var send_screen_off_set_array:bool = true
@export var reset_string_off_screen_off:String = "00000 00000 00000 00000 00000"


func _ready() -> void:
	
	if send_screen_off_set_array:
		on_screen_turned_off.connect(_on_screen_turned_off)


func _on_screen_turned_off() -> void:
		on_relay_string_array_percent_0_9.emit(reset_string_off_screen_off)

#region Set getters and setters
func set_as_screen_disabled(is_disabled:bool) -> void:
	set_screen_on(not is_disabled)

func set_screen_on(value:bool) -> void:
	var is_changed = screen_on != value
	if is_changed:
		screen_on = value
		on_screen_turned_on_changed.emit(screen_on)
		if screen_on:
			on_screen_turned_on.emit()
		else:
			on_screen_turned_off.emit()
	on_screen_turned_on_updated.emit(screen_on)

func is_screen_on() -> bool:
	return screen_on

#endregion		


#region relay methods

func relay_float_array_percent_0_1(value:Array[float]) -> void:
	if is_screen_on():
		on_relay_float_array_percent_0_1.emit(value)

func relay_string_array_percent_0_9(value:String) -> void:
	if is_screen_on():
		on_relay_string_array_percent_0_9.emit(value)


#endregion
