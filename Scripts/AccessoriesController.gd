extends PanelContainer


func _on_earrings_pressed():
	if $Earrings.visible == true:
		$Earrings.visible = false
	else:
		$Earrings.visible = true


func _on_glasses_pressed():
	if $Glasses.visible == true:
		$Glasses.visible = false
	else:
		$Glasses.visible = true


func _on_tail_trinket_pressed():
	if $TailTrinket.visible == true:
		$TailTrinket.visible = false
	else:
		$TailTrinket.visible = true


func _on_crown_pressed():
	if $Crown.visible == true:
		$Crown.visible = false
	else:
		$Crown.visible = true
