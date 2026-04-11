## MUST REPRESENT ONLY SIGNAL, SET, GET AND STATE NOT TAKING VIEW IN ACCOUNT

class_name MicroBitSetGetListenToDataStateOnly
extends Node

@export var state:MicroBitResDataState


signal on_button_a_updated(is_pressing:bool)
signal on_button_b_updated(is_pressing:bool)
signal on_button_reset_updated(is_pressing:bool)
signal on_button_logo_updated(is_pressing:bool)

signal on_button_a_changed(is_pressing:bool)
signal on_button_b_changed(is_pressing:bool)
signal on_button_reset_changed(is_pressing:bool)
signal on_button_logo_changed(is_pressing:bool)


##############
signal on_array_leds_updated(leds_state_percent_5x5:Array[float])
signal on_array_leds_as_line_updated(leds_line:String)
signal on_array_leds_as_square_updated(leds_square:String)

################
signal on_tilt_plane_x_left_right_180_updated(tilt_plane_x_left_right_180:float)
signal on_tilt_plane_y_back_to_front_180_updated(tilt_plane_y_back_to_front_180:float)
signal on_tilt_wheel_left_right_180_updated(tilt_wheel_left_right_180:float)

##############3
signal on_accelerometer_updated(accelerometer_x_2000_mg:float,accelerometer_y_2000_mg:float,accelerometer_z_2000_mg:float)
signal on_accelerometer_x_2000_mg_updated(accelerometer_x_2000_mg:float)
signal on_accelerometer_y_2000_mg_updated(accelerometer_y_2000_mg:float)
signal on_accelerometer_z_2000_mg_updated(accelerometer_z_2000_mg:float)
signal on_is_screen_disabled_updated(is_screen_disabled:bool)


signal on_temperature_50_updated(temperature_50:float)
signal on_compass_0_360_updated(compass_0_360:float)
signal on_microphone_0_255_updated(microphone_0_255:int)
signal on_microphone_0_255_changed(microphone_0_255:int)
signal on_light_0_255_updated(light_0_255:int)
signal on_light_0_255_changed(light_0_255:int)


signal on_device_shaking_updated(is_shaking)
signal on_device_falling_updated(is_falling)
signal on_device_over_3g_updated(is_over_3g)
signal on_device_over_6g_updated(is_over_6g)
signal on_device_over_8g_updated(is_over_8g)

signal on_device_shaking_changed(is_shaking)
signal on_device_falling_changed(is_falling)
signal on_device_over_3g_changed(is_over_3g)
signal on_device_over_6g_changed(is_over_6g)
signal on_device_over_8g_changed(is_over_8g)

signal on_pin_0_on_off_updated(is_on:bool)
signal on_pin_1_on_off_updated(is_on:bool)
signal on_pin_2_on_off_updated(is_on:bool)

signal on_pin_on_off_updated(pin_index:int,is_on:bool)
signal on_pin_value_updated(pin_index:int,value_0_1023:int)
signal on_pin_digital_mode_updated(pin_index:int,is_digital_mode:bool)
signal on_pin_write_mode_updated(pin_index:int,is_write_mode:bool)
signal on_pin_capacitive_mode_updated(pin_index:int,is_capacitive_mode:bool)
signal on_pins_updated()

