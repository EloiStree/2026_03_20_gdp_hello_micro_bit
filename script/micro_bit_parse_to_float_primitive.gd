class_name MicroBitParseToFloatPrimitive
extends Node


signal on_parse_as_float(value:float)


func parse_integer_to_float(value:int):
	on_parse_as_float.emit(float(value))

func parse_string_to_float(value:String):
	on_parse_as_float.emit(float(value))

	
