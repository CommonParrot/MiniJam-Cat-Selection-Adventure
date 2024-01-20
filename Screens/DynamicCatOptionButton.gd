extends OptionButton
class_name DynamicCatOptionButton

@export var stat_name = ""
var sound
# Called when the node enters the scene tree for the first time.
func _ready():
	item_selected.connect(_on_item_selected)
	Signals.update_ui_stat.connect(selection_accepted)
	sound = AudioStreamPlayer.new()
	sound.bus = "master"
	sound.stream = load("res://Sounds/177614__aminut__02-cat-miauing short.wav")
	add_child(sound)

func _on_item_selected(index):
	Signals.ui_stat_change.emit(stat_name, index)
	sound.play()

func selection_accepted(stat_name: String, value: int):
	if(stat_name == name):
		selected = value
	return
