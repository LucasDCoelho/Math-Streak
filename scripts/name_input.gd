extends Control

@onready var line_edit = $VBoxContainer/LineEdit

func _on_button_pressed() -> void:
	var nome = line_edit.text.strip_edges().to_upper()
	
	if nome == "":
		nome = "AAA"
		
	Global.player_name = nome
	
	get_tree().change_scene_to_file("res://scenes/jogo.tscn")
