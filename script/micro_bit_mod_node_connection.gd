## NEED TO BE TESTING 
## TWO TASK IN COMING
## MAKE AN ABSTRACT FACADE OF A MICRO:BIT THAT DONT CARE OF
## THE 3D, 2D MODELS REPRESENTATION OF THE BIT
## VERIFY THAT THE MOD WE CREATE HERE IS WORKING AND CONNET IT TO THE ABSTRACT FACADE OF THE MICRO:BIT.

class_name MicroBitModNodeConnection
extends Node


@export var node_to_affect:Node

@export_group("Variable name in node to affect")
@export_group("BASIC")
@export_group("VARIABLE")
@export var variable_name_button_a:String = "button_a"
@export var variable_name_button_b:String = "button_b"
@export var variable_name_button_reset:String = "button_reset"
@export var variable_name_leds_5x5:String = "leds_percent_5x5"
@export var variable_name_is_screen_disabled:String = "is_screen_disabled"
@export_group("METHODE")
@export var method_name_set_button_a:String = "mod_in_set_button_a"
@export var method_name_set_button_b:String = "mod_in_set_button_b"
@export var method_name_set_button_reset:String = "mod_in_set_button_reset"
@export var method_name_set_leds_percent_array_5x5:String = "mod_in_set_leds_percent_array"
@export var method_name_set_is_screen_disabled:String = "mod_in_set_is_screen_disabled"



@export_group("BASIC PLUS")
@export_group("VARIABLE")
@export var variable_name_light:String = "light_0_255"
@export var variable_name_microphone:String = "microphone_0_255"
@export var variable_name_compass:String = "compass_0_360"
@export var variable_name_temperature:String = "temperature_50"
@export var variable_name_pin_button_0:String = "pin_as_button_0"
@export var variable_name_pin_button_1:String = "pin_as_button_1"
@export var variable_name_pin_button_2:String = "pin_as_button_2"
@export var variable_name_pin_button_logo:String = "pin_as_button_logo"
@export_group("METHODE")
@export var method_name_set_light:String = "mod_in_set_light"
@export var method_name_set_microphone:String = "mod_in_set_microphone"
@export var method_name_set_compass:String = "mod_in_set_compass"
@export var method_name_set_temperature:String = "mod_in_set_temperature"
@export var method_name_set_pin_button_0:String = "mod_in_set_pin_as_button_0"
@export var method_name_set_pin_button_1:String = "mod_in_set_pin_as_button_1"
@export var method_name_set_pin_button_2:String = "mod_in_set_pin_as_button_2"
@export var method_name_set_pin_button_logo:String = "mod_in_set_pin_as_button_logo"

@export_group("SHAKING")
@export_group("VARIABLE")
@export var variable_name_is_shaking:String = "is_shaking"
@export var variable_name_is_falling:String = "is_falling"
@export var variable_name_is_over_3g:String = "is_over_3g"
@export var variable_name_is_over_6g:String = "is_over_6g"
@export var variable_name_is_over_8g:String = "is_over_8g"

@export_group("PINS")
@export_group("VARIABLE")
@export var variable_name_pins_is_digital_mode:String = "pins_is_digital_mode"
@export var variable_name_pins_is_writing_mode:String = "pins_is_writing_mode"
@export var variable_name_pins_value_state_0_1023:String = "pins_value_state_0_1023"

@export_group("TILT ESTIMATION")
@export_group("VARIABLE")
@export var variable_name_tilt_plane_x_left_right_180:String = "tilt_plane_x_left_right_180"
@export var variable_name_tilt_plane_y_back_to_front_180:String = "tilt_plane_y_back_to_front_180"
@export var variable_name_tilt_wheel_left_right_180:String = "tilt_wheel_left_right_180"

