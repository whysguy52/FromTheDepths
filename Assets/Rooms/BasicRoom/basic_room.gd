extends StaticBody3D

var type = "room"

var room_number = 0
var roomCheck = [0,0,0,0]
var arraySize = 4

func _ready():
  collect_detectors()
  pass

func set_room_number(myNum):
  room_number = myNum

func collect_detectors():
  roomCheck[0] = $Checker1
  roomCheck[1] = $Checker2
  roomCheck[2] = $Checker3
  roomCheck[3] = $Checker4


func _on_checker_1_body_entered(body: Node3D) -> void:
  print(body)
  pass # Replace with function body.
