extends Node2D

enum DIRECTION{
	UP,
	DOWN,
	LEFT,
	RIGHT
}

var speed = 300
var direction = DIRECTION.RIGHT
var grid_position = Vector2(0, 0)

func _input(_event):
	if Input.is_key_pressed(KEY_A) and DIRECTION.RIGHT != direction:
		direction = DIRECTION.LEFT
		to_next()
	elif Input.is_key_pressed(KEY_D) and DIRECTION.LEFT != direction:
		direction = DIRECTION.RIGHT
		to_next()
	elif Input.is_key_pressed(KEY_S) and DIRECTION.UP != direction:
		direction = DIRECTION.DOWN
		to_next()
	elif Input.is_key_pressed(KEY_W) and DIRECTION.DOWN != direction:
		direction = DIRECTION.UP
		to_next()


func to_next():
	if direction == DIRECTION.LEFT:
		position.x -= 32;
	if direction == DIRECTION.RIGHT:
		position.x += 32;
	if direction == DIRECTION.UP:
		position.y -= 32;
	if direction == DIRECTION.DOWN:
		position.y += 32;

	grid_position = position


func move_to_next(delta: float):
	if direction == DIRECTION.LEFT:
		grid_position.x -= speed * delta
	if direction == DIRECTION.RIGHT:
		grid_position.x += speed * delta
	if direction == DIRECTION.UP:
		grid_position.y -= speed * delta
	if direction == DIRECTION.DOWN:
		grid_position.y += speed * delta

	position = (grid_position / 32).round() * 32

