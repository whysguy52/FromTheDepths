extends "res://Characters/NPCs/enemy.gd"
class_name boss_1

var isHit = false
var hp = 10

var iFrameTimer

func _ready():
  $boss1/AnimationPlayer.play("Walk")
  player = $/root/Level/Main/Player
  iFrameTimer = $iFrameTimer

func _process(_delta: float) -> void:
  if isHit:
    visible = !visible

func _physics_process(delta: float) -> void:
  movement(delta)

func movement(delta):
  rotate_y(-PI/180 * (level * 0.5 + 1))
  var pointVect = player.global_transform.origin - global_transform.origin
  velocity = pointVect.normalized() * 25 * delta
  move_and_slide()
  pass

func take_hit():
  if isHit:
    return
  else:
    hp -= 1
    if hp == 0:
      queue_free()
    iFrameTimer.start()
    isHit = true

func set_level(newLevel):
  level = newLevel

func _on_i_frame_timer_timeout() -> void:
  isHit = false
  visible = true #just in case flicker stops on false


func _on_leg_body_entered(body: Node3D) -> void:
  if body.name == "Player":
    body.take_damage()
