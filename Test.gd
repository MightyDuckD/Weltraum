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
	
	var mat = ($GPUParticles3D.process_material as ParticleProcessMaterial)
	mat.initial_velocity_min = state.speed / 25
	mat.initial_velocity_max = state.speed / 25


func _on_engine_power_toggled(button_pressed):
	$State.toggle_engine(button_pressed)
	pass # Replace with function body.
