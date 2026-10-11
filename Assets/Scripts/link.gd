extends RichTextLabel
	
func _on_meta_clicked(meta):
	print(meta)
	OS.shell_open(str(meta))
