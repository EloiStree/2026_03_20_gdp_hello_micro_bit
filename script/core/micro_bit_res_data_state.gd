class_name  MicroBitResDataState
extends Resource

#region CONST
const MAX_LEDS_COUNT := 25
const MAX_COLUMN_COUNT := 5
const MAX_LINE_COUNT := 5
const MAX_LEDS_INDEX := 24
const MAX_COLUMN_INDEX := 4
const MAX_LINE_INDEX := 4
const MAX_PINS := 21

const PIN_RESERVED_BUTTON_AB := [5, 11]
const PIN_USED_BY_SCREEN:= [3,4, 6, 7, 9, 10] 

const PIN_FOR_BEGINNER:= [0,1,2] 
const PIN_FOR_BEGINNER_WITH_EXTENSION:= [8, 12, 13, 14, 15, 16] 
const PIN_USABLE_WHEN_SCREEN_ON	 := [0,1,2 ,8, 12, 13, 14, 15, 16] 
const PIN_USABLE_WHEN_SCREEN_OFF := [0,1,2 ,8, 3, 4, 6, 7, 9, 10, 12, 13, 14, 15, 16] 

const PIN_INDEX_0_TOUCH_PAD_0 := 0
const PIN_INDEX_1_TOUCH_PAD_1 := 1
const PIN_INDEX_2_TOUCH_PAD_2 := 2
const PIN_INDEX_3_ANALOG_COLUMN_3 := 3
const PIN_INDEX_4_ANALOG_COLUMN_1 := 4
const PIN_INDEX_5_DIGITAL_BUTTON_A := 5
const PIN_INDEX_6_DIGITAL_COLUMN_4 := 6
const PIN_INDEX_7_DIGITAL_COLUMN_2 := 7
const PIN_INDEX_8_DIGITAL:= 8
const PIN_INDEX_9_DIGITAL:= 9
const PIN_INDEX_10_ANALOG_COLUMN_5 := 10
const PIN_INDEX_11_DIGITAL_BUTTON_B := 11
const PIN_INDEX_12_DIGITAL_RESERVED_ACCESSIBILITY := 12
const PIN_INDEX_13_DIGITAL_SPI_SCK := 13
const PIN_INDEX_14_DIGITAL_SPI_MISO := 14
const PIN_INDEX_15_DIGITAL_SPI_MOSI := 15
const PIN_INDEX_16_DIGITAL := 16
const PIN_INDEX_17_NO_EXISTING := 17
const PIN_INDEX_18_NO_EXISTING := 18
const PIN_INDEX_19_DIGITAL_SCL := 19
const PIN_INDEX_20_DIGITAL_SDA := 20
const PINS_INDEX_I2C := [PIN_INDEX_19_DIGITAL_SCL, PIN_INDEX_20_DIGITAL_SDA]
const VOLTAGE_3V := 3.0
const GND_PIN := -1
const VCC_PIN := -3



# LEFT RIGHT USE OF THE COPPER ON THE MICRO BIT V2
# https://makecode.microbit.org/device/pins

const COPPER_LEFT_RIGHT_00:=3
const COPPER_LEFT_RIGHT_01:=0
const COPPER_LEFT_RIGHT_02:=4
const COPPER_LEFT_RIGHT_03:=5
const COPPER_LEFT_RIGHT_04:=6
const COPPER_LEFT_RIGHT_05:=7
const COPPER_LEFT_RIGHT_06:=1
const COPPER_LEFT_RIGHT_07:=8
const COPPER_LEFT_RIGHT_08:=9
const COPPER_LEFT_RIGHT_09:=10
const COPPER_LEFT_RIGHT_10:=11
const COPPER_LEFT_RIGHT_11:=12
const COPPER_LEFT_RIGHT_12:=2
const COPPER_LEFT_RIGHT_13:=13
const COPPER_LEFT_RIGHT_14:=14
const COPPER_LEFT_RIGHT_15:=15
const COPPER_LEFT_RIGHT_16:=16
const COPPER_LEFT_RIGHT_17:=VCC_PIN
const COPPER_LEFT_RIGHT_18:=VCC_PIN
const COPPER_LEFT_RIGHT_19:=VCC_PIN
const COPPER_LEFT_RIGHT_20:=19
const COPPER_LEFT_RIGHT_21:=20
const COPPER_LEFT_RIGHT_22:=GND_PIN
const COPPER_LEFT_RIGHT_23:=GND_PIN
const COPPER_LEFT_RIGHT_24:=GND_PIN






