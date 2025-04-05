extends Node3D

var roomGrid = []
var gridWidth = 10
var gridHeight = 10
var level = 1

var row = 3
var column = 3
var numOfRooms:int

func _ready() -> void:
  #create the 2D array
  for i in gridWidth:
    roomGrid.append([])
    for j in gridHeight:
      roomGrid[i].append(Node)
  numOfRooms = (randi() % 2) + 5 + (level * 2.6)
  print(numOfRooms)


func createGrid():

  pass
