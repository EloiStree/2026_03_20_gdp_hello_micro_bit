#class_name MicroBitDisplayMatrix5X5
#extends Node3D
#
#const MAX_LED_COUNT:int =25
#const MAX_LINE_COUNT:int =5
#const MAX_COLUMN_COUNT:int =5
#const MAX_LED_INDEX:int =24
#const MAX_LINE_INDEX:int =4
#const MAX_COLUMN_INDEX:int =4
#
#@export var array_of_led:Array[MicroBitChangeLedColorWithSignal] 
#@export var auto_fill_if_empty :bool =true
#
#
#func auto_fill_array_of_led_with_children():
	#array_of_led.clear()
	#for child in get_children():
		#if child is MicroBitChangeLedColorWithSignal:
			#array_of_led.append(child)
#
#func _ready():
	#
	#if auto_fill_if_empty and array_of_led.size() ==0:
		#auto_fill_array_of_led_with_children()
#
		#
	#if array_of_led.size() != MAX_LED_COUNT:
		#push_error("array_of_led must have exactly " + str(MAX_LED_COUNT) + " elements.")
#
#
	#set_with_text(MicroBitImageGroup.IMAGE_CROSS)
	##clear()	
	####set_with_text(IMAGE_AIM_SQUARE)
###
	###append_full_column(0)
	###await get_tree().create_timer(1.0).timeout
	###append_full_line(0)
	###await get_tree().create_timer(1.0).timeout
	###for i in range(100):
		###set_random_display()
		###await get_tree().create_timer(0.05).timeout
	##await get_tree().create_timer(1.0).timeout
	#clear()
	#await get_tree().create_timer(1.0).timeout
	#set_display_as_full()
	#await get_tree().create_timer(1.0).timeout
	#set_display_as_random()
	#await get_tree().create_timer(1.0).timeout
	#set_display_as_border()
#
	#MicroBitImageGroup.check_that_it_is_initialized()
	### check all key value of MicroBitImageGroup.array_of_image
	##for text in MicroBitImageGroup.array_of_image:
		##set_with_text(text)
		##await get_tree().create_timer(1.0).timeout
	#
	## for text in MicroBitImageGroup.array_of_image:
	## 	set_with_text(text)
	## 	await get_tree().create_timer(1.0).timeout
#
	## check MicroBitImageGroup.char_to_image
#
	#for keys_found in MicroBitImageGroup.char_to_image.keys():
		#var text_image = MicroBitImageGroup.get_text_image_for_char_key(keys_found)
		#set_with_text(text_image)
		#await get_tree().create_timer(1.0).timeout
#
#
#
##region IS VALIDE
#
#func is_valide_index_1d(value_0_24:int)->bool:
	#if value_0_24 < 0 or value_0_24 > MAX_LED_INDEX:
		#return false
	#return true
#
#func is_valide_index_2d(line_0_4:int, column_0_4:int)->bool:
	#if line_0_4 < 0 or line_0_4 > MAX_LINE_INDEX:
		#return false
	#if column_0_4 < 0 or column_0_4 > MAX_COLUMN_INDEX:
		#return false
	#return true
##endregion	
##region CONVERT
#func convert_2d_to_1d(line_0_4:int, column_0_4:int)->int:
	#return line_0_4 * MAX_COLUMN_COUNT + column_0_4
#
#func convert_1d_to_2d(index_0_24:int)->Vector2i:
	#var line_0_4:int = int(index_0_24 / MAX_COLUMN_COUNT)
	#var column_0_4:int = index_0_24 % MAX_COLUMN_COUNT
	#return Vector2i(line_0_4, column_0_4)
	#
##endregion
#
#
#func clear():
	#set_all_leds_to_percent(0.0)
#func set_display_as_full():
	#set_all_leds_to_percent(1.0)
#
#func set_display_as_border():
	#set_with_text(MicroBitImageGroup.IMAGE_BORDER)
#
	#
#func append_full_line(line_0_4:int):
	#if not is_valide_index_2d(line_0_4, 0):
		#return
	#for column in range(MAX_COLUMN_COUNT):
		#set_percent_at_2d_index(line_0_4, column, 1.0)
#
#func append_full_column(column_0_4:int):
	#if not is_valide_index_2d(0, column_0_4):
		#return
	#for line in range(MAX_LINE_COUNT):
		#set_percent_at_2d_index(line, column_0_4, 1.0)
#
#
#func set_display_as_random():
	#for i in range(MAX_LED_COUNT):
		#var random_percent:float = randf()
		#set_percent_at_1d_index(i, random_percent)
#
#func set_all_leds_to_percent(percent_0_1:float):
	#for led in array_of_led:
		#led.set_color_red_with_percent(percent_0_1)
#
#
#func set_percent_at_1d_index(index_0_24:int, percent_0_1:float):
	#if not is_valide_index_1d(index_0_24):
		#return
	#array_of_led[index_0_24].set_color_red_with_percent(percent_0_1)
#
#func set_percent_at_2d_index(line_0_4:int, column_0_4:int, percent_0_1:float):
	#if not is_valide_index_2d(line_0_4, column_0_4):
		#return
	#var index_0_24:int = convert_2d_to_1d(line_0_4, column_0_4)
	#set_percent_at_1d_index(index_0_24, percent_0_1)
#
#func set_char_at_1d_index(index_0_24:int, chararacter:String):
	#if not is_valide_index_1d(index_0_24):
		#return
	#array_of_led[index_0_24].set_color_red_with_0_to_9_char(chararacter)
#
#func set_char_at_2d_index(line_0_4:int, column_0_4:int, chararacter:String):
	#if not is_valide_index_2d(line_0_4, column_0_4):
		#return
	#var index_0_24:int = convert_2d_to_1d(line_0_4, column_0_4)
	#set_char_at_1d_index(index_0_24, chararacter)
#
#
#func set_with_text(text:String):
	#text = text.replace(" ", "").replace("\n", "").replace("\t", "").replace("\r", "").replace(":", "")
	#clear()
	#var char_array:Array = text.split("")
	#for i in range(char_array.size()):
		#if i >= MAX_LED_COUNT:
			#break
		#set_char_at_1d_index(i, char_array[i])
