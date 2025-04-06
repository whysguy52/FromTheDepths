extends Node3D

var sword
var heldWeapon

func _ready() -> void:
  #temprary load sword
  sword = load("res://Assets/Items/Weapons/Sword/sword.tscn")
  heldWeapon = sword.instantiate()
  $Player2/HandR.add_child(heldWeapon)
  pass

func _physics_process(delta: float) -> void:
  camera_update(delta)
  pass

func camera_update(delta):
  #rotate_x(0.01)
  pass
