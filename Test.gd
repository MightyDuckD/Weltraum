extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_ui()
	shake()
	pass

var rng = RandomNumberGenerator.new()

func update_ui():
	var state = $State as Gamestate
	
	$GUI/SpeedProgress.value = 100*(state.speed / state.speedTarget)
	$GUI/SpeedProgress/Label.text = str(state.speed) + "m/s"
	
	if state.enginePower > 22795424:
		$CustomStarMap.visible = false
		$Ship/SpeedProgress.setProgress("XXs§§X4[exit]_X")
		$Camera3D.environment.background_color = Color.WHITE
	elif state.enginePower > 9667295:
		$Ship/SpeedProgress.setProgress("%10.4f m/s" % (state.speed * rng.randf_range(-100.0, 100.0))) 
	else:
		$Ship/SpeedProgress.setProgress("%10.4f m/s" % state.speed)
	
	
#	if state.speed > 3000000:#
#		trauma = 0.000#3
#	elif state.speed > 56000:
#		trauma = 0.0002
#	elif state.speed > 16000:
#		trauma = 0.00001
#	else: 
#		trauma = 0

	if state.engineRunning and state.enginePower < 22795424 + 1:
		trauma = log(state.speed) / 1000.0
	else:
		trauma = 0
	
	
	
	$GUI/FuelProgress.value = 100*(state.fuel / state.tankSize)
	
	$GUI/EnginePower.button_pressed = state.engineRunning
	$Ship/EngineToggle.setPressed(state.engineRunning)
	$Ship/EngineToggle.setText("Engine started")
	$Ship/Upgrade.setText("Upgrade!")
	
	$CustomStarMap.set_speed(state.speed)
	


func _on_engine_power_toggled(button_pressed):
	$State.toggle_engine(button_pressed)
	pass # Replace with function body.


func _on_engine_toggle_toggle_changed(old_value, new_value):
	$State.toggle_engine(new_value)


func _on_engine_upgrade_pressed():
	$State.enginePower += 30
	$State.enginePower *= 1.1



var decay = 0.8  # How quickly the shaking stops [0, 1].
var max_offset = Vector2(100, 75)  # Maximum hor/ver shake in pixels.
var max_roll = 0.1  # Maximum rotation in radians (use sparingly).
var trauma = 0.0  # Current shake strength.
var trauma_power = 2  # Trauma exponent. Use [2, 3].
func shake():
	var amount = pow(trauma, trauma_power)
	$Camera3D.rotation.x = max_roll * amount * randf_range(-1, 1)
	$Camera3D.h_offset = max_offset.x * amount * randf_range(-1, 1)
	$Camera3D.v_offset = max_offset.y * amount * randf_range(-1, 1)


func _on_upgrade_on_pressed():
	$State.enginePower += 30
	$State.enginePower *= 1.1
	