func _ready() -> void:
	if state==null:
		state = MicroBitResDataState.new()
	state.on_button_a_updated.connect(on_button_a_updated.emit)
	state.on_button_b_updated.connect(on_button_b_updated.emit)
	state.on_button_reset_updated.connect(on_button_reset_updated.emit)
	state.on_button_logo_updated.connect(on_button_logo_updated.emit)
	
	state.on_button_a_changed.connect(on_button_a_changed.emit)
	state.on_button_b_changed.connect(on_button_b_changed.emit)
	state.on_button_reset_changed.connect(on_button_reset_changed.emit)
	state.on_button_logo_changed.connect(on_button_logo_changed.emit)
	
	state.on_array_leds_updated.connect(on_array_leds_updated.emit)

	state.on_tilt_plane_x_left_right_180_updated.connect(on_tilt_plane_x_left_right_180_updated.emit)
	state.on_tilt_plane_y_back_to_front_180_updated.connect(on_tilt_plane_y_back_to_front_180_updated.emit)
	state.on_tilt_wheel_left_right_180_updated.connect(on_tilt_wheel_left_right_180_updated.emit)

	state.on_accelerometer_updated.connect(on_accelerometer_updated.emit)
	state.on_accelerometer_x_2000_mg_updated.connect(on_accelerometer_x_2000_mg_updated.emit)
	state.on_accelerometer_y_2000_mg_updated.connect(on_accelerometer_y_2000_mg_updated.emit)
	state.on_accelerometer_z_2000_mg_updated.connect(on_accelerometer_z_2000_mg_updated.emit)
	state.on_is_screen_disabled_updated.connect(on_is_screen_disabled_updated.emit)

	state.on_temperature_50_updated.connect(on_temperature_50_updated.emit)
	state.on_compass_0_360_updated.connect(on_compass_0_360_updated.emit)
	
	state.on_microphone_0_255_changed.connect(on_microphone_0_255_changed.emit)
	state.on_microphone_0_255_updated.connect(on_microphone_0_255_updated.emit)

	state.on_light_0_255_updated.connect(on_light_0_255_updated.emit)
	state.on_light_0_255_changed.connect(on_light_0_255_changed.emit)

	state.on_device_shaking_updated.connect(on_device_shaking_updated.emit)
	state.on_device_falling_updated.connect(on_device_falling_updated.emit)
	state.on_device_over_3g_updated.connect(on_device_over_3g_updated.emit)
	state.on_device_over_6g_updated.connect(on_device_over_6g_updated.emit)
	state.on_device_over_8g_updated.connect(on_device_over_8g_updated.emit)

	state.on_device_shaking_changed.connect(on_device_shaking_changed.emit)
	state.on_device_falling_changed.connect(on_device_falling_changed.emit)
	state.on_device_over_3g_changed.connect(on_device_over_3g_changed.emit)
	state.on_device_over_6g_changed.connect(on_device_over_6g_changed.emit)
	state.on_device_over_8g_changed.connect(on_device_over_8g_changed.emit)	



	state.on_pin_0_on_off_updated.connect(on_pin_0_on_off_updated.emit)
	state.on_pin_1_on_off_updated.connect(on_pin_1_on_off_updated.emit)
	state.on_pin_2_on_off_updated.connect(on_pin_2_on_off_updated.emit)

	state.on_pin_on_off_updated.connect(on_pin_on_off_updated.emit)
	state.on_pin_value_updated.connect(on_pin_value_updated.emit)
	state.on_pin_digital_mode_updated.connect(on_pin_digital_mode_updated.emit)
	state.on_pin_write_mode_updated.connect(on_pin_write_mode_updated.emit)
	state.on_pin_capacitive_mode_updated.connect(on_pin_capacitive_mode_updated.emit)
	state.on_pins_updated.connect(on_pins_updated.emit)


	state.on_array_leds_updated.connect(turn_array_leds_as_line_updated)
	state.on_array_leds_updated.connect(turn_array_leds_as_square_updated)

#######################


func turn_array_leds_as_line_updated(leds_state_percent_5x5:Array[float])->void:
	var line = MicroBitToolArray5x5.get_grid_as_string_0_9(leds_state_percent_5x5,false)
	on_array_leds_as_line_updated.emit(line)

func turn_array_leds_as_square_updated(leds_state_percent_5x5:Array[float])->void:
	var square = MicroBitToolArray5x5.get_grid_as_string_0_9(leds_state_percent_5x5,true)
	on_array_leds_as_square_updated.emit(square)


func set_pin_on_off_0_19(pin_index_0_19:int, is_high:bool)->void:
	state.set_pin_analog_value_0_1023(pin_index_0_19,1023 if is_high else 0)

func get_pin_on_off_0_19(pin_index_0_19:int, threshold:int=512)->bool:
	return state.get_pin_analog_value_0_1023(pin_index_0_19) > threshold

func set_pin_0_on_off(is_high:bool)->void:
	set_pin_on_off_0_19(0,is_high)

