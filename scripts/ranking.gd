extends Control

@onready var score_container = $ScoreContainer

func _ready():
	for child in score_container.get_children():
		child.queue_free()
	
	for i in range(Global.high_scores.size()):
		var data = Global.high_scores[i]
		
		var label = Label.new()
		label.text = str(i + 1) + ". " + data["name"] + " - " + str(data["score"]) + " Pts"
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		label.add_theme_font_size_override("font_size", 42)
		
		score_container.add_child(label)


func _on_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tela_inicial.tscn")
