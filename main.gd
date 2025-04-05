extends Node3D

var BasicRoom

var roomGrid = []
var gridWidth = 10
var gridHeight = 10
var level = 1

var row = 3
var column = 3
var numOfRooms:int

func _ready() -> void:
  BasicRoom = load("res://Assets/Rooms/BasicRoom/BasicRoom.tscn")
  #create the 2D array
  for i in gridWidth:
    roomGrid.append([])
    for j in gridHeight:
      roomGrid[i].append(Node)
  createGrid()
  numOfRooms = (randi() % 2) + 5 + (level * 2.6)
  print(numOfRooms)


func createGrid():
  var roomsLeft = numOfRooms
  for i in gridWidth:
    for j in gridHeight:
      roomGrid[i][j] = BasicRoom.instantiate()
      roomGrid[i][j].position.x = i*5
      roomGrid[i][j].position.z = j*5
      $RoomsList.add_child(roomGrid[i][j])
      print("room added")
  pass
