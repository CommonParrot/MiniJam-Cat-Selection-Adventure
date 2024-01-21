extends OptionButton
class_name DynamicCatOptionButton

@export var stat_name = ""

var audioplayer

# Called when the node enters the scene tree for the first time.
func _ready():
	item_selected.connect(_on_item_selected)
	Signals.update_ui_stat.connect(selection_accepted)
	audioplayer = AudioStreamPlayer.new()
	audioplayer.stream = load("res://Sounds/177614__aminut__02-cat-miauing short.wav")
	add_child(audioplayer)


func _on_item_selected(index):
	Signals.ui_stat_change.emit(stat_name, index)
	sound.play()

func selection_accepted(stat_name: String, value: int):
	if(stat_name == self.stat_name):
		if value == selected:
			audioplayer.play()
		selected = value
