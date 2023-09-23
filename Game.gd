extends Node2D




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_ui()
	pass




func _on_check_button_toggled(button_pressed):
	$State.toggle_engine(button_pressed)
	pass # Replace with function body.


func update_ui():
	var state = $State as Gamestate
	
	$SpeedProgress.value = 100*(state.speed / state.speedTarget)
	$SpeedProgress/Label.text = str(state.speed) + "m/s"
	
	$FuelProgress.value = 100*(state.fuel / state.tankSize)
	
	$EnginePower.button_pressed = state.engineRunning
	
	$Background/CPUParticles2D.speed_scale = state.speed / 100
