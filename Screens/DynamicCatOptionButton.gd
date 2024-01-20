extends OptionButton
class_name DynamicCatOptionButton

@export var stat_name = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_item_selected(index):
	Signals.ui_stat_change.emit(stat_name, 1)
