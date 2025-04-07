extends Area3D


func _on_body_entered(body: Node3D) -> void:
  if body is Enemy_class:
    body.take_hit()
    pass
  pass # Replace with function body.
