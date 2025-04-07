extends Area3D


func _on_body_entered(body: Node3D) -> void:
  if body is Enemy_class:
    body.take_hit()
  if body.name == "Ladder":
    var root = $/root/Level/Main
    root.call_deferred("on_boss_room_defeated")
  pass # Replace with function body.
