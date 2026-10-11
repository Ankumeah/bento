extends RichTextLabel

signal lid_removed

var screenHeight: float
var moving: bool = false

func _ready() -> void:
	screenHeight = get_viewport().get_visible_rect().size.y

func _input(event: InputEvent) -> void:
	if (event is InputEventScreenTouch or event is InputEventMouseButton) and not event.pressed and not moving:
		moving = true
		var lid := $"../../bento_lid"
		var tween := create_tween()

		tween.tween_property(lid, "position:y", -screenHeight, 1)
		tween.tween_callback(func():
			print("Lid removed")
			lid_removed.emit()
			lid.queue_free()
		)
