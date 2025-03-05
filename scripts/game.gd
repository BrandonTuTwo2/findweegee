extends Node2D

var yoshi = preload("res://scenes/yoshi.tscn")
var luigi = preload("res://scenes/luigi.tscn")
var wario = preload("res://scenes/wario.tscn")
var mario = preload("res://scenes/mario.tscn")
var rng = RandomNumberGenerator.new()

func spawn_yoshis(amount: int) -> void:
	for n in amount:
		var tempYoshi = yoshi.instantiate()
		var randX = rng.randi_range(-50,50) 
		var randY = rng.randi_range(-50,75)
		tempYoshi.global_position = Vector2(randX,randY)
		add_child(tempYoshi)

func spawn_warios(amount: int) -> void:
	for n in amount:
		var tempWario = wario.instantiate()
		var randX = rng.randi_range(-50,50) 
		var randY = rng.randi_range(-50,75)
		tempWario.global_position = Vector2(randX,randY)
		add_child(tempWario)

func spawn_marios(amount: int) -> void:
	for n in amount:
		var tempMario = mario.instantiate()
		var randX = rng.randi_range(-50,50) 
		var randY = rng.randi_range(-50,75)
		tempMario.global_position = Vector2(randX,randY)
		add_child(tempMario)

func spawn_luigi() -> void:
	var tempLuigi = luigi.instantiate()
	var randX = rng.randi_range(-50,50) 
	var randY = rng.randi_range(-50,75)
	tempLuigi.global_position = Vector2(randX,randY)
	add_child(tempLuigi)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_yoshis(40)
	spawn_warios(40)
	spawn_marios(40)


	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
