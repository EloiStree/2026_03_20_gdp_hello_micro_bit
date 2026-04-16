extends Node


@export var micro_bit_state:MicroBitResDataState

@export var pins_as_01:String
@export var pins_as_1023:String
@export var pins_as_da_digital_analog:String
@export var pins_as_rw_read_write:String
@export var pins_as_1_da_rw:String
@export var pins_as_und_pull_up_none_down:String

@export var use_console_debug_prints_at_updated:bool = false

signal on_pins_updated_as_01(text:String)
signal on_pins_updated_as_1023(text:String)
signal on_pins_updated_as_da_digital_analog(text:String)
signal on_pins_updated_as_rw_read_write(text:String)
signal on_pins_updated_as_und_pull_up_none_down(text:String)
signal on_pins_updated_as_1_da_rw(text:String)


func _ready() -> void:
	micro_bit_state.on_pins_updated.connect(update_pin_info)

func update_pin_info():
	pins_as_01 = micro_bit_state.get_pins_as_string_0_1()
	emit_signal("on_pins_updated_as_01", pins_as_01)
	pins_as_1023 = micro_bit_state.get_pins_as_string_0_1023()
	emit_signal("on_pins_updated_as_1023", pins_as_1023)
	pins_as_da_digital_analog = micro_bit_state.get_pins_as_string_digital_analog()
	emit_signal("on_pins_updated_as_da_digital_analog", pins_as_da_digital_analog)
	pins_as_rw_read_write = micro_bit_state.get_pins_as_string_read_write()
	emit_signal("on_pins_updated_as_rw_read_write", pins_as_rw_read_write)
	pins_as_1_da_rw = micro_bit_state.get_pins_as_string_1_digital_analog_read_write()
	emit_signal("on_pins_updated_as_1_da_rw", pins_as_1_da_rw)
	pins_as_und_pull_up_none_down = micro_bit_state.get_pins_as_pull_resistor_state()
	emit_signal("on_pins_updated_as_und_pull_up_none_down", pins_as_und_pull_up_none_down)
	if use_console_debug_prints_at_updated:
		display_pins_state_as_string_in_console()


	
func display_pins_state_as_string_in_console():
	print("Pins as 0/1: ", pins_as_01)
	print("Pins as 0-1023: ", pins_as_1023)
	print("Pins as Digital/Analog: ", pins_as_da_digital_analog)
	print("Pins as Read/Write: ", pins_as_rw_read_write)
	print("Pins as 1/Digital/Analog/Read/Write: ", pins_as_1_da_rw)
	print("Pins as Pull Up/None/Down: ", pins_as_und_pull_up_none_down)
