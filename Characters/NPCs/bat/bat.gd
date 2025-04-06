extends RigidBody3D

var anim_player:AnimationPlayer

func _ready():
  anim_player = $"bat/AnimationPlayer"
  anim_player.play("flap")