## ACCELEROMETER VALUE WHEN THE MICRO:BIT IS RESTING ON THE TABLE WITH THE FACE UP (0,0,1000)
const DICE_REST_TABLE_UP :=Vector3(0,0,1000)
## ACCELEROMETER VALUE WHEN THE MICRO:BIT IS RESTING ON THE TABLE WITH THE FACE DOWN (0,0,-1000)
const DICE_REST_TABLE_DOWN :=Vector3(0,0,-1000)
## ACCELEROMETER VALUE WHEN THE MICRO:BIT IS VERTICAL WITH THE USB TOWARD UP (0,1000,0)
const DICE_VERTICAL_UP :=Vector3(0,1000,0)
## ACCELEROMETER VALUE WHEN THE MICRO:BIT IS VERTICAL WITH THE USB TOWARD DOWN (0,-1000,0)
const DICE_VERTICAL_DOWN :=Vector3(0,-1000,0)
## ACCELEROMETER VALUE WHEN THE MICRO:BIT IS VERTICAL  THE USB TOWARD LEFT (-1000,0,0)
const DICE_WHEEL_LEFT_90 :=Vector3(-1000,0,0)
## ACCELEROMETER VALUE WHEN THE MICRO:BIT IS VERTICAL  THE USB TOWARD RIGHT (1000,0,0)
const DICE_WHEEL_RIGHT_90 :=Vector3(1000,0,0)
#endregion

#region VARIABLES
@export_group("Basic")
## IS THE BUTTON A PRESSING OR NOT
@export var _button_a:bool
## IS THE BUTTON B PRESSING OR NOT
@export var _button_b:bool
## IS THE BUTTON RESET PRESSING OR NOT (not usable in code in theory)
@export var _button_reset:bool
## PERCENT STAGE OF EACH 25 LEDS IN 5X5
@export var _leds_percent_5x5:Array[float]

@export_group("Pins")
## STATE OF THE PIN MODE DIGITAL==true OR ANALOG==false (DIGIT 10 ANALOG 0 1023)
@export var _pins_is_digital_mode:Array[bool] 
## IS THE PIN N READ OR WRITE MODE  IS IN WRITE==true,  READ==false OR MODE
@export var _pins_is_write_mode:Array[bool]
## WHAT IS THE VALUE ON THE PIN 1(1024)-0(0) FOR DIGITAL  1024-0 for ANALOG 
@export var _pins_value_state_0_1023:Array[bool]

## SEE PINS FOR MORE INFORMATION THE PIN BY DEFAULT ARE IN DIGITAL MODE AND IN READ MODE CAPACITIVE MODE
@export var _pin_as_button_0:bool
## SEE PINS FOR MORE INFORMATION THE PIN BY DEFAULT ARE IN DIGITAL MODE AND IN READ MODE CAPACITIVE MODE
@export var _pin_as_button_1:bool
## SEE PINS FOR MORE INFORMATION THE PIN BY DEFAULT ARE IN DIGITAL MODE AND IN READ MODE CAPACITIVE MODE
@export var _pin_as_button_2:bool

@export_group("Basic Additional")
## BYTE VALUE OF THE LIGHT SENSOR FROM 0 TO 255
@export var _light_0_255:int
## BYTE VALUE OF THE MICROPHONE VOLUME INTENSITY FROM 0 TO 255
@export var _microphone_0_255:int
## FLOAT VALUE OF THE COMPASS DIRECTION IN DEGREE FROM 0 TO 360 
## SEE MICROBIT DOCUMENTATION FOR MORE DETAILS ABOUT THE COMPASS VALUE
@export var _compass_0_360 :float
## FLOAT VALUE OF THE TEMPERATURE IN CELSIUS DEGREE -5 TO 50
@export var _temperature_50:float


