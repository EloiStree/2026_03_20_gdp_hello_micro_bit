class_name MicroBitAreaCollidableArea3D
extends Area3D

@export var is_active:bool=false
@export var in_zone_nodes:Array[Node3D]

@export var clean_for_null_interval_in_seconds:float=0.1
@export_group("Use filtering ")
@export var use_layer_filter: bool = false
@export_flags_3d_physics var layer_mask_filter: int = 0xFFFFFFFF
@export var use_group_filter: bool = false
@export var allow_group_to_interact: String = "interactable_group"
@export var use_script_tag_interactive_source:bool=true

signal on_active_state_changed(is_active:bool)
signal on_down()
signal on_up()

func is_pressed()->bool:
	return in_zone_nodes.size()>0

func is_released()->bool:
	return not is_pressed()

func check_if_active():
	_set_as_active(in_zone_nodes.size()>0)

func _set_as_active(value_on:bool):
	var changed:bool= value_on != is_active
	is_active = value_on
	if changed:
		if is_active:
			#print('Down')
			on_down.emit()
		else :
			#print('Up')
			on_up.emit()
		#print('Changed')
		on_active_state_changed.emit(value_on)
			
	
	
	
func _ready():
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)
	var cleanup_timer := Timer.new()
	cleanup_timer.wait_time = clean_for_null_interval_in_seconds
	cleanup_timer.autostart = true
	cleanup_timer.timeout.connect(_remove_null_in_array_and_check)
	add_child(cleanup_timer)

func _remove_null_in_array_and_check():
	#TODO; SHOULD WORK NOT TESTED
	for i in range(in_zone_nodes.size() - 1, -1, -1):
		if in_zone_nodes[i]==null:
			in_zone_nodes.remove_at(i)
	check_if_active()
	


func _is_valid_target(body:Node3D):
	# you can still allow collision and check with your code
	#
	if use_layer_filter:
		if not (body.collision_layer & layer_mask_filter):
			return false

	if use_group_filter:
		if not body.is_in_group(allow_group_to_interact):
			return false

			
	if use_script_tag_interactive_source:
		var has_children:Node= find_microbit_interactive_source(body)
		if has_children==null:
			return false	
	return true

func find_microbit_interactive_source(node: Node) -> Node:
	if node is MicroBitInteractiveSource:
		return node

	for child in node.get_children():
		var result = find_microbit_interactive_source(child)
		if result:
			return result

	return null


func _on_area_entered(area: Area3D) -> void:
	if not _is_valid_target(area):
		return
	if not in_zone_nodes.has(area):
		in_zone_nodes.append(area)
		check_if_active()
		#print("Hey you touched my tralala ", in_zone_nodes.size())

func _on_area_exited(area: Area3D) -> void:	
	if not _is_valid_target(area):
		return
	if in_zone_nodes.has(area):
		in_zone_nodes.erase(area)	
		check_if_active()
		#print("Leaving soo sooon ?", in_zone_nodes.size())
