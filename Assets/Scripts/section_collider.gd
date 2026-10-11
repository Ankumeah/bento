extends Area2D

func _ready() -> void:
	self.input_pickable = false
	
func _on_lid_removed() -> void:
	self.input_pickable = true

func _input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if (event is InputEventMouseButton or event is InputEventScreenTouch) and not event.pressed:
		print($".", " clicked")
		
		var label := get_node_or_null("../click_lable")
		if label != null:
			var tween := create_tween()
			tween.tween_property(label, "modulate:a", 0, 1)
			tween.tween_callback(label.queue_free)

		var cam := $"../../../cam"
		var camTween := create_tween().set_parallel()
		
		camTween.tween_property(
			cam, "position",
			$collider.position,
			1,
		)
		camTween.tween_property(cam, "zoom", Vector2(3, 3), 1)
		camTween.tween_callback(func():
			var chopsticks := $"../../../HUD_layer/HUD/chopsticks"
			chopsticks.disabled = false
			chopsticks.show()
		)
