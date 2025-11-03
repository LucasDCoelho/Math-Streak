extends Control

@onready var score_label = $ScoreLabel
@onready var dice1 = $DiceArea/Dice1
@onready var dice2 = $DiceArea/Dice2
@onready var op_label = $DiceArea/OperationLabel
@onready var answer_left = $AnswersArea/AnswerLeft/Label
@onready var answer_up = $AnswersArea/AnswerUp/Label
@onready var answer_right = $AnswersArea/AnswerRight/Label

var dice_textures = []
var score = 0
var current_answer = 0
var correct_index = 0
var generator := preload("res://scripts/question_generator.gd").new()

func _ready():
	randomize()
	for i in range(1, 7):
		dice_textures.append(load("res://assets/Dice/Dice/diceRed%d.png" % i))
	_update_score()
	_generate_question()
	set_process_input(true)

func _generate_question():
	var q = generator.generate_question()
	var num1 = q.num1
	var num2 = q.num2
	var op = q.op
	var result = q.answer
	
	dice1.texture = dice_textures[num1 - 1]
	dice2.texture = dice_textures[num2 - 1]
	op_label.text = changeOp(op)

	correct_index = randi() % 3

	var wrong1 = result + (randi() % 3 + 1)
	var wrong2 = result - (randi() % 3 + 1)
	if wrong2 < 0:
		wrong2 = abs(wrong2) + 1

	var answers = [wrong1, wrong2]
	answers.insert(correct_index, result)

	answer_left.text = str(answers[0])
	answer_up.text = str(answers[1])
	answer_right.text = str(answers[2])

	current_answer = result

func changeOp(op) -> String:
	match op:
		"/":
			op = "÷"
		"*":
			op = "x"
	return op;

func _input(event):
	if event.is_action_pressed("ui_left"):
		_check_answer(0)
	elif event.is_action_pressed("ui_up"):
		_check_answer(1)
	elif event.is_action_pressed("ui_right"):
		_check_answer(2)

func _check_answer(index):
	if index == correct_index:
		_on_correct()
	else:
		_on_wrong()

func _on_correct():
	score += 1
	_update_score()
	_generate_question()

func _on_wrong():
	var defeat_scene = load("res://scenes/derrota.tscn")
	get_tree().change_scene_to_packed(defeat_scene)

func _update_score():
	score_label.text = "Pontuação: " + str(score)
