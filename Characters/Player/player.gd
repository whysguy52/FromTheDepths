extends Node3D

var sword
var heldWeapon

func _ready() -> void:
  #temprary load sword
  sword = load("res://Assets/Items/Weapons/Sword/sword.tscn")
  heldWeapon = sword.instantiate()
  $HandR.add_child(heldWeapon)
  pass