func set_pin_1_on_off(is_high:bool)->void:
	set_pin_on_off_0_19(1,is_high)

func set_pin_2_on_off(is_high:bool)->void:
	set_pin_on_off_0_19(2,is_high)



################3


func set_device_as_shaking(is_shaking:bool)->void:
	state.set_device_as_shaking(is_shaking)

func set_device_as_falling(is_falling:bool)->void:
	state.set_device_as_falling(is_falling)

func set_device_as_over_3g(is_over_3g:bool)->void:
	state.set_device_as_over_3g(is_over_3g)
func set_device_as_over_6g(is_over_6g:bool)->void:
	state.set_device_as_over_6g(is_over_6g)
func set_device_as_over_8g(is_over_8g:bool)->void:
	state.set_device_as_over_8g(is_over_8g)

func is_device_shaking()->bool:
	return state.is_device_shaking()

func is_device_falling()->bool:
	return state.is_device_falling()

func is_device_over_3g()->bool:
	return state.is_device_over_3g()

func is_device_over_6g()->bool:
	return state.is_device_over_6g()

func is_device_over_8g()->bool:
	return state.is_device_over_8g()


#############

func set_light_0_255(light_0_255:int)->void:
	state.set_light_0_255(light_0_255)

func get_light_0_255()->int:
	return state.get_light_0_255()

func get_light_as_percent_0_1()->float:
	return state.get_light_as_percent_0_1()

func set_light_as_percent_0_1(light_percent_0_1:float)->void:
	state.set_light_0_255(int(light_percent_0_1*255.0))

func set_light_from_float_0_255(light_float_0_255:float)->void:
	state.set_light_0_255(int(light_float_0_255))


######################

func set_microphone_0_255(microphone_0_255:int)->void:
	state.set_microphone_0_255(microphone_0_255)

func get_microphone_0_255()->int:
	return state.get_microphone_0_255()

func get_microphone_as_percent_0_1()->float:
	return state.get_microphone_as_percent_0_1()


func set_microphone_as_percent_0_1(microphone_percent_0_1:float)->void:
	state.set_microphone_0_255(int(microphone_percent_0_1*255.0))

func set_microphone_from_float_0_255(microphone_float_0_255:float)->void:
	state.set_microphone_0_255(int(microphone_float_0_255))

#################################

func set_compass_0_360(compass_0_360:float)->void:
	state.set_compass_0_360(compass_0_360)

func get_compass_0_360()->float:
	return state.get_compass_0_360()

###########################3

func set_temperature_50(temperature_50:float)->void:
	state.set_temperature_50(temperature_50)

func get_temperature_50()->float:
	return state.get_temperature_50()




######################3


func set_is_screen_disabled(is_screen_disabled:bool)->void:
	state.set_is_screen_disabled(is_screen_disabled)

func get_is_screen_disabled()->bool:
	return state.get_is_screen_disabled()

func get_is_screen_enabled()->bool:
	return state.get_is_screen_enabled()


#####################

func set_accelerometer_x_2000_mg(accelerometer_x_2000_mg:float)->void:
	state.set_accelerometer_x_2000_mg(accelerometer_x_2000_mg)

func set_accelerometer_y_2000_mg(accelerometer_y_2000_mg:float)->void:
	state.set_accelerometer_y_2000_mg(accelerometer_y_2000_mg)

func set_accelerometer_z_2000_mg(accelerometer_z_2000_mg:float)->void:
	state.set_accelerometer_z_2000_mg(accelerometer_z_2000_mg)

func get_accelerometer_x_2000_mg()->float:
	return state.get_accelerometer_x_2000_mg()

func get_accelerometer_y_2000_mg()->float:
	return state.get_accelerometer_y_2000_mg()

func get_accelerometer_z_2000_mg()->float:
	return state.get_accelerometer_z_2000_mg()

func set_accelerometer_as_vector3_2000_mg(accelerometer_as_vector3_2000_mg:Vector3)->void:
	state.set_accelerometer_as_vector3_2000_mg(accelerometer_as_vector3_2000_mg)
	

