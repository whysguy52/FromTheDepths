extends Node3D

var mainWorld = load("res://Assets/Rooms/main.tscn")
var currentWorld

func _ready() -> void:
  currentWorld = $Main

func newWorld():
  var destroyer = $Main
  remove_child(destroyer)
  destroyer.call_deferred("free")
  currentWorld = mainWorld.instantiate()
  add_child(currentWorld)
  #currentWorld.queue_free()
  #currentWorld = mainWorld.instantiate()
  #currentWorld.name = "Main"
  #add_child(currentWorld)
