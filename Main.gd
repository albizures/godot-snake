extends Node2D

const SnakePart = preload("res://SnakePart.tscn")
var head = SnakePart.instance()

func _process(delta):
	head.move_to_next(delta)

func _ready():
	add_child(head)


func _input(_event):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
