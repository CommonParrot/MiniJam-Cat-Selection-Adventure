extends Node

@export var points = 10
var health = 2
var agility = 2
var magic = 2

enum classes {}
enum colors {}
enum eye_colors {}
# 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Signals.ui_stat_change.connect(change_cat_stat)


func change_cat_stat(stat_name: String, stat_value: int) -> void:
	check_stat_change_possible(stat_name, stat_value)
	Signals.ui_stat_change.emit(stat_name, stat_value)