## SEE PINS FOR MORE INFORMATION THE PIN BY DEFAULT ARE IN DIGITAL MODE AND IN READ MODE CAPACITIVE MODE
@export var _pin_as_button_logo:bool


## IS USER SHAKING THE MICRO:BIT BASED ON THE ACCELEROMETER
@export var _is_shaking:bool
## IS THE MICRO:BIT FALLING BASED ON THE ACCELEROMETER
@export var _is_falling:bool

## IS FORCE IN THE ACCELEROMETER OVER 3G
@export var _is_over_3g:bool

## IS FORCE IN THE ACCELEROMETER OVER 6G
@export var _is_over_6g:bool

## IS FORCE IN THE ACCELEROMETER OVER 8G
@export var _is_over_8g:bool

## IS THE SCREEN OF THE MICRO BIT DISABLED OR NOT.
## DISABLE THE SCREEN TO USE ALL THE PINS INSTEAD OF THE SCREEN PINS.
## IF USING SCREEN YOU CAN/WILL/SHOULD HAVE BUG IN YOU DEVICE
## (HARD TO SIMULATE IN THE EDITOR)
@export var _is_screen_disabled:bool


# ESTIMATION BY DEVELOPER TO HELP
## DEV ESTIMATION: IF MICRO:BIT IS FACING UP. WHAT IS THE TILT IN DEGREE FROM -170 TO 170 LEFT TO RIGHT
@export var _tilt_plane_x_left_right_180:float
## DEV ESTIMATION: IF MICRO:BIT IS FACING UP. WHAT IS THE TILT IN DEGREE FROM -170 TO 170 DOWN TO UP OF DEVICE
@export var _tilt_plane_y_back_to_front_180:float # inverse it 
## DEV ESTIMATION: IF MICRO:BIT IS USED AS A VERTICAL WHEEL. WHAT IS THE TILT IN DEGREE FROM -170 TO 170 LEFT TO RIGHT
@export var _tilt_wheel_left_right_180:float


## DEV ESTIMATION: WHAT IS THE FORCE IN MG IN THE ACCELEROMETER ON X AXIS 
## (HARD TO SIMULATE IN THE EDITOR, DEV ESTIMATION)
@export var _accelerometer_x_2000_mg:float
## DEV ESTIMATION: WHAT IS THE FORCE IN MG IN THE ACCELEROMETER ON Y AXIS 
## (HARD TO SIMULATE IN THE EDITOR, DEV ESTIMATION)
@export var _accelerometer_y_2000_mg:float
## DEV ESTIMATION: WHAT IS THE FORCE IN MG IN THE ACCELEROMETER ON Z AXIS 
## (HARD TO SIMULATE IN THE EDITOR, DEV ESTIMATION)
@export var _accelerometer_z_2000_mg:float
#endregion






#region ACCELEROMETER DERIVED STATE


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


func set_device_as_shaking(is_shaking:bool)->void:
	var has_changed :bool = _is_shaking != is_shaking
	_is_shaking = is_shaking

	on_device_shaking_updated.emit(is_shaking)
	if has_changed:
		on_device_shaking_changed.emit(is_shaking)

func is_device_shaking()->bool:
	return _is_shaking

func set_device_as_falling(is_falling:bool)->void:
	var has_changed :bool = _is_falling != is_falling
	_is_falling = is_falling	
	on_device_falling_updated.emit(is_falling)
	if has_changed:
		on_device_falling_changed.emit(is_falling)

func is_device_falling()->bool:
	return _is_falling

func set_device_as_over_3g(is_over_3g:bool)->void:

	if not is_over_3g:
		set_device_as_over_6g(false)
		set_device_as_over_8g(false)

	var has_changed :bool = _is_over_3g != is_over_3g
	_is_over_3g = is_over_3g
	on_device_over_3g_updated.emit(is_over_3g)
	if has_changed:
		on_device_over_3g_changed.emit(is_over_3g)

