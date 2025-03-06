extends Node2D

var yoshi = preload("res://scenes/yoshi.tscn")
var luigi = preload("res://scenes/luigi.tscn")
var wario = preload("res://scenes/wario.tscn")
var mario = preload("res://scenes/mario.tscn")
var rng = RandomNumberGenerator.new()
var dynamicLuigi
var yoshiArr = []
var marioArr = []
var warioArr = []

func spawn_yoshis(amount: int) -> void:
	for n in amount:
		var tempYoshi = yoshi.instantiate()
		var randX = rng.randi_range(-50,50) 
		var randY = rng.randi_range(-50,75)
		tempYoshi.global_position = Vector2(randX,randY)
		yoshiArr.append(tempYoshi)
		add_child(tempYoshi)

func spawn_warios(amount: int) -> void:
	for n in amount:
		var tempWario = wario.instantiate()
		var randX = rng.randi_range(-50,50) 
		var randY = rng.randi_range(-50,75)
		tempWario.global_position = Vector2(randX,randY)
		warioArr.append(tempWario)
		add_child(tempWario)

func spawn_marios(amount: int) -> void:
	for n in amount:
		var tempMario = mario.instantiate()
		var randX = rng.randi_range(-50,50) 
		var randY = rng.randi_range(-50,75)
		tempMario.global_position = Vector2(randX,randY)
		marioArr.append(tempMario)
		add_child(tempMario)

func spawn_luigi() -> void:
	var tempLuigi = luigi.instantiate()
	var randX = rng.randi_range(-50,50) 
	var randY = rng.randi_range(-50,75)
	tempLuigi.global_position = Vector2(randX,randY)
	dynamicLuigi = tempLuigi
	add_child(tempLuigi)
	

func _init() -> void:
	spawn_yoshis(40)
	spawn_warios(40)
	spawn_marios(40)
	spawn_luigi()
	print(get_node("wario"))
	dynamicLuigi.input_event.connect(_on_luigi_input_event)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("ready steady")

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_luigi_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_pressed():
		print("luigi clicked stop people from moving")
		for i in range(len(yoshiArr)):
			self.remove_child(yoshiArr[i])
			self.remove_child(marioArr[i])
			self.remove_child(warioArr[i])
		self.remove_child(dynamicLuigi)
		#need to add an 5 second timer or something
		spawn_luigi()
		yoshiArr = []
		marioArr = []
		warioArr = []
		spawn_yoshis(40)
		spawn_warios(40)
		spawn_marios(40)

		
	pass # Replace with function body.
