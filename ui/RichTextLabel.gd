extends RichTextLabel

# Declare member variables here. Examples:
var dialog = ["Bonjour et Bienvenue dans Campus Fantasy !", "Ce jeu a pour but de vous faire découvrir le campus de l'Université de Lausanne (on s'est quand même permis quelques libertés, il n'y a pas de goblins ou d'orcs sur le campus par exemple).", "L'emplacement des bâtiments a été le plus respectés possible et, dans la mesure du possible, leurs contenus aussi.", "Vous pouvez vous déplacer avec les flèches ou W,A,S,D.", "Pour attaquer utilisez les touches J (pour l'épée) et K (pour les javelots).", "Votre mission, si vous l'acceptez, va être de retrouver les différents objets nécessaires à votre inscriptions éparpillés partout sur le campus.", "(Ah! On a oublié de préciser mais vous avez qu'une vie et pas de continue possible, il faudra survire du début à la fin pour finir le jeu!)", "Bonne découverte, bonne chance et bonne études !"]
var page = 0 

onready var beep = $beep
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#set_bbcode(dialog[page])
	#set_visible_characters(0)
	#set_process_input(true)
	#if get_visible_characters() > get_total_character_count():
	#	if page < dialog.size()-1:
	#		page += 1
	#		set_bbcode(dialog[page])
	#		set_visible_characters(0)
			
	#else:
	#	set_visible_characters(get_total_character_count())		
			
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_beep_finished():
	
	pass # Replace with function body.


func _on_affichageBBcode_timeout():
	set_visible_characters(get_visible_characters()+1)
	