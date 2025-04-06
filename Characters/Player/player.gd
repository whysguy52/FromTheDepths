extends CharacterBody3D

var sword
var heldWeapon
var mouseSens = 0.0005
var speed = 250

var cameraNod
var animPlayer:AnimationPlayer

func _ready() -> void:
  #temprary load sword
  sword = load("res://Assets/Items/Weapons/Sword/sword.tscn")
  animPlayer = $Player2/AnimationPlayer
  cameraNod = $CameraNod
  heldWeapon = sword.instantiate()
  $Player2/HandR.add_child(heldWeapon)
  $Player2/AnimationPlayer.current_animation = "Idle"
  $Player2/AnimationPlayer.speed_scale = 1
  $Player2/AnimationPlayer.animation_finished.connect(_on_animation_player_animation_finished)
  Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
  pass



func _physics_process(delta: float) -> void:
  player_movement(delta)
  print(animPlayer.assigned_animation)
  if Input.is_action_just_pressed("mouse_lmb") and animPlayer.assigned_animation.contains("Idle") :
    animPlayer.play("swing1")
  elif Input.is_action_just_pressed("mouse_lmb") and animPlayer.assigned_animation.contains("swing1"):
    animPlayer.play("swing2")
    $lmb_wait_timer.stop()
  elif Input.is_action_just_pressed("mouse_lmb") and animPlayer.assigned_animation.contains("swing2"):
    animPlayer.play("swing1")
    $lmb_wait_timer.stop()
    pass


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


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
  if anim_name.contains("swing1"):
    $lmb_wait_timer.start()
    print("anim swing1 over")
  elif anim_name.contains("swing2"):
    $lmb_wait_timer.start()
    print("anim swing2 over")
  elif anim_name.contains("Idle"):
    print("anim Idle over")
  else:
    print("unknown")
    #animPlayer.assigned_animation = "Idle"
  pass


func _on_lmb_wait_timer_timeout() -> void:
  animPlayer.play("Idle")
  print(animPlayer.assigned_animation)
  pass # Replace with function body.
