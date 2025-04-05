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
  roomGrid[row][column] = BasicRoom.instantiate()
  $RoomsList.add_child(roomGrid[row][column])
  numOfRooms = (randi() % 2) + 5 + (level * 2.6)
  createGrid()


func createGrid():
  var roomsLeft = numOfRooms
  while roomsLeft > 0:
    var roomSelect = randi() % 4 + 1 # generates an even number, which is up, down, left or right
    match roomSelect:
      1:
        if row-1 > 0 and roomGrid[row-1][column] is not Node3D :
          row -= 1
          createRoom()
          roomsLeft -= 1
      2:
        if column-1 > 0 and roomGrid[row][column-1] is not Node3D:
          column -= 1
          createRoom()
          roomsLeft -= 1
      3:
        if column+1 < 10 and roomGrid[row][column+1] is not Node3D:
          column += 1
          createRoom()
          roomsLeft -= 1
      4:
        if row+1 < 10 and roomGrid[row+1][column] is not Node3D:
          column += 1
          createRoom()
          roomsLeft -= 1
    print(roomsLeft)

func createRoom():
  roomGrid[row][column] = BasicRoom.instantiate()
  roomGrid[row][column].position.z = row*10
  roomGrid[row][column].position.x = row*10
  $RoomsList.add_child(roomGrid[row][column])
  pass
