class_name MicroBitIndexTrueFalseMaterialOnMesh
extends Node

@export var true_material:StandardMaterial3D
@export var false_material:StandardMaterial3D

@export var mesh_instances:Array[MeshInstance3D]



func set_index_as_true_false(index_0_n:int, is_true:bool)->void:
	if index_0_n < 0 or index_0_n >= mesh_instances.size():
		return
	var mesh_instance = mesh_instances[index_0_n]
	if mesh_instance == null:
		return
	if is_true:
		mesh_instance.set_surface_override_material(0, true_material)
	else:
		mesh_instance.set_surface_override_material(0, false_material)
