extends Area3D

var myDoorFrame
var myDoorWay

func _ready():
  myDoorFrame = get_parent().get_node("BasicRoom/DoorFrame2")
  myDoorFrame.visible = false


func _on_body_entered(_body: Node3D) -> void:
  myDoorFrame.visible = true
  pass # Replace with function body.
