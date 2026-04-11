## NEED TO BE TESTING 
extends Node

func _ready() -> void:
	print("Hello Micro:Bit")


func mod_in_set_button_a(value:bool):
	print("Button A:",value)
	#print(",".join(leds_percent_5x5))
	mod_out_on_request_image_command.emit("9999 90009  90009 90009 99999")
	
	
func mod_in_set_button_b(value:bool):
	print("Button B:",value)
	mod_out_on_request_image_command.emit("01234567890123456789012345678900")
	
func mod_in_set_button_reset(value:bool):
	print("Button Reset:",value)
	mod_out_on_request_image_command.emit("0000000000000000000000000")
	
##################################################

## REQUEST AN ACTION PROVIDED BY THE DEVELOPER
signal mod_out_on_request_text_command(text_action:String)
## REQUEST AN ACTION PROVIDED BY THE DEVELOPER WITH AN INTEGER TO REGISTER IT
signal mod_out_on_request_int_command(int_action:String)
## REQUEST TO SET THE SCREEEN LEDS TO THIS TEXT IMAGE (See MICROBIT DOCUMENTATION FOR THE FORMAT)
signal mod_out_on_request_image_command(text_image_action:String)
## REQUEST TO PLAY A SOUND BY NAME IF PROVIDED BY THE DEVELOPER
signal mod_out_on_request_sound_by_name_command(sound_name_action:String)

## REQUEST TO SET THE SCREEEN LEDS TO THIS PERCENTAGE (0.0 to 1.0) IN 1D (index from 0 to 24)
signal mod_out_set_led_1d_percent_0_1(index_0_24:int,percent:float)
## REQUEST TO SET THE SCREEEN LEDS TO THIS CHARACTER (0 to 9) IN 1D (index from 0 to 24)
signal mod_out_set_led_1d_char_0_9(index_0_24:int,character:String)
## REQUEST TO SET THE SCREEEN LEDS TO THIS PERCENTAGE (0.0 to 1.0) IN 2D (x from 0 to 4, y from 0 to 4)
signal mod_out_set_led_2d_percent_0_1(x_left_right_0_4:int, y_top_down_0_4:int, percent:float)
## REQUEST TO SET THE SCREEEN LEDS TO THIS CHARACTER (0 to 9) IN 2D (x from 0 to 4, y from 0 to 4)
signal mod_out_set_led_2d_char_0_9(x_left_right_0_4:int, y_top_down_0_4:int, character:String)

## ASK TO SET THE PIN IN CPACTIVE MODE 0 1 2 for the pin -1 for LOGO
signal mod_out_set_touch_mode_as_capacitive(index_0_2:int)

## ASK TO SET THE PIN IN RESITIVE MODE 0 1 2 for the pin -1 for LOGO
signal mod_out_set_touch_mode_as_resitive(index_0_2:int)

## IS THE BUTTON A PRESSING OR NOT
@export var button_a:bool
## IS THE BUTTON B PRESSING OR NOT
@export var button_b:bool
## PERCENT STAGE OF EACH 25 LEDS IN 5X5
@export var leds_percent_5x5:Array[float]

## BYTE VALUE OF THE LIGHT SENSOR FROM 0 TO 255
@export var light_0_255:int
## BYTE VALUE OF THE MICROPHONE VOLUME INTENSITY FROM 0 TO 255
@export var microphone_0_255:int
## FLOAT VALUE OF THE COMPASS DIRECTION IN DEGREE FROM 0 TO 360 
## SEE MICROBIT DOCUMENTATION FOR MORE DETAILS ABOUT THE COMPASS VALUE
@export var compass_0_360 :float
## FLOAT VALUE OF THE TEMPERATURE IN CELSIUS DEGREE -5 TO 50
@export var temperature_50:float

