class_name  MicroBitTurnExistingScriptToTextEmit
extends Node

signal on_source_pushed(code_as_text:String)


@export var source_to_emit :Script
@export var emit_at_ready:bool

func _ready() -> void:
	if emit_at_ready:
		push_source_code_as_text()

func push_source_code_as_text():
	var path := source_to_emit.resource_path
	var script_text := FileAccess.get_file_as_string(path)
	on_source_pushed.emit(script_text)
