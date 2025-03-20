extends Label

@onready var maxTime = 60
@onready var time = maxTime
@onready var time_off = false
@onready var difficulty = 0
@onready var round = 0
@onready var timer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var luigi = get_tree().root.get_child(0).get_node("luigi")
	timer = get_tree().root.get_child(0).get_node("Timer")
	luigi.input_event.connect(_on_luigi_input_event)
	timer.start(maxTime)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = str(int(timer.time_left))
		
		
	pass

func _on_luigi_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_pressed():
		if maxTime > 30:
			maxTime -= 3
		timer.start(maxTime)
	pass # Replace with function body.


func _on_reset_pressed() -> void:
	#temporary will only have 60 seconds
	print("reset clicked")
	timer.start(maxTime)
	time_off = false
	timer.set_paused(time_off)
	pass # Replace with function body.


func _on_pause_pressed() -> void:
	time_off = !time_off
	timer.set_paused(time_off)
	pass # Replace with function body.