## SEE PINS FOR MORE INFORMATION THE PIN BY DEFAULT ARE IN DIGITAL MODE AND IN READ MODE CAPACITIVE MODE
@export var pin_as_button_0:bool
## SEE PINS FOR MORE INFORMATION THE PIN BY DEFAULT ARE IN DIGITAL MODE AND IN READ MODE CAPACITIVE MODE
@export var pin_as_button_1:bool
## SEE PINS FOR MORE INFORMATION THE PIN BY DEFAULT ARE IN DIGITAL MODE AND IN READ MODE CAPACITIVE MODE
@export var pin_as_button_2:bool
## SEE PINS FOR MORE INFORMATION THE PIN BY DEFAULT ARE IN DIGITAL MODE AND IN READ MODE CAPACITIVE MODE
@export var pin_as_button_logo:bool

## IS USER SHAKING THE MICRO:BIT BASED ON THE ACCELEROMETER
@export var is_shaking:bool
## IS THE MICRO:BIT FALLING BASED ON THE ACCELEROMETER
@export var is_falling:bool

## IS FORCE IN THE ACCELEROMETER OVER 3G
@export var is_over_3g:bool

## IS FORCE IN THE ACCELEROMETER OVER 6G
@export var is_over_6g:bool

## IS FORCE IN THE ACCELEROMETER OVER 8G
@export var is_over_8g:bool

## STATE OF THE PIN MODE DIGITAL==true OR ANALOG==false (DIGIT 10 ANALOG 0 1023)
@export var pins_is_digital_mode:Array[bool] 


## IS THE PIN N READ OR WRITE MODE  IS IN WRITE==true,  READ==false OR MODE
@export var pins_is_write_mode:Array[bool]

## WHAT IS THE VALUE ON THE PIN 1(1024)-0(0) FOR DIGITAL  1024-0 for ANALOG 
@export var pins_value_state_0_1023:Array[bool]
## IS THE SCREEN OF THE MICRO BIT DISABLED OR NOT.
## DISABLE THE SCREEN TO USE ALL THE PINS INSTEAD OF THE SCREEN PINS.
## IF USING SCREEN YOU CAN/WILL/SHOULD HAVE BUG IN YOU DEVICE
## (HARD TO SIMULATE IN THE EDITOR)
@export var is_screen_disabled:bool


# ESTIMATION BY DEVELOPER TO HELP
## DEV ESTIMATION: IF MICRO:BIT IS FACING UP. WHAT IS THE TILT IN DEGREE FROM -170 TO 170 LEFT TO RIGHT
@export var tilt_plane_x_left_right_180:float
## DEV ESTIMATION: IF MICRO:BIT IS FACING UP. WHAT IS THE TILT IN DEGREE FROM -170 TO 170 DOWN TO UP OF DEVICE
@export var tilt_plane_y_back_to_front_180:float # inverse it 

## DEV ESTIMATION: IF MICRO:BIT IS USED AS A VERTICAL WHEEL. WHAT IS THE TILT IN DEGREE FROM -170 TO 170 LEFT TO RIGHT
@export var tilt_wheel_left_right_180:float


## DEV ESTIMATION: WHAT IS THE FORCE IN MG IN THE ACCELEROMETER ON X AXIS 
## (HARD TO SIMULATE IN THE EDITOR, DEV ESTIMATION)
@export var accelerometer_x_2000_mg:float
## DEV ESTIMATION: WHAT IS THE FORCE IN MG IN THE ACCELEROMETER ON Y AXIS 
## (HARD TO SIMULATE IN THE EDITOR, DEV ESTIMATION)
@export var accelerometer_y_2000_mg:float
## DEV ESTIMATION: WHAT IS THE FORCE IN MG IN THE ACCELEROMETER ON Z AXIS 
## (HARD TO SIMULATE IN THE EDITOR, DEV ESTIMATION)
@export var accelerometer_z_2000_mg:float


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

const MAX_LEDS := 25
const MAX_PINS := 20

const PIN_RESERVED_LED_SCREEN := [3, 4, 6, 7, 9, 10]
const PIN_RESERVED_BUTTON := [5, 11]
