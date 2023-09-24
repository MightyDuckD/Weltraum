extends Node
class_name Gamestate

var fuel = 100.0
var tankSize = 100.0
var speed = 50.0
var damage = 0.0
var hull = 100.0

var engineRunning = false
var enginePower = 30

var baseFuelConsumption = 0.7
var shipAeroFactor = 0.1

var speedTarget = 300000000

var timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.connect("timeout", Callable(self, "rest_state"))
	timer.wait_time = 5
	timer.one_shot = true
	add_child(timer)
	timer.start()
	pass # Replace with function body.

func rest_state():
	shipAeroFactor = 0.0001

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

	var verlust = (speed * speed * shipAeroFactor)
	
	speed -= delta * verlust
	
	speed = max(0, speed)
	#speed = max(0, speed * shipAeroFactor) #TODO factor in delta here	
	
func toggle_engine(power):
	engineRunning = power


func print_my_debug():
	var debug = "val: " + str(engineRunning) + "\t" + str(speed)

	print(debug)
