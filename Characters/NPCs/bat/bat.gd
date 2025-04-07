extends "res://Characters/NPCs/enemy.gd"

@export var level = 1
var isWaiting = true
var isDashing = false
var dashSpeed

#references
var anim_player:AnimationPlayer
var waitTimer
var dashTimer

func _ready():

  anim_player = $"bat/AnimationPlayer"
  player = get_node("/root/Main/Player")
  waitTimer = $WaitTimer
  dashTimer = $DashTimer
  isFlying = true
  type = "bat"
  anim_player.play("flap")
  waitTimer.wait_time = randi() % 5 + 5 #between 5 and 10 seconds
  waitTimer.start()

  dashTimer.wait_time = 1 - (level * 0.1 )
  dashSpeed = 100 * (level - 1) + 500



func _process(_delta: float) -> void:
  pass

func _physics_process(delta: float) -> void:
  if isWaiting:
    look_at(player.position)
    rise(delta)
  if isDashing:
    velocity = -global_basis.z * dashSpeed * delta
    pass

  move_and_slide()

func rise(delta):
  velocity = Vector3(0,1,0) * 10 * delta
  position.y = clamp(position.y,0,2)
  pass

func set_level(parentLevel):
  level = parentLevel



#event handlers
func _on_wait_timer_timeout() -> void:
  waitTimer.wait_time = randi() % 5 + 5 #between 5 and 10 seconds
  isWaiting = false
  dashTimer.start()
  isDashing = true
  pass # Replace with function body.


func _on_dash_timer_timeout() -> void:
  isDashing = false
  isWaiting = true
  velocity = Vector3(0,0,0)
  pass # Replace with function body.
