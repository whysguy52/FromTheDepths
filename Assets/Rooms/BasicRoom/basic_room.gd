extends StaticBody3D

var type = "room"

var room_number = 0
var roomCheck = [0,0,0,0]
var doorWays = [0,0,0,0]
var doorFrames = [0,0,0,0]
var arraySize = 4

func _ready():
  collect_detectors()
  collect_door_frames()
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

func collect_detectors():
  roomCheck[0] = $Checker1
  roomCheck[1] = $Checker2
  roomCheck[2] = $Checker3
  roomCheck[3] = $Checker4
