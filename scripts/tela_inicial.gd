extends Control



func _on_play_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/jogo.tscn")

func _on_quit_game_pressed() -> void:
	get_tree().quit()
