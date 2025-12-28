extends Node2D
class_name PipePair

@onready var topPipe: Pipe = %TopPipe
@onready var bottomPipe: Pipe = %BottomPipe
var distance: float = 0.0

var speed = 100


func _physics_process(delta: float) -> void:
	position.x -= speed * delta


func setDistance(dist: float):
	var randomTopX = randf_range(-300, 300)
	topPipe.position.y = max(randomTopX - dist / 2, -300)
	var bottomPos = randomTopX + (2 * 324)
	print(get_viewport_rect().size.y)
	print(bottomPos)
	bottomPipe.position.y = min(bottomPos + dist / 2, 850)
