extends StaticBody3D

var type = "room"

var room_number = 0
var roomCheck = [0,0,0,0]
var doorWays = [0,0,0,0]
var doorFrames = [0,0,0,0]
var doorCollider = [0,0,0,0]
var arraySize = 4

func _ready():
  collect_detectors()
  collect_door_frames()
  collect_door_ways()
  collect_door_colliders()
  pass

func set_room_number(myNum):
  room_number = myNum

func collect_door_frames():
  doorFrames[0] = $BasicRoom/DoorFrame1
  doorFrames[0].visible = false
  doorFrames[1] = $BasicRoom/DoorFrame2
  doorFrames[1].visible = false
  doorFrames[2] = $BasicRoom/DoorFrame3
  doorFrames[2].visible = false
  doorFrames[3] = $BasicRoom/DoorFrame4
  doorFrames[3].visible = false

func collect_door_ways():
  doorWays[0] = $BasicRoom/DoorWay1
  doorWays[1] = $BasicRoom/DoorWay2
  doorWays[2] = $BasicRoom/DoorWay3
  doorWays[3] = $BasicRoom/DoorWay4

func collect_door_colliders():
  doorCollider[0] = $DoorCollide1
  doorCollider[0].disabled = true
  doorCollider[1] = $DoorCollide2
  doorCollider[1].disabled = true
  doorCollider[2] = $DoorCollide3
  doorCollider[2].disabled = true
  doorCollider[3] = $DoorCollide4
  doorCollider[3].disabled = true
  pass


func collect_detectors():
  roomCheck[0] = $Checker1
  roomCheck[1] = $Checker2
  roomCheck[2] = $Checker3
  roomCheck[3] = $Checker4



func _on_arena_area_body_entered(body: Node3D) -> void:
  if body.name == "Player":
    print("room#: " + str(room_number))
    $DoorCollide1.set_deferred("disabled",false)

    $DoorCollide2.set_deferred("disabled",false)
    $DoorCollide3.set_deferred("disabled",false)
    $DoorCollide4.set_deferred("disabled",false)
    for i in doorFrames.size():
      if doorFrames[i].visible == true:
        doorWays[i].visible = true
  pass # Replace with function body.

func open_doors():
  for i in doorFrames.size():
    if doorFrames[i].visible == true:
      doorWays[i].visible = false
      doorCollider[i].set_deferred("disabled",true)


func _on_test_trigger_body_entered(body: Node3D) -> void:
  if body.name != "Player":
    return
  open_doors()
  pass # Replace with function body.
