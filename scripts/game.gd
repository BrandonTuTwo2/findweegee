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
var difficulty = 0

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
	dynamicLuigi.input_event.connect(_on_luigi_input_event)
	add_child(tempLuigi)
	

func _init() -> void:
	spawn_yoshis(5)
	spawn_warios(5)
	spawn_marios(5)
	spawn_luigi()
	#print(get_node("wario"))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("ready steady")

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func respawnAll(difficulty: int) -> void:
	var randX = rng.randi_range(-50,50) 
	var randY = rng.randi_range(-50,75)
	
	for i in range(len(yoshiArr)):
		self.remove_child(yoshiArr[i])
		self.remove_child(marioArr[i])
		self.remove_child(warioArr[i])
		
	dynamicLuigi.global_position = Vector2(randX,randY)
	yoshiArr = []
	marioArr = []
	warioArr = []
	spawn_yoshis(5 + difficulty) #we can either despawn & respawn each time or change pos each time
	spawn_warios(5 + difficulty)
	spawn_marios(5 + difficulty)
	dynamicLuigi.visible = true
		

func _on_luigi_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_pressed():
		await get_tree().create_timer(2.0).timeout
		difficulty += 2
		respawnAll(difficulty)
	pass # Replace with function body.




func _on_timer_timeout() -> void:
	print("TIME OUT")
	for i in range(len(yoshiArr)):
		self.remove_child(yoshiArr[i])
		self.remove_child(marioArr[i])
		self.remove_child(warioArr[i])	
	pass # Replace with function body.


func _on_reset_pressed() -> void:
	print("HI ME")
	difficulty = 0
	for i in range(len(yoshiArr)):
		self.remove_child(yoshiArr[i])
		self.remove_child(marioArr[i])
		self.remove_child(warioArr[i])
	respawnAll(difficulty)
	pass # Replace with function body.
