extends Node2D

onready var spawnDeTriangulos_template = preload("res://SpawnDeTriangulos.tscn")
var cantidadDeAgujeros:int
var agujeros = []
onready var rng = RandomNumberGenerator.new()
var limiteEnX:Vector2
var limiteEnY:Vector2
var target:Node2D
var cantidadMaxTriangulos = 8
var cantidadTriangulosActual = 0

func SpawnearAgujeros():
	for i in range(cantidadDeAgujeros):
		rng.randomize() #Funcion recomendada por Kerister!
		var randomX = rng.randf_range(limiteEnX.x, limiteEnX.y)
		var randomY = rng.randf_range(limiteEnY.x, limiteEnY.y)
		var spawnT:Node2D = spawnDeTriangulos_template.instance()
		spawnT.global_position = Vector2(randomX, randomY)
		print("Posicion random para agujero: " + str(spawnT.global_position))
		spawnT.target = target
		agujeros.append(spawnT)
		add_child(spawnT)

func DestruirAgujeros():
	for i in agujeros:
		i.queue_free()

func canSpawn():
	return cantidadTriangulosActual < cantidadMaxTriangulos

func incrementarTriangulo():
	cantidadTriangulosActual += 1

func _on_Enemy_decrementarCantidad():
	cantidadTriangulosActual -= 1
