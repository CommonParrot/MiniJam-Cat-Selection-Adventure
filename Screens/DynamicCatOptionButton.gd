extends OptionButton
class_name DynamicCatOptionButton

@export var stat_name = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	item_selected.connect(_on_item_selected)


func _on_item_selected(index):
	Signals.ui_stat_change.emit(stat_name, selected)

func selection_accepted(name: string, value: int):
	if(stat_name == name):
		selected = value
	else:
		

