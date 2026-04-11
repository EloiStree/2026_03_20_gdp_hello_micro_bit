class_name MicroBitMatrixLeds5x5
extends Node3D

#region DOC ARRAY STRUCTURE
# 1D Array in a 2D view
###################
## LEFT->RIGHT TOP->DOWN
## X0 X1 X2 X3 X4 
##  0  1  2  3  4 Y0
##  5  6  7  8  9 Y1   
## 10 11 12 13 14 Y2
## 15 16 17 18 19 Y3
## 20 21 22 23 24 Y4
#endregion

#region CONSTANT
# constant
const MAX_LED_COUNT :int = 25
const MAX_LINE_COUNT :int = 5
const MAX_COLUMN_COUNT :int = 5
# Array start from 0 and not 1
const MAX_LED_INDEX :int = 24
const MAX_LINE_INDEX :int = 4
const MAX_COLUMN_INDEX :int = 4

const IMAGE_EMPTY :="""
		00000
		00000
		00000
		00000
		00000
		"""
const IMAGE_FULL :="""
		99999
		99999
		99999
		99999
		99999
		"""
const IMAGE_BORDER:="""
		99999
		90000
		90009
		00009
		99999
		"""
#endregion

#region EXPORT VARIABLE
## Represent 25 scripts that can be change to red intensity with 0-9 percent
@export var array_of_leds:Array[MicroBitChangeLedColorWithSignal]

## Must be over 0. Under it remove the feature.
@export var second_between_debug_refresh:float =1

@export_group("Debug")
@export_multiline var for_the_demo_image:String
@export var for_the_demo_percent:Array[float]
@export var for_the_demo_int:Array[int]
#endregion


func _ready() -> void:
	if second_between_debug_refresh > 0.0:
		var timer = Timer.new()
		timer.wait_time = second_between_debug_refresh
		timer.autostart = true
		timer.timeout.connect(refresh_debug_array_state)
		add_child(timer)
	#testing_around()

# We will remove it later. At least comment it.
func testing_around():

	display_clear()
	while true:
		#print("Hello")
		#await  get_tree().create_timer(0.5).timeout
		#display_turn_all_leds_on()
		#await  get_tree().create_timer(0.5).timeout
		#display_turn_all_leds_off()
		#await  get_tree().create_timer(0.5).timeout
		#var array_float:Array[float] = [0.1,0.2,0.3,0.4,0.5,1,1,1,1,1]
		#display_set_all_leds_with_array_of_float(array_float)
		#await  get_tree().create_timer(0.5).timeout
		#var array_int:Array[int] = [1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9]
		#display_set_all_leds_with_array_of_0_9_int(array_int)
		#await  get_tree().create_timer(0.5).timeout
		#var array_text:Array[String] = ["1","2","3","4","5","6","7","8","9"]
		#display_set_all_leds_with_array_of_0_9_string(array_text)
		#
		#await  get_tree().create_timer(1).timeout
		#var array_text_split:Array[String] =[]
		#array_text_split.assign('0030003630369630363000300'.split("",false))
		#display_set_all_leds_with_array_of_0_9_string(array_text_split)
		#await  get_tree().create_timer(1).timeout
		#display_set_all_leds_with_text_image("""
		#99999
		#90000
		#90009
		#00009
		#99999
		#""")
		#await  get_tree().create_timer(1).timeout
		#
		#display_clear()
		#for y in range(3):
			#for i in range(MAX_LED_COUNT):
				#display_set_1d_led_to_percent(i,1)
				#await  get_tree().create_timer(0.05).timeout
				#display_set_1d_led_to_percent(i,0)
				#await  get_tree().create_timer(0.05).timeout
		#
		#display_set_all_leds_as_random()
		#for y in range(10):
			#await  get_tree().create_timer(0.1).timeout
			#display_inverse_all_leds_state_leds(0.5)
		display_clear()
		await  get_tree().create_timer(0.1).timeout
		display_set_on_off_led_1d(0,true)
		await  get_tree().create_timer(0.1).timeout
		display_set_on_off_led_2d(2,2,true)
		await  get_tree().create_timer(0.1).timeout
		display_set_on_off_led_2d(4,4,true)
		await  get_tree().create_timer(0.1).timeout
		display_set_2d_led_to_0_9_char(1,1,"5")
		await  get_tree().create_timer(0.1).timeout
		display_set_2d_led_to_0_9_int(1,2,7)
		await  get_tree().create_timer(0.1).timeout
		display_set_2d_led_to_percent(3,3,0.65)
		await  get_tree().create_timer(0.1).timeout
		await  get_tree().create_timer(0.1).timeout
		


