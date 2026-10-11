extends Area2D

@onready var cam := $"../../../cam"
@onready var foods := [ $"food-0", $"food-1", $"food-2", $"food-3" ]
@onready var text := $"text"

func _ready() -> void:
	self.input_pickable = false
	text.modulate.a = 0
	text.hide()
	
func _on_lid_removed() -> void:
	self.input_pickable = true

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if (event is InputEventMouseButton or event is InputEventScreenTouch) and not event.pressed:
		print($".".name, " clicked")

		var label := get_node_or_null("../click_lable")
		if label != null:
			var tween := create_tween()
			tween.tween_property(label, "modulate:a", 0, 1)
			tween.tween_callback(label.queue_free)
		
		var zoomTween := create_tween().set_parallel()
		
		zoomTween.tween_property(
			cam, "position",
			$collider.position,
			1,
		)
		zoomTween.tween_property(cam, "zoom", Vector2(3, 3), 1)
		
		for food in foods:
			zoomTween.tween_property(food, "modulate:a", 0, 1)
		
		zoomTween.tween_property(text, "modulate:a", 1, 2)
		
		zoomTween.tween_callback(func():
			var chopsticks := $"../../../HUD_layer/HUD/chopsticks"
			chopsticks.disabled = false
			chopsticks.show()
			text.show()
		)
