extends Node
class_name Gamestate

var fuel = 100.0
var tankSize = 100.0
var speed = 0.0
var damage = 0.0
var hull = 100.0

var engineRunning = false
var enginePower = 30

var baseFuelConsumption = 0.7
var shipAeroFactor = 0.995

var speedTarget = 300000000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var deltaT = 0 
func _process(delta):
	deltaT += delta
	if deltaT > 1:
		deltaT -= 1
		print_my_debug()

	if fuel < 0:
		fuel = 0
		engineRunning = false
	
	if engineRunning:
		fuel -= delta * baseFuelConsumption
		speed += delta * enginePower

	speed = max(0, speed * shipAeroFactor) #TODO factor in delta here	
	
	pass

func toggle_engine(power):
	engineRunning = power


func print_my_debug():
	var debug = "val: " + str(engineRunning) + "\t" + str(speed)

	print(debug)
