extends RichTextLabel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#
func _on_Timer_timeout():
	
	set_visible_characters(get_visible_characters()+1)
	

