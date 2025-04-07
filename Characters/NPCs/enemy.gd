extends CharacterBody3D
class_name Enemy_class

@export var level = 1
var isFlying:bool
var type:String

var player
#@onready var rootNode = $/root/Level/Main/Player

func set_level(parentLevel):
  level = parentLevel
