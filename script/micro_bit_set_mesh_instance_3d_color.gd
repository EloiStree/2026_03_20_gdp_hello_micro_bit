class_name MicroBitSetMeshInstanceColor3D
extends Node

@export var to_affect: MeshInstance3D = null
@export var duplicate_material_at_ready: bool = true

func _ready() -> void:
	if to_affect == null:
		push_warning("No MeshInstance3D assigned to 'to_affect'")
		return
	
	if duplicate_material_at_ready:
		var mat:Material = to_affect.get_active_material(0)
		if mat:
			var new_mat = mat.duplicate()
			to_affect.set_surface_override_material(0, new_mat)

func set_color_of_the_mesh_material(new_color: Color):
	var mat = to_affect.get_active_material(0)
	if mat:
		mat.albedo_color = new_color
