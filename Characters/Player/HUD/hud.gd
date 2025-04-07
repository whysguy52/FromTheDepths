extends CanvasLayer

var heartContainers = []
var heartIndex
var level = 1

var heartContainer = load("res://Characters/Player/HUD/heart_container.tscn")

func _ready():
  for j in get_parent().hp:
    heartContainers.append(heartContainer.instantiate())
    $HBoxContainer.add_child(heartContainers[j])
  set_level(level)
  heartIndex = heartContainers.size()-1


func set_level(toDisplay):
  level = toDisplay
  $LevelText.text = str(level) + "/5"

func _process(delta: float) -> void:
  if heartIndex == -1:
    $GameOverSign.visible = true

func damage_hud():
  if heartIndex < 0:
    return
  heartContainers[heartIndex].visible = false
  heartIndex -= 1
