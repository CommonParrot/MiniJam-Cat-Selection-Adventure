extends Node

@export var points = 4
var health = 2
var agility = 2
var magic = 2

var cat_color = cat_colors.WHITE
var eye_color = eye_colors.BLUE

enum classes {}
enum cat_colors {GRAY, BLACK, WHITE, BROWN}
enum eye_colors {BLUE, PURPLE, GREEN, RED}

var eye_node
var body_node
# 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	eye_node = get_node("%Eyes")
	body_node = get_node("%Cat")
	Signals.update_ui_stat.emit("color", 2)
	Signals.update_ui_stat.emit("color_eyes", 0)
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
			set_cat_color(stat_value)
		"color_eyes":
			set_eyes_color(stat_value)
	if !possible:
		return
	Signals.ui_stat_change.emit(stat_name, stat_value)

func set_cat_color(stat_value: int = 0):
	match stat_value:
		cat_colors.GRAY:
			body_node.texture = load("res://images/Grey_Cat.png")
		cat_colors.WHITE:
			body_node.texture = load("res://images/White_Cat.png")
		cat_colors.BLACK:
			body_node.texture = load("res://images/Black_Cat.png")
		cat_colors.BROWN:
			body_node.texture = load("res://images/Brown_Cat.png")

func set_eyes_color(stat_value: int = 0):
	match stat_value:
		eye_colors.BLUE:
			eye_node.texture = load("res://images/Blue_Eyes.png")
		eye_colors.PURPLE:
			eye_node.texture = load("res://images/Purple_Eyes.png")
		eye_colors.RED:
			eye_node.texture = load("res://images/Red_Eyes.png")
		eye_colors.GREEN:
			eye_node.texture = load("res://images/Green_Eyes.png")
