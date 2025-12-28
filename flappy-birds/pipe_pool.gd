extends Node

@export var pipeScene: PackedScene
@export var pipePoolSize: int

@export var initialSpaceBetween: float = 400
@export var initalDistance: float = 300

var _minDistance = 50
var _minSpace = 100

@export var spcaeBetweenReduce: float = 1
@export var distanceBetweenReduce: float = 10

var _pipe_pool: Array[PipePair] = []
var nextPipeIndex: int = 0
var lastPipe: PipePair
var nextPipeDistance: float = self.initalDistance
var nextPipeSpaceBetween: float = self.initialSpaceBetween


func _ready() -> void:
	for i in range(pipePoolSize):
		var pipe = pipeScene.instantiate() as PipePair
		add_child(pipe)
		_pipe_pool.append(pipe)
		var notifier = (
			pipe.get_node_or_null("VisibleOnScreenNotifier2D") as VisibleOnScreenNotifier2D
		)
		if notifier == null:
			push_error("notifer not found")
		notifier.screen_entered.connect(func(): print(pipe.name, " entered"))
		notifier.screen_exited.connect(_pipeExitedScreen.bind(pipe))
	initalPlace()


func _pipeExitedScreen(pipe: PipePair):
	self.nextPipeDistance -= self.distanceBetweenReduce
	self.nextPipeSpaceBetween -= self.spcaeBetweenReduce

	var randomDistanceReduce = randf_range(-(nextPipeDistance / 2), nextPipeDistance / 2)
	var randomSpaceReduce = randf_range(-(nextPipeSpaceBetween / 2), nextPipeSpaceBetween / 2)

	placePipePair(
		pipe,
		max(nextPipeDistance - randomDistanceReduce, 50),
		nextPipeSpaceBetween - randomSpaceReduce
	)


func initalPlace():
	var firstPipe: PipePair = get_next()
	firstPipe.position.x = 400 + initialSpaceBetween
	firstPipe.setDistance(initalDistance)
	lastPipe = firstPipe
	for i in pipePoolSize - 1:
		placePipePair(get_next(), initalDistance, initialSpaceBetween)


func placePipePair(pipePair: PipePair, distance: float, spaceBetween: float):
	var distanceClamped = clampf(distance, _minDistance, 1000)
	var spaceClamped = clampf(spaceBetween, _minSpace, 1000)

	pipePair.position.x = lastPipe.position.x + spaceClamped
	pipePair.setDistance(distanceClamped)
	lastPipe = pipePair
	print("Placing Pipe: " + pipePair.name + " at x: " + String.num(pipePair.position.x))


func get_next() -> PipePair:
	if nextPipeIndex == pipePoolSize:
		nextPipeIndex = 0
	var nextPipe = _pipe_pool.get(nextPipeIndex)
	nextPipeIndex += 1
	return nextPipe
