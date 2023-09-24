extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_ui()
	pass



func update_ui():
	var state = $State as Gamestate
	
	$GUI/SpeedProgress.value = 100*(state.speed / state.speedTarget)
	$GUI/SpeedProgress/Label.text = str(state.speed) + "m/s"
	$Ship/SpeedProgress.setProgress("%10.4f m/s" % state.speed)
	
	$GUI/FuelProgress.value = 100*(state.fuel / state.tankSize)
	
	$GUI/EnginePower.button_pressed = state.engineRunning
	$Ship/EngineToggle.setPressed(state.engineRunning)
	$Ship/EngineToggle.setText("Engine Power")
	
	$CustomStarMap.set_speed(state.speed)


func _on_engine_power_toggled(button_pressed):
	$State.toggle_engine(button_pressed)
	pass # Replace with function body.


func _on_engine_toggle_toggle_changed(old_value, new_value):
	$State.toggle_engine(new_value)


func _on_engine_upgrade_pressed():
	$State.enginePower += 30
	$State.enginePower *= 1.1
