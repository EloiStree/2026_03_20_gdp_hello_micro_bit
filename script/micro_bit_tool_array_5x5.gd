class_name MicroBitToolArray5x5
extends Resource



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


const MAX_LED_COUNT :int = 25
const MAX_LINE_COUNT :int = 5
const MAX_COLUMN_COUNT :int = 5
# Array start from 0 and not 1
const MAX_LED_INDEX :int = 24
const MAX_LINE_INDEX :int = 4
const MAX_COLUMN_INDEX :int = 4

const ARRAY_OF_ZERO:Array[float]=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
const ARRAY_OF_ONE:Array[float]=[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]



#region CODE 


static func get_random_array_5x5()->Array[float]:
	var random :Array[float] =[]
	for i in range(25):
		random.append(randf())
	return random

static func set_grid_with_random(to_affect:Array[float])->void:
	for i in range(25):
		to_affect[i] = randf()


static func clear_given_grid(to_affect:Array[float])->void:
	set_grid_with_percent_0_1(to_affect ,0)

static func set_grid_with_percent_0_1(to_affect:Array[float] ,led_percent_0_1:float)->void:
	for i in range(25):
		to_affect[i] = led_percent_0_1

static func set_all_grid_to_100_percent(to_affect:Array[float])->void:
	set_grid_with_percent_0_1(to_affect ,1.0)

static func set_all_grid_to_0_percent(to_affect:Array[float])->void:
	set_grid_with_percent_0_1(to_affect ,0.0)





static func is_valide_index_2d(x_left_right_0_4:int,y_top_down_0_4:int)->bool:
	return x_left_right_0_4>=0 and y_top_down_0_4>=0 and \
	 x_left_right_0_4<=4 and y_top_down_0_4<=4

static func is_valide_index_1d(index_0_24:int)->bool:
	return index_0_24 >= 0 and index_0_24 <= 24

static func convert_1d_to_2d_left_right_top_down_xy(index_0_24:int)-> Vector2i:
	var line_0_4:int = int(index_0_24/5.0)  # 19/5  int(3.8) 3 
	var column_0_4:int = index_0_24 % 5 # 19 rest of div by 5 = 4
	return Vector2i(column_0_4,line_0_4)

static func convert_2d_left_right_top_down_xy_to_1d(x_left_right_0_4:int,y_top_down_0_4:int)-> int:
	if not is_valide_index_2d(x_left_right_0_4,y_top_down_0_4):
		push_error("Wrong parameter to work with 2D array of 5x5")
	return y_top_down_0_4*5 +x_left_right_0_4

static func remove_all_space_of_text(text:String)-> String:
	return text.replace(" ","").replace("\t","").replace("\r","").replace("\n","").replace(":","")

static func remove_any_that_is_not_0_to_9(text:String)-> String:
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
			 









static func convert_character_0_to_9_to_percent_0_to_1(character:String)->float:
	match character:
		'0':
			return 0.0
		'1':
			return 1.0/9.0
		'2':
			return 2.0/9.0
		'3':
			return 3.0/9.0
		'4':
			return 4.0/9.0
		'5':
			return 5.0/9.0
		'6':
			return 6.0/9.0
		'7':
			return 7.0/9.0
		'8':
			return 8.0/9.0
		'9':
			return 1.0
		_:
			return 0.0

static func convert_character_0_to_9_to_int_0_to_9(character:String)->int:
	match character:
		'0':
			return 0
		'1':
			return 1
		'2':
			return 2
		'3':
			return 3
		'4':
			return 4
		'5':
			return 5
		'6':
			return 6
		'7':
			return 7
		'8':
			return 8
		'9':
			return 9
		_:
			return 0

static func convert_percent_0_to_1_to_character_0_to_9(percent:float)->String:
	if percent <= 0.0:
		return "0"
	elif percent >= 1.0:
		return "9"
	else:
		var int_value = int(round(percent * 9.0))
		return str(int_value)


static func convert_int_0_to_9_to_character_0_to_9(int_value:int)->String:
	match int_value:
		0:
			return "0"
		1:
			return "1"
		2:
			return "2"
		3:
			return "3"
		4:
			return "4"
		5:
			return "5"
		6:
			return "6"
		7:
			return "7"
		8:
			return "8"
		9:
			return "9"
		_:
			return "0"

static func convert_int_0_to_9_to_percent_0_to_1(int_value:int)->float:
	if int_value <= 0:
		return 0.0
	elif int_value >= 9:
		return 1.0
	else:
		return float(int_value) / 9.0



static func get_first_digit_character_in_text_else_space(text:String)->String:
	for c in text:
		if c >= "0" and c <= "9":
			return c
	return " "
static func get_first_digit_character_in_text_else_minus_1(text:String)->String:
	for c in text:
		if c >= "0" and c <= "9":
			return c
	return "-1"

static func get_first_digit_character_in_text_as_percent_else_minus_1(text:String)->float:
	for c in text:
		if c >= "0" and c <= "9":
			return convert_character_0_to_9_to_percent_0_to_1(c)
	return -1.0



static func set_grid_5x5_from_text_of_0_9(to_affect:Array[float], text_with_a_0_9:String):
	text_with_a_0_9 = remove_any_that_is_not_0_to_9(text_with_a_0_9)
	var index:int = 0
	for chararacter in text_with_a_0_9:
		if index >= MAX_LED_COUNT:
			return
		to_affect[index] = convert_character_0_to_9_to_percent_0_to_1(chararacter)
		index = index + 1


static func set_led_1d_with_percent_0_1(to_affect:Array[float] ,led_index_0_24:int ,led_percent_0_1:float)->void:
	if led_index_0_24 < 0 or led_index_0_24 > MAX_LED_INDEX:
		return
	to_affect[led_index_0_24] = led_percent_0_1