@export_group("ACCELEROMETER SIMULATION")
@export_group("VARIABLE")
@export var variable_name_accelerometer_x_2000_mg:String = "accelerometer_x_2000_mg"
@export var variable_name_accelerometer_y_2000_mg:String = "accelerometer_y_2000_mg"
@export var variable_name_accelerometer_z_2000_mg:String = "accelerometer_z_2000_mg"



#region BASIC 
func mod_in_set_and_affect_is_screen_disabled(is_disabled:bool):
	mod_in_set_and_affect_from_var_method_name(variable_name_is_screen_disabled,method_name_set_is_screen_disabled, is_disabled)

func mod_in_set_and_affect_button_a(press_value:bool):
	mod_in_set_and_affect_from_var_method_name(variable_name_button_a,method_name_set_button_a, press_value)
	

func mod_in_set_and_affect_button_b(press_value:bool):
	mod_in_set_and_affect_from_var_method_name(variable_name_button_b,method_name_set_button_b, press_value)


func mod_in_set_and_affect_button_reset(press_value:bool):
	mod_in_set_and_affect_from_var_method_name(variable_name_button_reset,method_name_set_button_reset, press_value)


func mod_in_set_and_affect_leds_array_5x5_percent(array_percent:Array[float]):
	mod_in_set_and_affect_from_var_method_name(variable_name_leds_5x5,method_name_set_leds_percent_array_5x5, array_percent)

		

#endregion

#region BASIC PLUS
func mod_in_set_and_affect_light(light_0_255:int):
	mod_in_set_and_affect_from_var_method_name(variable_name_light,method_name_set_light, light_0_255)
func mod_in_set_and_affect_microphone(microphone_0_255:int):
	mod_in_set_and_affect_from_var_method_name(variable_name_microphone,method_name_set_microphone, microphone_0_255)
func mod_in_set_and_affect_compass(compass_0_360:float):
	mod_in_set_and_affect_from_var_method_name(variable_name_compass,method_name_set_compass, compass_0_360)
func mod_in_set_and_affect_temperature(temperature_50:float):
	mod_in_set_and_affect_from_var_method_name(variable_name_temperature,method_name_set_temperature, temperature_50)
func mod_in_set_and_affect_pin_as_button_0(pin_as_button_0:bool):
	mod_in_set_and_affect_from_var_method_name(variable_name_pin_button_0,method_name_set_pin_button_0, pin_as_button_0)
func mod_in_set_and_affect_pin_as_button_1(pin_as_button_1:bool):
	mod_in_set_and_affect_from_var_method_name(variable_name_pin_button_1,method_name_set_pin_button_1, pin_as_button_1)
func mod_in_set_and_affect_pin_as_button_2(pin_as_button_2:bool):
	mod_in_set_and_affect_from_var_method_name(variable_name_pin_button_2,method_name_set_pin_button_2, pin_as_button_2)
func mod_in_set_and_affect_pin_as_button_logo(pin_as_button_logo:bool):
	mod_in_set_and_affect_from_var_method_name(variable_name_pin_button_logo,method_name_set_pin_button_logo, pin_as_button_logo)

#endregion

#region SHAKING
func mod_in_set_and_affect_is_shaking(is_shaking:bool):
	mod_in_set_variable_from_name(variable_name_is_shaking, is_shaking)

func mod_in_set_and_affect_is_falling(is_falling:bool):
	mod_in_set_variable_from_name(variable_name_is_falling, is_falling)

func mod_in_set_and_affect_is_over_3g(is_over_3g:bool):
	mod_in_set_variable_from_name(variable_name_is_over_3g, is_over_3g)

func mod_in_set_and_affect_is_over_6g(is_over_6g:bool):
	mod_in_set_variable_from_name(variable_name_is_over_6g, is_over_6g)

func mod_in_set_and_affect_is_over_8g(is_over_8g:bool):
	mod_in_set_variable_from_name(variable_name_is_over_8g, is_over_8g)
#endregion



