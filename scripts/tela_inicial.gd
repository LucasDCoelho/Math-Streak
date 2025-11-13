extends Control



func _on_play_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/name_input.tscn")

func _on_quit_game_pressed() -> void:
	get_tree().quit()

func _on_ranking_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ranking.tscn")