func is_device_over_3g()->bool:
	return _is_over_3g

func set_device_as_over_6g(is_over_6g:bool)->void:

	if not is_over_6g:
		set_device_as_over_8g(false)

	elif is_over_6g and not _is_over_3g:
		set_device_as_over_3g(true)
	

	var has_changed :bool = _is_over_6g != is_over_6g
	_is_over_6g = is_over_6g
	on_device_over_6g_updated.emit(is_over_6g)
	if has_changed:
		on_device_over_6g_changed.emit(is_over_6g)
	

func is_device_over_6g()->bool:
	return _is_over_6g	

func set_device_as_over_8g(is_over_8g:bool)->void:
	if is_over_8g and not _is_over_6g:
		set_device_as_over_6g(true)
	
	var has_changed :bool = _is_over_8g != is_over_8g
	_is_over_8g = is_over_8g
	on_device_over_8g_updated.emit(is_over_8g)
	if has_changed:
		on_device_over_8g_changed.emit(is_over_8g)

func is_device_over_8g()->bool:
	return _is_over_8g


#endregion

#region SET GET BUTTON A
signal on_button_a_updated(is_pressing)
signal on_button_a_changed(is_pressing)

func set_button_a(is_pressing:bool)->void:
	var has_changed :bool = _button_a != is_pressing
	_button_a = is_pressing
	print("A:",is_pressing)
	on_button_a_updated.emit(is_pressing)
	if has_changed:
		on_button_a_changed.emit(is_pressing)
func get_button_a()->bool:
	return _button_a
#endregion

#region SET GET BUTTON B
signal on_button_b_updated(is_pressing)
signal on_button_b_changed(is_pressing)

func set_button_b(is_pressing:bool)->void:
	var has_changed :bool = _button_b != is_pressing
	print("B:",is_pressing)
	_button_b = is_pressing
	on_button_b_updated.emit(is_pressing)
	if has_changed:
		on_button_b_changed.emit(is_pressing)
func get_button_b()->bool:
	return _button_b
#endregion

#region SET GET BUTTON Reset
signal on_button_reset_updated(is_pressing)
signal on_button_reset_changed(is_pressing)
func set_button_reset(is_pressing:bool)->void:
	var has_changed :bool = _button_reset != is_pressing
	_button_reset = is_pressing
	print("Reset:",is_pressing)
	on_button_reset_updated.emit(is_pressing)
	if has_changed:
		on_button_reset_changed.emit(is_pressing)
func get_button_reset()->bool:
	return _button_reset
#endregion

#region SET LEDS STATE

signal on_array_leds_updated(leds_state_percent_5x5:Array[float])

func set_leds_5x5_with_percent_by_copy(leds_state:Array[float])->void:
	if _leds_percent_5x5.size()!=25:
		_leds_percent_5x5.resize(25)
	for i in range(leds_state.size()):
		if i<25:
			_leds_percent_5x5[i] =leds_state[i]
	on_array_leds_updated.emit(_leds_percent_5x5)
	
func get_leds_5x5_as_percent()->Array[float]:
	return _leds_percent_5x5
	
func set_led_1d_with_percent_0_1(led_index_0_24:int,led_percent_0_1:float)->void:
	MicroBitToolArray5x5.set_led_1d_with_percent_0_1(_leds_percent_5x5 ,led_index_0_24 ,led_percent_0_1)

func set_led_1d_with_character(led_index_0_24:int, character:String):
	MicroBitToolArray5x5.set_led_1d_with_character_0_9(_leds_percent_5x5 ,led_index_0_24 ,character)

func set_led_2d_with_percent_0_1(x_left_right_0_4:int,y_top_down_0_4:int,led_percent_0_1:float)->void:
	MicroBitToolArray5x5.set_led_2d_with_percent_0_1(_leds_percent_5x5 ,x_left_right_0_4 ,y_top_down_0_4 ,led_percent_0_1)