## Same as display_turn_all_leds_off()
func display_clear():
	display_turn_all_leds_off()
	
func display_turn_all_leds_on():
	display_set_all_leds_to_percent(1)
		
		
func display_turn_all_leds_off():
	display_set_all_leds_to_percent(0)

# for the fun
# display.set_all_leds_to_random_state

# await() vs sleep()

# display. is_valide_index_1d(index_0_24:int)->bool
# example 0.2 0.5 0.6 0.8 .... 1.0 1.0 1.0 1.0 1.0
# 0 0 0 0 9  0 0 0 0 9  0 0 0 0 9  0 0 0 0 9  0 0 0 0 9  Line on the right
# "00009 00009 00009 00009 00009"  Line on the right
# "0000900009000090000900009"  Line on the right
# """ Multiline comment and text in Godot
# 00009
# 00009
# 00009
# 00009
# 00009
# """"  Line on the right
# display.remove_space_of_text(text:String)->String
# display.keep_only_0_to_9_digit(text:String)->String



func display_set_all_leds_with_array_of_percent_0_1(given_array:Array[float]):
	display_clear()
	var index:int =0
	for float_in_array in given_array:
		if index> MAX_LED_INDEX: 
			return 
		array_of_leds[index].set_color_red_with_percent(float_in_array)
		index = index + 1
	
func display_set_all_leds_with_array_of_0_9_int(given_array:Array[int]):
	display_clear()
	var index:int =0
	for int_in_array in given_array:
		if index> MAX_LED_INDEX: 
			return 
		array_of_leds[index].set_color_red_with_0_to_9_int(int_in_array)
		index = index + 1
func display_set_all_leds_with_array_of_0_9_string(given_array:Array[String]):
	display_clear() 
	var index:int =0
	for string_in_array in given_array:
		if index> MAX_LED_INDEX: 
			return 
		array_of_leds[index].set_color_red_with_0_to_9_char(string_in_array)
		index = index + 1
		
func remove_all_space_of_text(text:String)-> String:
	return text.replace(" ","").replace("\t","").replace("\r","").replace("\n","").replace(":","")
		
func remove_any_that_is_not_0_to_9(text:String):
	text = remove_all_space_of_text(text)
	var list:Array[String] =[]
	for c in text:
		if c == "0" or c == "1" \
			or c == "2" or  c == "3" \
			or c == "4" or  c == "5" \
			or c == "6" or  c == "7" \
			or c == "8" or  c == "9" :
				list.append(c)
	return "".join(list)
			 
	
		
func display_set_all_leds_with_text_image(text:String):
	text = remove_any_that_is_not_0_to_9(text)
	var size_of_the_text = text.length()
	for index in range(MAX_LED_COUNT):
		if index>=size_of_the_text: 
			array_of_leds[index].turn_off()
		else:
			array_of_leds[index].set_color_red_with_0_to_9_char(text[index])
		


func display_set_all_leds_to_percent(percent:float):
	for index in range(MAX_LED_COUNT):
		array_of_leds[index].set_color_red_with_percent(percent)
		
func display_set_all_leds_to_0_9_int(value_0_9:int):
	for index in range(MAX_LED_COUNT):
		array_of_leds[index].set_color_red_with_0_to_9_int(value_0_9)
		
func display_set_all_leds_to_0_9_char(value_0_9:String):
	for index in range(MAX_LED_COUNT):
		array_of_leds[index].set_color_red_with_0_to_9_char(value_0_9)

func is_valide_1d_index(index_0_24:int)->bool:
	return index_0_24 >= 0 and index_0_24 <= 24
	

func display_set_1d_led_to_percent(index:int,percent:float) :
	if is_valide_1d_index(index):
		array_of_leds[index].set_color_red_with_percent(percent)
		
func display_set_1d_led_to_0_9_int(index:int,value_0_9:int) :
	if is_valide_1d_index(index):
		array_of_leds[index].set_color_red_with_0_to_9_int(value_0_9)
		
func display_set_1d_led_to_0_9_char(index:int,value_0_9:String) :
	if is_valide_1d_index(index):
		array_of_leds[index].set_color_red_with_0_to_9_char(value_0_9)



		
