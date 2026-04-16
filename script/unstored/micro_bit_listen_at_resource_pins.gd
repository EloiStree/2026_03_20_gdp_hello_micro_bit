class_name MicroBitListenAtResourcePins
extends Node


@export var micro_bit_state:MicroBitResDataState


signal on_pins_updated_is_on_off(index_0_20:int, is_on:bool)
signal on_pins_updated_percent_state(index_0_20:int, percent_0_1:float)
signal on_pins_updated_analog_state(index_0_20:int, analog_value_0_1023:int)
signal on_pins_updated_as_digital_analog(index_0_20:int, is_digital:bool)
signal on_pins_updated_as_read_write(index_0_20:int, is_write:bool)
signal on_pins_updated_as_pull_up_or_down(index_0_20:int, is_pull_up:bool)
signal on_pins_updated_as_pull_state(index_0_20:int, is_pull_down:int)
signal on_pins_full_update(index_0_20:int, is_on:bool, percent_0_1:float, analog_value_0_1023:int, is_digital:bool, is_write:bool)

signal on_pin_0_on_off_updated(is_on:bool)
signal on_pin_1_on_off_updated(is_on:bool)
signal on_pin_2_on_off_updated(is_on:bool)
signal on_pin_3_on_off_updated(is_on:bool)


func _ready() -> void:
	micro_bit_state.on_pins_updated.connect(update_pin_info)

func update_pin_info():
	for i in range(21):
		var is_on = micro_bit_state.is_pin_in_on_state_0_1(i)
		emit_signal("on_pins_updated_is_on_off", i, is_on)
		var percent = micro_bit_state.get_pin_as_percent_0_1(i)
		emit_signal("on_pins_updated_percent_state", i, percent)
		var analog_value = micro_bit_state.get_pin_as_analog_0_1023(i)
		emit_signal("on_pins_updated_analog_state", i, analog_value)
		var is_digital = micro_bit_state.is_pin_in_digital_mode(i)
		emit_signal("on_pins_updated_as_digital_analog", i, is_digital)
		var is_write = micro_bit_state.is_pin_in_write_mode(i)

		var is_pull_up = micro_bit_state.is_pin_pull_up(i)
		var is_pull_down = micro_bit_state.is_pin_pull_down(i)
		var is_pull_none = micro_bit_state.is_pin_pull_none(i)
		var state_pull = micro_bit_state.get_pin_pull_resistor_state(i)

		emit_signal("on_pins_updated_as_pull_up_or_down", i, is_pull_up)
		emit_signal("on_pins_updated_as_pull_state", i, state_pull)

		emit_signal("on_pins_updated_as_read_write", i, is_write)
		emit_signal("on_pins_full_update", i, is_on, percent, analog_value, is_digital, is_write)
		if i==0:
			emit_signal("on_pin_0_on_off_updated", is_on)
		elif i==1:
			emit_signal("on_pin_1_on_off_updated", is_on)
		elif i==2:
			emit_signal("on_pin_2_on_off_updated", is_on)
		elif i==3:
			emit_signal("on_pin_3_on_off_updated", is_on)