func set_led_2d_with_character(x_left_right_0_4:int,y_top_down_0_4:int, character:String):
	MicroBitToolArray5x5.set_led_2d_with_character_0_9(_leds_percent_5x5 ,x_left_right_0_4 ,y_top_down_0_4 ,character)


func get_led_1d_percent_0_1(led_index_0_24:int)->float:
	return MicroBitToolArray5x5.get_led_1d_percent_0_1(_leds_percent_5x5 ,led_index_0_24)

func get_led_1d_character(led_index_0_24:int)->String:
	return MicroBitToolArray5x5.get_led_1d_character_0_9(_leds_percent_5x5 ,led_index_0_24)

func get_led_2d_percent_0_1(x_left_right_0_4:int,y_top_down_0_4:int)->float:
	return MicroBitToolArray5x5.get_led_2d_percent_0_1(_leds_percent_5x5 ,x_left_right_0_4 ,y_top_down_0_4)

func get_led_2d_character(x_left_right_0_4:int,y_top_down_0_4:int)->String:
	return MicroBitToolArray5x5.get_led_2d_character_0_9(_leds_percent_5x5 ,x_left_right_0_4 ,y_top_down_0_4)	


func get_leds_5x5_as_array_percent()->Array[float]:
	return _leds_percent_5x5

func get_leds_5x5_as_array_character()->Array[String]:
	return MicroBitToolArray5x5.get_grid_as_array_character_0_9(_leds_percent_5x5)

func get_leds_5x5_as_string()->String:
	return MicroBitToolArray5x5.get_grid_as_string_0_9(_leds_percent_5x5)

#endregion




	
#region SET  LIGHT SENSOR
signal on_light_0_255_updated(light_0_255:int)
signal on_light_0_255_changed(light_0_255:int)

func set_light_0_255(new_light_0_255:int)->void:
	var has_changed := _light_0_255 != new_light_0_255
	_light_0_255 = new_light_0_255
	if has_changed:
		on_light_0_255_changed.emit(new_light_0_255)
	on_light_0_255_updated.emit(new_light_0_255)

func get_light_0_255()->int:
	return _light_0_255
func get_light_as_percent_0_1()->float:
	return _light_0_255/255.0
#endregion

#region SET GET MICROPHONE
signal on_microphone_0_255_updated(microphone_0_255:int)
signal on_microphone_0_255_changed(microphone_0_255:int)
func set_microphone_0_255(microphone_0_255:int)->void:
	var has_changed := _microphone_0_255 != microphone_0_255
	_microphone_0_255 = microphone_0_255
	if has_changed:
		on_microphone_0_255_changed.emit(microphone_0_255)
	on_microphone_0_255_updated.emit(microphone_0_255)
func get_microphone_0_255()->int:
	return _microphone_0_255
func get_microphone_as_percent_0_1()->float:
	return _microphone_0_255/255.0
#endregion

#region SET GET COMPASS
signal on_compass_0_360_updated(compass_0_360:float)
func set_compass_0_360(compass_0_360:float)->void:
	_compass_0_360 = compass_0_360
	on_compass_0_360_updated.emit(compass_0_360)
func get_compass_0_360()->float:
	return _compass_0_360
#endregion

#region SET GET TEMPERATURE
signal on_temperature_50_updated(temperature_50:float)
func set_temperature_50(temperature_50:float)->void:
	if temperature_50<-5:
		temperature_50=-5
	elif temperature_50>50:
		temperature_50=50

	_temperature_50 = temperature_50
	on_temperature_50_updated.emit(temperature_50)
func get_temperature_50()->float:
	return _temperature_50
#endregion


#region SET GET SCREEN DISABLED
signal on_is_screen_disabled_updated(is_screen_disabled:bool)
func set_is_screen_disabled(is_screen_disabled:bool)->void:
	_is_screen_disabled = is_screen_disabled
	on_is_screen_disabled_updated.emit(is_screen_disabled)
