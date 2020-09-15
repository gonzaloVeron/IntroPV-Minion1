extends Node2D

onready var rombo_template = preload("res://rombo.tscn")
var rombos = []
onready var rng = RandomNumberGenerator.new()
var limiteEnX:Vector2
var limiteEnY:Vector2
var cantidadInicial:int
var b = false

var timer = 0

func _process(delta):
	if(b):
		timer += delta
		if(timer >= 5):
			SpawnearRombo()
			timer = 0

func SpawnearRombos():
	for i in range(cantidadInicial):
		SpawnearRombo()

func SpawnearRombo():
	rng.randomize()
	var randomX = rng.randf_range(limiteEnX.x, limiteEnX.y)
	var randomY = rng.randf_range(limiteEnY.x, limiteEnY.y)
	var rombo:Node2D = rombo_template.instance()
	rombo.global_position = Vector2(randomX, randomY)
	rombo.connect("sacarDeLista", self, "_on_Rombo_sacar_de_lista")
	rombos.append(rombo)
	self.add_child(rombo)

func _on_Rombo_sacar_de_lista(rombo):
	rombos.erase(rombo)

func DestruirRombos():
	for i in rombos:
		i.queue_free()

func FrenarSpawn():
	b = false
	timer = 0
