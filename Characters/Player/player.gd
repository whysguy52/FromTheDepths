extends CharacterBody3D

var sword
var heldWeapon
var mouseSens = 0.0005
var speed = 5

var cameraNod

func _ready() -> void:
  #temprary load sword
  sword = load("res://Assets/Items/Weapons/Sword/sword.tscn")
  cameraNod = $CameraNod
  heldWeapon = sword.instantiate()
  $Player2/HandR.add_child(heldWeapon)
  Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
  pass

func _physics_process(delta: float) -> void:
  var direction:Vector3
  var isW = Input.is_action_pressed("key_w")
  var isA = Input.is_action_pressed("key_a")
  var isS = Input.is_action_pressed("key_s")
  var isD = Input.is_action_pressed("key_d")
  direction += -global_transform.basis.z * (int(isW) - int(isS))
  direction += -global_transform.basis.x * (int(isA) - int(isD))
  velocity = direction.normalized() * speed
  print(direction)
  move_and_slide()
  pass

func _input(event):
  if event is InputEventMouseMotion:
    var h_rot = event.relative.x * mouseSens
    var v_rot = event.relative.y * mouseSens
    rotate_y(-h_rot)
    cameraNod.rotate_x(-v_rot)
    cameraNod.rotation.x = clamp(cameraNod.rotation.x, -PI/8, PI/6)
  pass