static func set_led_1d_with_character_0_9(to_affect:Array[float] ,led_index_0_24:int ,character:String)->void:
	if led_index_0_24 < 0 or led_index_0_24 > MAX_LED_INDEX:
		return
	to_affect[led_index_0_24] = convert_character_0_to_9_to_percent_0_to_1(character)


static func set_led_2d_with_percent_0_1(to_affect:Array[float] ,x_left_right_0_4:int ,y_top_down_0_4:int ,led_percent_0_1:float)->void:
	if not is_valide_index_2d(x_left_right_0_4,y_top_down_0_4):
		return
	var index_1d:int = convert_2d_left_right_top_down_xy_to_1d(x_left_right_0_4,y_top_down_0_4)
	set_led_1d_with_percent_0_1(to_affect ,index_1d ,led_percent_0_1)

static func set_led_2d_with_character_0_9(to_affect:Array[float],x_left_right_0_4:int ,y_top_down_0_4:int ,character:String)->void:
	if not is_valide_index_2d(x_left_right_0_4,y_top_down_0_4):
		return
	var index_1d:int = convert_2d_left_right_top_down_xy_to_1d(x_left_right_0_4,y_top_down_0_4)
	set_led_1d_with_character_0_9(to_affect ,index_1d ,character)

static func get_led_1d_percent_0_1(to_read:Array[float] ,led_index_0_24:int)->float:
	if led_index_0_24 < 0 or led_index_0_24 > MAX_LED_INDEX:
		return 0.0
	return to_read[led_index_0_24]

static func get_led_1d_character_0_9(to_read:Array[float] ,led_index_0_24:int)->String:
	if led_index_0_24 < 0 or led_index_0_24 > MAX_LED_INDEX:
		return "0"
	return convert_percent_0_to_1_to_character_0_to_9(to_read[led_index_0_24])

static func get_led_2d_percent_0_1(to_read:Array[float] ,x_left_right_0_4:int ,y_top_down_0_4:int)->float:
	if not is_valide_index_2d(x_left_right_0_4,y_top_down_0_4):
		return 0.0
	var index_1d:int = convert_2d_left_right_top_down_xy_to_1d(x_left_right_0_4,y_top_down_0_4)
	return get_led_1d_percent_0_1(to_read ,index_1d)	

static func get_led_2d_character_0_9(to_read:Array[float] ,x_left_right_0_4:int ,y_top_down_0_4:int)->String:
	if not is_valide_index_2d(x_left_right_0_4,y_top_down_0_4):
		return "0"
	var index_1d:int = convert_2d_left_right_top_down_xy_to_1d(x_left_right_0_4,y_top_down_0_4)
	return get_led_1d_character_0_9(to_read ,index_1d)

static func get_grid_as_array_int_0_9(to_read:Array[float])->Array[int]:
	var result:Array[int] = []
	for i in range(MAX_LED_COUNT):
		result.append(int(get_led_1d_percent_0_1(to_read ,i) * 9.0))
	return result

static func get_grid_as_array_character_0_9(to_read:Array[float])->Array[String]:
	var result:Array[String] = []
	for i in range(MAX_LED_COUNT):
		result.append(get_led_1d_character_0_9(to_read ,i))
	return result

static func get_grid_as_string_0_9(to_read:Array[float], use_line_return:bool=true)->String:
	var result:Array[String] = []
	for i in range(MAX_LED_COUNT):
		result.append(get_led_1d_character_0_9(to_read ,i))
		if use_line_return and i%5==4:
			result.append('\n')
	return "".join(result)	


static func get_grid_as_string_multiline(to_read:Array[float])->String:
	return get_grid_as_string_0_9(to_read ,true)


static func inverse_led_1d(to_affect:Array[float], led_index_0_24:int, threshold:float=0.5)->void:
	if led_index_0_24 < 0 or led_index_0_24 > MAX_LED_INDEX:
		return
	if to_affect[led_index_0_24] > threshold:
		to_affect[led_index_0_24] = 0.0
	else:
		to_affect[led_index_0_24] = 1.0

static func inverse_grid(to_affect:Array[float], threshold:float=0.5)->void:
	for i in range(MAX_LED_COUNT):
		inverse_led_1d(to_affect, i, threshold)		


		

static func set_led_1d_on_off(to_affect:Array[float], led_index_0_24:int, value:bool)->void:
	if led_index_0_24 < 0 or led_index_0_24 > MAX_LED_INDEX:
		return
	if value:
		to_affect[led_index_0_24] = 1.0
	else:
		to_affect[led_index_0_24] = 0.0

static func set_led_2d_on_off(to_affect:Array[float], x_left_right_0_4:int, y_top_down_0_4:int, value:bool)->void:
	if not is_valide_index_2d(x_left_right_0_4,y_top_down_0_4):
		return
	var index_1d:int = convert_2d_left_right_top_down_xy_to_1d(x_left_right_0_4,y_top_down_0_4)
	set_led_1d_on_off(to_affect, index_1d, value)



static func get_led_1d_as_on_off(to_read:Array[float], led_index_0_24:int, threshold:float=0.5)->bool:
	if led_index_0_24 < 0 or led_index_0_24 > MAX_LED_INDEX:
		return false
	return to_read[led_index_0_24] > threshold

static func get_led_2d_as_on_off(to_read:Array[float], x_left_right_0_4:int, y_top_down_0_4:int, threshold:float=0.5)->bool:
	if not is_valide_index_2d(x_left_right_0_4,y_top_down_0_4):
		return false
	var index_1d:int = convert_2d_left_right_top_down_xy_to_1d(x_left_right_0_4,y_top_down_0_4)
	return get_led_1d_as_on_off(to_read, index_1d, threshold)
		
	#endregion
