
class_name MicroBitChangeLedColorMesh
extends Node3D


@export var to_affect: MeshInstance3D = null
@export var color_at_ready:Color = Color(0,0,0,0)

##For the demo, I will remove it.
#var time_elapsed: float = 0.0

func _ready() -> void:
	#print("Hello Cube ;)")
	# set_cube_color(color_at_ready)
	#set_random_color()
	pass

func _process(delta: float) -> void:
	##for the fun
	#set_random_color()
	 #Ctrl + K
	#time_elapsed+= delta
	#var time_divided_by =time_elapsed / 3.0 ##   10 / 3  3.3333
	#var time_multiply_by_100 =time_divided_by*100.0  ## 333.33333
	#var percent = (int(time_multiply_by_100) % 100) /100.0 ### 33.333  0.33333
	#set_color_red_with_percent(percent)
	pass
	
	
	
func set_random_color():
	var random_color = Color(0,0,0,1) # That is a local variable
	random_color.r = randf()
	random_color.g = randf()
	random_color.b = randf()
	random_color.a = randf()
	set_cube_color(random_color)
	
func set_cube_color(color:Color):
	to_affect.get_active_material(0).albedo_color = color
	
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
	for char in text_with_a_0_9:
		var int_value :int=-1
		match char:
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
		

	
		
	
	