#region ACCELEROMETER SIMULATION
func mod_in_affect_accelerometer(x_2000_mg:float, y_2000_mg:float, z_2000_mg:float):
	mod_in_set_variable_from_name(variable_name_accelerometer_x_2000_mg, x_2000_mg)
	mod_in_set_variable_from_name(variable_name_accelerometer_y_2000_mg, y_2000_mg)
	mod_in_set_variable_from_name(variable_name_accelerometer_z_2000_mg, z_2000_mg)
#endregion

#region TILT ESTIMATION
func mod_in_affect_tilt_estimation(tilt_plane_x_left_right_180:float, tilt_plane_y_back_to_front_180:float, tilt_wheel_left_right_180:float):
	mod_in_set_variable_from_name(variable_name_tilt_plane_x_left_right_180, tilt_plane_x_left_right_180)
	mod_in_set_variable_from_name(variable_name_tilt_plane_y_back_to_front_180, tilt_plane_y_back_to_front_180)
	mod_in_set_variable_from_name(variable_name_tilt_wheel_left_right_180, tilt_wheel_left_right_180)

func mod_in_affect_tilt_plane_x_left_right_180(tilt_plane_x_left_right_180:float):
	mod_in_set_variable_from_name(variable_name_tilt_plane_x_left_right_180, tilt_plane_x_left_right_180)

func mod_in_affect_tilt_plane_y_back_to_front_180(tilt_plane_y_back_to_front_180:float):
	mod_in_set_variable_from_name(variable_name_tilt_plane_y_back_to_front_180, tilt_plane_y_back_to_front_180)

func mod_in_affect_tilt_wheel_left_right_180(tilt_wheel_left_right_180:float):
	mod_in_set_variable_from_name(variable_name_tilt_wheel_left_right_180, tilt_wheel_left_right_180)
#endregion


#regions SIGNAL
signal mod_out_requested_text_command(text: String)
signal mod_out_requested_int_command(integer_action: int)
signal mod_out_requested_image_command(string_image_0_9: String)
signal mod_out_requested_sound_by_name_command(text: String)

signal mod_out_set_led_1d_percent_0_1(index_0_24:int,percent:float)
signal mod_out_set_led_1d_char_0_9(index_0_24:int,character:String)
signal mod_out_set_led_2d_percent_0_1(x_left_right_0_4:int, y_top_down_0_4:int, percent:float)
signal mod_out_set_led_2d_char_0_9(x_left_right_0_4:int, y_top_down_0_4:int, character:String)

signal mod_out_set_touch_mode_as_capacitive(index_0_2:int)
signal mod_out_set_touch_mode_as_resitive(index_0_2:int)


@export var signal_name_listen_to_text_command:String = "mod_out_on_request_text_command"
@export var signal_name_listen_to_int_command:String = "mod_out_on_request_int_command"
@export var signal_name_listen_to_image_command:String = "mod_out_on_request_image_command"
@export var signal_name_listen_to_sound_by_name_command:String = "mod_out_on_request_sound_by_name_command"

@export var signal_name_listen_to_set_1d_percent:String = "mod_out_set_led_1d_percent_0_1"
@export var signal_name_listen_to_set_1d_char:String 	= "mod_out_set_led_1d_char_0_9"
@export var signal_name_listen_to_set_2d_percent:String = "mod_out_set_led_2d_percent_0_1"
@export var signal_name_listen_to_set_2d_char:String 	= "mod_out_set_led_2d_char_0_9"

@export var signal_name_listen_to_set_touch_mode_as_capacitive:String = "mod_out_set_touch_mode_as_capacitive"
@export var signal_name_listen_to_set_touch_mode_as_resitive:String = "mod_out_set_touch_mode_as_resitive"

