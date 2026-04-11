class_name MicroBitUserAndDeveloperCodeFromCodeEdit
extends Node


signal on_push_developer_code(developer_code:String)
signal on_push_user_code(user_code:String)
signal on_push_developer_user_code(developer_code:String,user_code:String)
signal on_pushed_both_code()

@export var developer_code : CodeEdit
@export var user_code : CodeEdit
@export var push_at_ready:bool = true

func _ready() -> void:
	if push_at_ready:
		push_code_in_code_edit()
		

func push_code_in_code_edit():
	on_push_developer_code.emit(developer_code.text)
	on_push_user_code.emit(user_code.text)
	on_push_developer_user_code.emit(developer_code.text,user_code.text)
	on_pushed_both_code.emit()
