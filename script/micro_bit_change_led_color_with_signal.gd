
# Why signal is better here.
# It allows to change later on the project and reuse the script
# look

class_name MicroBitChangeLedColorWithSignal
extends Node3D

## Signal to every body that the script ask to change of color.
signal on_color_led_changed(new_color:Color)

@export_range(0.0,1.0,0.001)
var last_received_state_as_percent_0_1 :float =0.0

@export var emit_state_at_start :bool =true

func _ready():
	if emit_state_at_start:
		set_color_red_with_percent(last_received_state_as_percent_0_1)

func get_led_state_as_percent_0_to_1()->float:
	return last_received_state_as_percent_0_1
func get_led_state_as_0_to_9_int()->int:
	return int(get_led_state_as_percent_0_to_1()*9.0)
func get_led_state_as_0_to_9_char()->String:
	return str(get_led_state_as_0_to_9_int())
	
func turn_on():
	set_color_red_with_percent(1)
	
func turn_off():
	set_color_red_with_percent(0)	
	
func turn_on_off(value:bool):
	if value:
		turn_on()
	else :
		turn_off()
	
func set_random_color():
	var random_color = Color(0,0,0,1) # That is a local variable
	random_color.r = randf()
	random_color.g = randf()
	random_color.b = randf()
	random_color.a = randf()
	set_cube_color(random_color)
	
func set_cube_color(color:Color):
	#to_affect.get_active_material(0).albedo_color = color
	
	# Notify to every listener that the color need to be changed.
	# We dont care how, we juste share the request to change color
	last_received_state_as_percent_0_1 = color.r
	on_color_led_changed.emit(color)
	
func set_color_red_with_percent(percent:float):
	var red_color:Color = Color(percent,0,0,1) 
	set_cube_color(red_color)
	
func set_color_red_with_0_to_9_float(value_0_9:float):
	var percent  = value_0_9/ 9.0
	set_color_red_with_percent(percent)
 

func set_color_red_with_0_to_9_int(value_0_9:int):
	# 0 1 2 3 4 5 6 7 8 9  Int
	# 3.14  float  10.4564 1.63 float 
	#  2.0 / 9.0
	var percent :float= float(value_0_9) / 9.0
	set_color_red_with_percent(percent)

func set_color_red_with_0_to_9_char(text_with_a_0_9:String):
	# For each of the char in the text you give me
	# I check if you give me a 0 or a 9
	# continue = I skill this loop in the for
	for character in text_with_a_0_9:
		var int_value :int=-1
		match character:
			'0':
				int_value=0
			'1':
				int_value=1
			'2':
				int_value=2
			'3':
				int_value=3
			'4':
				int_value=4
			'5':
				int_value=5
			'6':
				int_value=6
			'7':
				int_value=7
			'8':
				int_value=8
			'9':
				int_value=9
			_:
				int_value=-1
		
		if int_value == -1:
			continue 
			
		
		set_color_red_with_0_to_9_int(int_value)
		# if I found one valide
		# I leave the methode
		return 
		

	
		
	
	