func get_accelerometer_as_vector3_2000_mg()->Vector3:
	return state.get_accelerometer_as_vector3_2000_mg()


#####################
func set_tilt_plane_x_left_right_180(tilt_plane_x_left_right_180:float)->void:
	state.set_tilt_plane_x_left_right_180(tilt_plane_x_left_right_180)

func set_tilt_plane_y_back_to_front_180(tilt_plane_y_back_to_front_180:float)->void:
	state.set_tilt_plane_y_back_to_front_180(tilt_plane_y_back_to_front_180)

func set_tilt_wheel_left_right_180(tilt_wheel_left_right_180:float)->void:
	state.set_tilt_wheel_left_right_180(tilt_wheel_left_right_180)

func get_tilt_plane_x_left_right_180()->float:
	return state.get_tilt_plane_x_left_right_180()
func get_tilt_plane_y_back_to_front_180()->float:
	return state.get_tilt_plane_y_back_to_front_180()
func get_tilt_wheel_left_right_180()->float:
	return state.get_tilt_wheel_left_right_180()

#####################
func set_button_logo(is_pressed:bool)->void:
	state.set_button_logo(is_pressed)
func get_button_logo()->bool:
	return state.get_button_logo()

#######################

func set_leds_5x5_to_off():
	state.set_leds_5x5_with_percent_by_copy(MicroBitToolArray5x5.ARRAY_OF_ZERO)	

func set_leds_5x5_to_on():
	state.set_leds_5x5_with_percent_by_copy(MicroBitToolArray5x5.ARRAY_OF_ONE)

func set_leds_5x5_with_random_percent():
	var array = MicroBitToolArray5x5.get_random_array_5x5()
	state.set_leds_5x5_with_percent_by_copy(array)

func set_leds_5x5_with_percent_by_copy(leds_state:Array[float])->void:
	state.set_leds_5x5_with_percent_by_copy(leds_state)


func set_led_1d_with_percent_0_1(led_index_0_24:int,led_percent_0_1:float)->void:
	state.set_led_1d_percent_0_1(led_index_0_24,led_percent_0_1)

func set_led_1d_with_character(led_index_0_24:int, character:String):
	state.set_led_1d_with_character(led_index_0_24, character)

func set_led_2d_with_percent_0_1(x_left_right_0_4:int,y_top_down_0_4:int,led_percent_0_1:float)->void:
	state.set_led_2d_percent_0_1(x_left_right_0_4,y_top_down_0_4,led_percent_0_1)

func set_led_2d_with_character(x_left_right_0_4:int,y_top_down_0_4:int, character:String):
	state.set_led_2d_with_character(x_left_right_0_4,y_top_down_0_4, character)


func get_led_1d_percent_0_1(led_index_0_24:int)->float:
	return state.get_led_1d_percent_0_1(led_index_0_24)

func get_led_1d_character(led_index_0_24:int)->String:
	return state.get_led_1d_character(led_index_0_24)

func get_led_2d_percent_0_1(x_left_right_0_4:int,y_top_down_0_4:int)->float:
	return state.get_led_2d_percent_0_1(x_left_right_0_4,y_top_down_0_4)

func get_led_2d_character(x_left_right_0_4:int,y_top_down_0_4:int)->String:
	return state.get_led_2d_character(x_left_right_0_4,y_top_down_0_4)	

func get_leds_5x5_as_array_percent()->Array[float]:
	return state.get_leds_5x5_as_array_percent()

func get_leds_5x5_as_array_character()->Array[String]:
	return state.get_leds_5x5_as_array_character()

func get_leds_5x5_as_string()->String:
	return state.get_leds_5x5_as_string()


########################


func get_current_state()->MicroBitResDataState: 
	return state



#####################33

func set_button_a(is_pressed:bool)->void:
	state.set_button_a(is_pressed)

func set_button_b(is_pressed:bool)->void:
	state.set_button_b(is_pressed)

func set_button_reset(is_pressed:bool)->void:
	state.set_button_reset(is_pressed)


func get_button_a()->bool:
	return state.get_button_a()

func get_button_b()->bool:
	return state.get_button_b()

func get_button_reset()->bool:
	return state.get_button_reset()