func get_is_screen_disabled()->bool:
	return _is_screen_disabled

func get_is_screen_enabled()->bool:
	return not _is_screen_disabled

#endregion


#region SET GET ACCELEROMETER

signal on_accelerometer_updated(accelerometer_x_2000_mg:float,accelerometer_y_2000_mg:float,accelerometer_z_2000_mg:float)
signal on_accelerometer_x_2000_mg_updated(accelerometer_x_2000_mg:float)
signal on_accelerometer_y_2000_mg_updated(accelerometer_y_2000_mg:float)
signal on_accelerometer_z_2000_mg_updated(accelerometer_z_2000_mg:float)

func _notify_accelerometer_updated()->void:
	on_accelerometer_updated.emit(_accelerometer_x_2000_mg,_accelerometer_y_2000_mg,_accelerometer_z_2000_mg)
	on_accelerometer_x_2000_mg_updated.emit(_accelerometer_x_2000_mg)
	on_accelerometer_y_2000_mg_updated.emit(_accelerometer_y_2000_mg)
	on_accelerometer_z_2000_mg_updated.emit(_accelerometer_z_2000_mg)

func _clamp_value_2000_mg(value:float)->float:
	if value<-2000:
		return -2000
	elif value>2000:
		return 2000
	else:
		return value
func set_accelerometer_with_vector3_2000_mg(accelerometer_2000_mg:Vector3)->void:
	_accelerometer_x_2000_mg = _clamp_value_2000_mg(accelerometer_2000_mg.x)
	_accelerometer_y_2000_mg = _clamp_value_2000_mg(accelerometer_2000_mg.y)
	_accelerometer_z_2000_mg = _clamp_value_2000_mg(accelerometer_2000_mg.z)
	_notify_accelerometer_updated()

func set_accelerometer_x_2000_mg(accelerometer_x_2000_mg:float)->void:
	_accelerometer_x_2000_mg = _clamp_value_2000_mg(accelerometer_x_2000_mg)
	_notify_accelerometer_updated()

func set_accelerometer_y_2000_mg(accelerometer_y_2000_mg:float)->void:
	_accelerometer_y_2000_mg = _clamp_value_2000_mg(accelerometer_y_2000_mg)
	_notify_accelerometer_updated()

func set_accelerometer_z_2000_mg(accelerometer_z_2000_mg:float)->void:
	_accelerometer_z_2000_mg = _clamp_value_2000_mg(accelerometer_z_2000_mg)
	_notify_accelerometer_updated()

func get_accelerometer_x_2000_mg()->float:
	return _accelerometer_x_2000_mg

func get_accelerometer_y_2000_mg()->float:
	return _accelerometer_y_2000_mg

func get_accelerometer_z_2000_mg()->float:
	return _accelerometer_z_2000_mg

func get_accelerometer_as_vector3_2000_mg()->Vector3:
	return Vector3(_accelerometer_x_2000_mg,_accelerometer_y_2000_mg,_accelerometer_z_2000_mg)
#endregion


#region SET TILT 
signal on_tilt_plane_x_left_right_180_updated(tilt_plane_x_left_right_180:float)
signal on_tilt_plane_y_back_to_front_180_updated(tilt_plane_y_back_to_front_180:float)
signal on_tilt_wheel_left_right_180_updated(tilt_wheel_left_right_180:float)

func set_tilt_plane_x_left_right_180(tilt_plane_x_left_right_180:float)->void:
	_tilt_plane_x_left_right_180 = tilt_plane_x_left_right_180
	on_tilt_plane_x_left_right_180_updated.emit(tilt_plane_x_left_right_180)
func set_tilt_plane_y_back_to_front_180(tilt_plane_y_back_to_front_180:float)->void:
	_tilt_plane_y_back_to_front_180 = tilt_plane_y_back_to_front_180
	on_tilt_plane_y_back_to_front_180_updated.emit(tilt_plane_y_back_to_front_180)
