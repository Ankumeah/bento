extends TextureButton

func _ready() -> void:
	self.disabled = true
	self.hide()

func _on_button_up() -> void:
	var cam := $"../../../cam"
	var tween := create_tween().set_parallel()
	
	tween.tween_property(
		cam, "position",
		get_viewport().get_visible_rect().size / 2,
		1,
	)
	tween.tween_property(cam, "zoom", Vector2.ONE, 1)
	tween.tween_callback(func():
		
		_ready()
	)
