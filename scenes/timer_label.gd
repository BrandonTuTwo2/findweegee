extends Label

@onready var time = 61
@onready var timer_on = true
@onready var difficulty = 0
@onready var round = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (timer_on and time > 0):
		time -= delta
		text = var_to_str(int(time))
		
		
	pass


func _on_reset_pressed() -> void:
	#temporary will only have 60 seconds
	time = 60
	timer_on = true
	pass # Replace with function body.


func _on_pause_pressed() -> void:
	timer_on = !timer_on
	pass # Replace with function body.