func display_set_all_leds_as_random():
	for i in range(MAX_LED_COUNT):
		array_of_leds[i].set_color_red_with_percent(randf())
		
func display_inverse_all_leds_state_leds(threshold:float=0.5):
	for i in range(MAX_LED_COUNT):
		display_inverse_on_off_state_led_1d(i,threshold)
		
func display_inverse_on_off_state_led_1d(index_0_24:int,threshold:float=0.5):
	var state:float = array_of_leds[index_0_24].get_led_state_as_percent_0_to_1()
	if state>threshold:
		array_of_leds[index_0_24].turn_off()
	else:
		array_of_leds[index_0_24].turn_on()
	

func display_get_array_1d_state_as_percent()-> Array[float]:
	var result_list:Array[float] = []
	for i in range(MAX_LED_COUNT):
		result_list.append(array_of_leds[i].get_led_state_as_percent_0_to_1())
	return result_list
		
func display_get_array_1d_state_as_int_0_9()-> Array[int]:
	var result_list:Array[int] = []
	for i in range(MAX_LED_COUNT):
		result_list.append(array_of_leds[i].get_led_state_as_0_to_9_int())
	return result_list
	
func display_get_array_1d_state_as_string_of_0_9(with_return_line:bool =true)-> String:
	var result_list:Array[String] = []
	for i in range(MAX_LED_COUNT):
		result_list.append(array_of_leds[i].get_led_state_as_0_to_9_char())
		if with_return_line and i%5==4:
			result_list.append('\n')
	return "".join(result_list)


signal on_debug_refresh_array_as_image_0_9(text:String)
signal on_debug_refresh_array_as_percent_array(array_5x5:Array[float])

func refresh_debug_array_state():
	for_the_demo_image = display_get_array_1d_state_as_string_of_0_9()
	for_the_demo_percent =  display_get_array_1d_state_as_percent()
	for_the_demo_int = display_get_array_1d_state_as_int_0_9()
	on_debug_refresh_array_as_image_0_9.emit(for_the_demo_image)
	on_debug_refresh_array_as_percent_array.emit(for_the_demo_percent)
	pass



func display_get_1d_led_as_percent(index_0_24:int)->float:
	if is_valide_1d_index(index_0_24):
		return array_of_leds[index_0_24].get_led_state_as_percent_0_to_1()
	else :
		return 0.0
func display_get_1d_led_as_0_9_int(index_0_24:int)->int:
	if is_valide_1d_index(index_0_24):
		return array_of_leds[index_0_24].get_led_state_as_0_to_9_int()
	else :
		return 0
func display_get_1d_led_as_0_9_char(index_0_24:int)->String:
	if is_valide_1d_index(index_0_24):
		return array_of_leds[index_0_24].get_led_state_as_0_to_9_char()
	else :
		return "0"

func is_valide_index_2d(x_left_right_0_4:int,y_top_down_0_4:int)->bool:
	return x_left_right_0_4>=0 and y_top_down_0_4>=0 and \
	 x_left_right_0_4<=4 and y_top_down_0_4<=4

## TODO: NOT TESTED YET BUT SHOULD WORK 
func convert_1d_to_2d_left_right_top_down_xy(index_0_24:int)-> Vector2i:
	var line_0_4:int = int(index_0_24/5.0)  # 19/5  int(3.8) 3 
	var column_0_4:int = index_0_24 % 5 # 19 rest of div by 5 = 4
	return Vector2i(column_0_4,line_0_4)

func convert_2d_left_right_top_down_xy_to_1d(x_left_right_0_4:int,y_top_down_0_4:int)-> int:
	if not is_valide_index_2d(x_left_right_0_4,y_top_down_0_4):
		push_error("Wrong parameter to work with 2D array of 5x5")
	return y_top_down_0_4*5 +x_left_right_0_4

#Y4  and X =4     4*5 + 4  24
## LEFT->RIGHT TOP->DOWN
## X0 X1 X2 X3 X4 
##  0  1  2  3  4 Y0 
##  5  6  7  8  9 Y1   
## 10 11 12 13 14 Y2
## 15 16 17 18 19 Y3
## 20 21 22 23 24 Y4
	