func set_tilt_wheel_left_right_180(tilt_wheel_left_right_180:float)->void:
	_tilt_wheel_left_right_180 = tilt_wheel_left_right_180
	on_tilt_wheel_left_right_180_updated.emit(tilt_wheel_left_right_180)

func get_tilt_plane_x_left_right_180()->float:
	return _tilt_plane_x_left_right_180	

func get_tilt_plane_y_back_to_front_180()->float:
	return _tilt_plane_y_back_to_front_180

func get_tilt_wheel_left_right_180()->float:
	return _tilt_wheel_left_right_180

#endregion


#region SET GET PINS



signal on_pin_0_on_off_updated(is_on:bool)
signal on_pin_1_on_off_updated(is_on:bool)
signal on_pin_2_on_off_updated(is_on:bool)

signal on_pin_on_off_updated(pin_index:int,is_on:bool)
signal on_pin_value_updated(pin_index:int,value_0_1023:int)
signal on_pin_digital_mode_updated(pin_index:int,is_digital_mode:bool)
signal on_pin_write_mode_updated(pin_index:int,is_write_mode:bool)
signal on_pin_capacitive_mode_updated(pin_index:int,is_capacitive_mode:bool)
signal on_pins_updated()

func _check_pins_arrays_size()->void:
	if _pins_is_digital_mode.size()!=MAX_PINS:
		_pins_is_digital_mode.resize(MAX_PINS)
		for i in range(MAX_PINS):
			_pins_is_digital_mode[i]=true
	if _pins_is_write_mode.size()!=MAX_PINS:
		_pins_is_write_mode.resize(MAX_PINS)
		for i in range(MAX_PINS):
			_pins_is_write_mode[i]=false
	if _pins_value_state_0_1023.size()!=MAX_PINS:
		_pins_value_state_0_1023.resize(MAX_PINS)
		for i in range(MAX_PINS):
			_pins_value_state_0_1023[i]=0
	notify_pins_updated()

func notify_pins_updated()->void:
	on_pins_updated.emit()


@export var pin_threshold_0_1023_for_on_off:int = 512
func set_pin_analog_value_0_1023(pin_index:int,value_0_1023:int)->void:
	_check_pins_arrays_size()
	if pin_index>=0 and pin_index<MAX_PINS:
		_pins_value_state_0_1023[pin_index]=value_0_1023
		on_pin_value_updated.emit(pin_index,value_0_1023)
		if pin_index==0:
			on_pin_0_on_off_updated.emit(value_0_1023>pin_threshold_0_1023_for_on_off)
		elif pin_index==1:
			on_pin_1_on_off_updated.emit(value_0_1023>pin_threshold_0_1023_for_on_off)
		elif pin_index==2:
			on_pin_2_on_off_updated.emit(value_0_1023>pin_threshold_0_1023_for_on_off)
		
		on_pin_on_off_updated.emit(pin_index,value_0_1023>pin_threshold_0_1023_for_on_off)
		notify_pins_updated()

func set_pin_as_write_mode(pin_index:int,is_write_mode:bool)->void:
	_check_pins_arrays_size()
	if pin_index>=0 and pin_index<MAX_PINS:
		_pins_is_write_mode[pin_index]=is_write_mode
		on_pin_write_mode_updated.emit(pin_index,is_write_mode)
		notify_pins_updated()

func set_pin_as_digital_mode(pin_index:int,is_digital_mode:bool)->void:
	_check_pins_arrays_size()
	if pin_index>=0 and pin_index<MAX_PINS:
		_pins_is_digital_mode[pin_index]=is_digital_mode
		on_pin_digital_mode_updated.emit(pin_index,is_digital_mode)
		notify_pins_updated()






func set_pin_digital_value_0_1(pin_index:int,value_0_1:bool)->void:
	set_pin_analog_value_0_1023(pin_index, 1023 if value_0_1 else 0)

func set_pin_as_read_mode(pin_index:int,is_read_mode:bool)->void:
	set_pin_as_write_mode(pin_index, not is_read_mode)

func set_pin_as_analog_mode(pin_index:int,is_analog_mode:bool)->void:
	set_pin_as_digital_mode(pin_index, not is_analog_mode)

