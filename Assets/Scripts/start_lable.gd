extends RichTextLabel

func _input(event: InputEvent) -> void:
	if (event is InputEventScreenTouch or event is InputEventMouseButton) and not event.pressed:
		pass # TODO: remove lable, remove lid and add chopsticks
