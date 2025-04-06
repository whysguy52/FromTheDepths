extends CharacterBody3D


var mouseSens = 0.0005
var speed = 250

#references
var cameraNod
var animPlayer:AnimationPlayer
var handL
var handR

#scene holders
var sword
var heldWeapon
var heldSheild
var sheild

func _ready() -> void:
  #references
  cameraNod = $CameraNod
  handL = $Player2/HandL
  handR = $Player2/HandR
  animPlayer = $Player2/AnimationPlayer

  #load sword
  sword = load("res://Assets/Items/Weapons/Sword/sword.tscn")
  heldWeapon = sword.instantiate()
  handR.add_child(heldWeapon)

  #load sheild
  sheild = load("res://Assets/Items/Weapons/Sheild/shield.tscn")
  #heldSheild = sheild.instantiate()
  #handL.add_child(heldSheild)

  #store animation player
  animPlayer.current_animation = "Idle"
  animPlayer.speed_scale = 1
  animPlayer.animation_finished.connect(_on_animation_player_animation_finished)

  Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
  pass

func _process(delta: float) -> void:
  pass

func _physics_process(delta: float) -> void:
  player_movement(delta)
  check_mouse_buttons()

func _input(event):
  if event is InputEventMouseMotion:
    player_camera(event)

func player_camera(event):
  var h_rot = event.relative.x * mouseSens
  var v_rot = event.relative.y * mouseSens
  rotate_y(-h_rot)
  cameraNod.rotate_x(-v_rot)
  cameraNod.rotation.x = clamp(cameraNod.rotation.x, -PI/8, PI/6)

func player_movement(delta):

  var direction:Vector3
  var isW = Input.is_action_pressed("key_w")
  var isA = Input.is_action_pressed("key_a")
  var isS = Input.is_action_pressed("key_s")
  var isD = Input.is_action_pressed("key_d")
  direction += -global_transform.basis.z * (int(isW) - int(isS))
  direction += -global_transform.basis.x * (int(isA) - int(isD))
  velocity = direction.normalized() * speed * delta
  move_and_slide()

func check_mouse_buttons():
  if Input.is_action_just_pressed("mouse_rmb"):
    $lmb_wait_timer.stop()
    animPlayer.play("block")
  elif  Input.is_action_just_released("mouse_rmb"):
    animPlayer.play_backwards("block")
    animPlayer.assigned_animation = "Idle"
  if Input.is_action_just_pressed("mouse_lmb") and animPlayer.assigned_animation.contains("Idle") :
    animPlayer.play("swing1")
  elif Input.is_action_just_pressed("mouse_lmb") and animPlayer.assigned_animation.contains("swing1"):
    animPlayer.play("swing2")
    $lmb_wait_timer.stop()
  elif Input.is_action_just_pressed("mouse_lmb") and animPlayer.assigned_animation.contains("swing2"):
    animPlayer.play("swing1")
    $lmb_wait_timer.stop()


func pic_up_weapon(weapon:Node3D):
  pass

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
  match anim_name:
    "Idle":
      pass
    "block":
      pass
    _:
      $lmb_wait_timer.start()
  return

func _on_lmb_wait_timer_timeout() -> void:
  animPlayer.play("Idle")
  pass # Replace with function body.
