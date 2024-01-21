extends Node

@export var points = 10
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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	eye_node = get_node("%Eyes")
	body_node = get_node("%Cat")
	Signals.ui_stat_change.connect(change_cat_stat)


func change_cat_stat(stat_name: String, stat_value: int) -> void:
	match stat_name:
		"health": 
			if total_points() - health + stat_value + 1 <= points:
				health = stat_value + 1
			Signals.update_ui_stat.emit(stat_name, health - 1)
		"agility":
			if total_points() - agility + stat_value + 1 <= points:
				agility = stat_value + 1
			Signals.update_ui_stat.emit(stat_name, agility - 1)
		"magic":
			if total_points() - magic + stat_value + 1 <= points:
				magic = stat_value + 1
			Signals.update_ui_stat.emit(stat_name, magic - 1)
		"color":
			set_cat_color(stat_value)
		"color_eyes":
			set_eyes_color(stat_value)

func total_points() -> int:
	return health + agility + magic

func total_value() -> float:
	return health + agility + magic

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


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Screens/End.tscn")
