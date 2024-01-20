extends Node

@export var points = 4
var health = 2
var agility = 2
var magic = 2

enum classes {}
enum colors {GRAY, BLACK, WHITE, BROWN}
enum eye_colors {BLUE, PURPLE, GREEN, RED}
# 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Signals.ui_stat_change.connect(change_cat_stat)


func change_cat_stat(stat_name: String, stat_value: int) -> void:
	var possible = false
	match stat_name:
		"health": 
			if (stat_value - health) < points:
				points += stat_value - health
				possible = true
		"agility":
			if (stat_value - agility) < points:
				points += stat_value - agility
				possible = true
		"magic":
			if (stat_value - magic) < points:
				points += stat_value - agility
				possible = true
		"color":
			
			
		"eyes_color":
			

	if !possible:
		return
	Signals.ui_stat_change.emit(stat_name, stat_value)