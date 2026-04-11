class_name MicroBitDevUserCodeToRunningNode
extends Node

signal on_new_node_created(node:Node)
signal on_before_old_node_destroyed(node:Node)
signal on_after_old_node_destroyed(node:Node)


@export var script_name_generated_to_be_loaded :String ="dev_user_code.gd"

@export_group("For Debug")
@export var developer_code:String
@export var code_between_to_split = "\n\n####-------- <DEV|USER> --------####\n\n"
@export var user_code:String

@export var created_node_with_script : Node



func set_developer_code(code:String):
	developer_code = code
func set_user_code(code:String):
	user_code = code
func set_developer_and_user_code(code_dev:String,code_user:String):
	set_developer_code(code_dev)
	set_user_code(code_user)
	
	
func print_current_code_loaded():
	print(developer_code,code_between_to_split,user_code)



func try_execute_code():
	
	if created_node_with_script !=null:
		var old_node = created_node_with_script
		on_before_old_node_destroyed.emit(old_node)
		created_node_with_script.queue_free()
		on_after_old_node_destroyed.emit(old_node)
		created_node_with_script =null
	
	
	var code_to_execute:String = "\n".join([developer_code,code_between_to_split,user_code])
	
	## You can not execute a code wihout creating a file for it.
	## lets create the file
	## folder for the app user you don tneed permission for this one.
	var script_path: String = "user://"+script_name_generated_to_be_loaded
	print(script_path)
	print(ProjectSettings.globalize_path(script_path))
	var file = FileAccess.open(script_path, FileAccess.WRITE)
	if file:
		file.store_string(code_to_execute)
		file.close()
	else:
		push_error("Failed to create file at: %s" % script_path)
		return
		
	var script = ResourceLoader.load(script_path, "GDScript", 0) 
	if not script is GDScript:
		push_error("Loaded file is not a valid GDScript.")
		return 
		
	var node_to_run_in_scene: Node = Node.new()
	created_node_with_script = node_to_run_in_scene
	node_to_run_in_scene.set_script(script)
	node_to_run_in_scene.set_process(true)
	node_to_run_in_scene.set_physics_process(true)
	
	# Ready is called here. when added
	add_child(node_to_run_in_scene)
	on_new_node_created.emit(node_to_run_in_scene)
	# Same for _process
	
	
	
