extends Node3D

var mainWorld = load("res://Assets/Rooms/main.tscn")
var currentWorld
var currentLevel = 1

func _ready() -> void:
  currentWorld = $Main

func newWorld():
  var destroyer = $Main
  remove_child(destroyer)
  destroyer.queue_free()
  currentWorld = mainWorld.instantiate()
  currentLevel += 1

  currentWorld.set_level(currentLevel)
  add_child(currentWorld)
  currentWorld.name = "Main"
