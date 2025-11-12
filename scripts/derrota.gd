extends Node

@onready var my_score = $"."
@onready var local_socre = $Score
var score = 0

func _ready():
	var final_score = Global.current_score
	local_socre.text = "Pontuação: " + str(final_score)
	Global.current_score = 0
	pass


func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tela_inicial.tscn")
	


#func _update_score():
#	local_socre.text = "Pontuação: " + str(score)