func set_pin_as_capacitive_mode(pin_index:int,is_capacitive_mode:bool)->void:
	if pin_index>=0 and pin_index<MAX_PINS:
		match pin_index:
			0:
				_pin_as_button_0 = is_capacitive_mode

			1:
				_pin_as_button_1 = is_capacitive_mode
			2:
				_pin_as_button_2 = is_capacitive_mode

		on_pin_capacitive_mode_updated.emit(pin_index, is_capacitive_mode)
		notify_pins_updated()

func set_pin_as_resistive_mode(pin_index:int,is_resistive_mode:bool)->void:
	set_pin_as_capacitive_mode(pin_index, not is_resistive_mode)


func is_pin_as_resistive_mode(pin_index:int)->bool:
	if pin_index>=0 and pin_index<MAX_PINS:
		match pin_index:
			0:
				return not _pin_as_button_0
			1:
				return not _pin_as_button_1
			2:
				return not _pin_as_button_2
	return false

func is_pin_as_capacitive_mode(pin_index:int)->bool:
	if pin_index>=0 and pin_index<MAX_PINS:
		match pin_index:
			0:
				return _pin_as_button_0
			1:
				return _pin_as_button_1
			2:
				return _pin_as_button_2
	return false			

#endregion





#region SET PIN LOGO

signal on_button_logo_updated(is_pin_as_button_logo:bool)
signal on_button_logo_changed(is_pin_as_button_logo:bool)
func set_button_logo(is_pin_as_button_logo:bool)->void:
	var has_changed :bool = _pin_as_button_logo != is_pin_as_button_logo
	_pin_as_button_logo = is_pin_as_button_logo
	if has_changed:
		on_button_logo_changed.emit(is_pin_as_button_logo)
	on_button_logo_updated.emit(is_pin_as_button_logo)

func get_button_logo()->bool:
	return _pin_as_button_logo

#endregion





# @export_group("Pins")
# ## STATE OF THE PIN MODE DIGITAL==true OR ANALOG==false (DIGIT 10 ANALOG 0 1023)
# ## IS THE PIN N READ OR WRITE MODE  IS IN WRITE==true,  READ==false OR MODE
# ## WHAT IS THE VALUE ON THE PIN 1(1024)-0(0) FOR DIGITAL  1024-0 for ANALOG 

# @export var _pins_is_digital_mode:Array[bool] 
# @export var _pins_is_write_mode:Array[bool]
# @export var _pins_value_state_0_1023:Array[bool]


# ## SEE PINS FOR MORE INFORMATION THE PIN BY DEFAULT ARE IN DIGITAL MODE AND IN READ MODE CAPACITIVE MODE
# @export var _pin_as_button_0:bool
# ## SEE PINS FOR MORE INFORMATION THE PIN BY DEFAULT ARE IN DIGITAL MODE AND IN READ MODE CAPACITIVE MODE
# @export var _pin_as_button_1:bool
# ## SEE PINS FOR MORE INFORMATION THE PIN BY DEFAULT ARE IN DIGITAL MODE AND IN READ MODE CAPACITIVE MODE
# @export var _pin_as_button_2:bool
# ## SEE PINS FOR MORE INFORMATION THE PIN BY DEFAULT ARE IN DIGITAL MODE AND IN READ MODE CAPACITIVE MODE
# @export var _pin_as_button_logo:bool






# ## IS USER SHAKING THE MICRO:BIT BASED ON THE ACCELEROMETER
# @export var _is_shaking:bool
# ## IS THE MICRO:BIT FALLING BASED ON THE ACCELEROMETER
# @export var _is_falling:bool

# ## IS FORCE IN THE ACCELEROMETER OVER 3G
# @export var _is_over_3g:bool

# ## IS FORCE IN THE ACCELEROMETER OVER 6G
# @export var _is_over_6g:bool

# ## IS FORCE IN THE ACCELEROMETER OVER 8G
# @export var _is_over_8g:bool