#regions SIGNAL
## GIVE THE NODE TO FOCUS ON TO COMMUNICATE BETWEEN DEVELOPER AND THE USER SCRIPT
func set_node_to_affect(given_node: Node):
	# TODO LATER Remove from previous node signal listen
	# IN CASE IT IS NOT DESTROYED BEFORE
	node_to_affect = given_node
	connect_signals_to_given_node(node_to_affect)

## CONNECT THE SIGNALS IN THE USER SCRIPT TO THE SIGNALS OF THIS NODE TO COMMUNICATE BETWEEN DEVELOPER AND THE USER SCRIPT
func connect_signals_to_given_node(given_node: Node):
	mod_out_connect_signal_in_node_to_callable(signal_name_listen_to_text_command, mod_out_requested_text_command.emit)
	mod_out_connect_signal_in_node_to_callable(signal_name_listen_to_image_command, mod_out_requested_image_command.emit)
	mod_out_connect_signal_in_node_to_callable(signal_name_listen_to_int_command, mod_out_requested_int_command.emit)
	mod_out_connect_signal_in_node_to_callable(signal_name_listen_to_sound_by_name_command, mod_out_requested_sound_by_name_command.emit)


	mod_out_connect_signal_in_node_to_callable(signal_name_listen_to_set_1d_char, mod_out_set_led_1d_char_0_9.emit)
	mod_out_connect_signal_in_node_to_callable(signal_name_listen_to_set_1d_percent, mod_out_set_led_1d_percent_0_1.emit)
	mod_out_connect_signal_in_node_to_callable(signal_name_listen_to_set_2d_char, mod_out_set_led_2d_char_0_9.emit)
	mod_out_connect_signal_in_node_to_callable(signal_name_listen_to_set_2d_percent, mod_out_set_led_2d_percent_0_1.emit)

	mod_out_connect_signal_in_node_to_callable(signal_name_listen_to_set_touch_mode_as_capacitive, mod_out_set_touch_mode_as_capacitive.emit)
	mod_out_connect_signal_in_node_to_callable(signal_name_listen_to_set_touch_mode_as_resitive, mod_out_set_touch_mode_as_resitive.emit)
#endregion

#region RANDOM TESTING

## FOR TESTING RANDOMISE THE LEDS VALUE OF THE USER SCRIPT
func mod_in_set_leds_with_random_array():
		var random_5x5:Array[float]= []
		for i in range(25):
			random_5x5.append(randf())
		mod_in_set_and_affect_leds_array_5x5_percent(random_5x5)
#endregion

#region GENERIC FUNCTIONS

## CONNET A SIGNAL IN THE USER SCRIPT TO A FUNCTION 
func mod_out_connect_signal_in_node_to_callable(signal_name:String, callable: Callable):
	if node_to_affect and node_to_affect.has_signal(signal_name):
		node_to_affect.connect(
			signal_name,
			callable
		)


## OVERRIDE A VARIABLE FROM IT NAME WITH A GIVEN UNTYPE VALUE
func mod_in_set_variable_from_name(variable_name:String, value):
	if not node_to_affect:
		return
	if variable_name in node_to_affect:
		node_to_affect.set(variable_name, value)
		
## CALL A METHOD FROM IT NAME WITH A GIVEN UNTYPE VALUE
func mod_in_call_method_with_one_varible(method_name:String,value):
	if not node_to_affect:
		return 
	if node_to_affect.has_method(method_name):
		node_to_affect.call(method_name,value)

## CALL A METHOD FROM IT NAME WITHOUT PARAMS
func mod_in_call_method_without_params(method_name:String):
	if not node_to_affect:
		return 
	if node_to_affect.has_method(method_name):
		node_to_affect.call(method_name)

## OVERRIDE A VARIABLE AND CALL A METHOD FROM IT NAME WITH A GIVEN UNTYPE VALUE
func mod_in_set_and_affect_from_var_method_name(var_name:String, method_name:String, value):
	mod_in_set_variable_from_name(var_name,value )
	mod_in_call_method_with_one_varible(method_name,value)
	
#endregion