func display_inverse_on_off_state_led_2d(x_left_right_0_4:int,y_top_down_0_4:int,threshold:float=0.5):
	if is_valide_index_2d(x_left_right_0_4,y_top_down_0_4):
		var index_1d:int = convert_2d_left_right_top_down_xy_to_1d(x_left_right_0_4,y_top_down_0_4)
		display_inverse_on_off_state_led_1d(index_1d, threshold)

func display_set_on_off_led_1d(index_0_24:int, value:bool)->void:
	if is_valide_1d_index(index_0_24):
		array_of_leds[index_0_24].turn_on_off(value)
		
func display_set_on_off_led_2d(x_left_right_0_4:int,y_top_down_0_4:int, value:bool)->void:
	if is_valide_index_2d(x_left_right_0_4,y_top_down_0_4):
		var index_1d:int = convert_2d_left_right_top_down_xy_to_1d(x_left_right_0_4,y_top_down_0_4)
		array_of_leds[index_1d].turn_on_off(value)
		
		

func display_set_2d_led_to_percent(x_left_right_0_4:int,y_top_down_0_4:int,percent:float) :
	if is_valide_index_2d(x_left_right_0_4,y_top_down_0_4):
		var index_1d:int = convert_2d_left_right_top_down_xy_to_1d(x_left_right_0_4,y_top_down_0_4)
		display_set_1d_led_to_percent(index_1d, percent)
		
func display_set_2d_led_to_0_9_int(x_left_right_0_4:int,y_top_down_0_4:int,value_0_9:int) :
	if is_valide_index_2d(x_left_right_0_4,y_top_down_0_4):
		var index_1d:int = convert_2d_left_right_top_down_xy_to_1d(x_left_right_0_4,y_top_down_0_4)
		display_set_1d_led_to_0_9_int(index_1d,value_0_9)
		
func display_set_2d_led_to_0_9_char(x_left_right_0_4:int,y_top_down_0_4:int,value_0_9:String) :
	if is_valide_index_2d(x_left_right_0_4,y_top_down_0_4):
		var index_1d:int = convert_2d_left_right_top_down_xy_to_1d(x_left_right_0_4,y_top_down_0_4)
		display_set_1d_led_to_0_9_char(index_1d,value_0_9)
		

func display_get_2d_led_as_percent(x_left_right_0_4:int,y_top_down_0_4:int)->float:
	if is_valide_index_2d(x_left_right_0_4,y_top_down_0_4):
		var index_1d:int = convert_2d_left_right_top_down_xy_to_1d(x_left_right_0_4,y_top_down_0_4)
		return display_get_1d_led_as_percent(index_1d)
	return 0.0
	
func display_get_2d_led_as_0_9_int(x_left_right_0_4:int,y_top_down_0_4:int)->int:
	if is_valide_index_2d(x_left_right_0_4,y_top_down_0_4):
		var index_1d:int = convert_2d_left_right_top_down_xy_to_1d(x_left_right_0_4,y_top_down_0_4)
		return display_get_1d_led_as_0_9_int(index_1d)
	return 0
func display_get_2d_led_as_0_9_char(x_left_right_0_4:int,y_top_down_0_4:int)->String:
	if is_valide_index_2d(x_left_right_0_4,y_top_down_0_4):
		var index_1d:int = convert_2d_left_right_top_down_xy_to_1d(x_left_right_0_4,y_top_down_0_4)
		return display_get_1d_led_as_0_9_char(index_1d)
	return "0"


func display_get_2d_led_as_on_off(x_left_right_0_4:int,y_top_down_0_4:int,threshold_percent:float=0.5)->bool:
	if is_valide_index_2d(x_left_right_0_4,y_top_down_0_4):
		var index_1d:int = convert_2d_left_right_top_down_xy_to_1d(x_left_right_0_4,y_top_down_0_4)
		return display_get_1d_led_as_percent(index_1d) > threshold_percent
	return false
	
func display_get_1d_led_as_on_off(index_0_24:int,threshold_percent:float=0.5)->bool:
	if is_valide_1d_index(index_0_24):
		return display_get_1d_led_as_percent(index_0_24) > threshold_percent
	return false



# Scroll is an other store of dictionary and time that can be interrupted. 
# The scroll tool will target this one but manage the time. Not for now.
# display.scroll_show_text(text:String)
# display.scroll_show_int(number:int)
# display.scroll_show_float(text:float)
# display.scroll_show_error(text:String)
