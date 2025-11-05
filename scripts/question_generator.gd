extends Node

var operations = ["+", "-", "*", "/"]

func _init():
	randomize()
	
func generate_question() -> Dictionary:
	var num1 = randi() % 6 + 1
	var op = operations[randi() % operations.size()]
	var num2 = 1
	var answer = 0

	match op:
		"+": # Soma: normal (1..6)
			num2 = randi() % 6 + 1
			answer = num1 + num2

		"-": # Subtração: garantir num2 < num1 (se possível) para resultado não-negativo
			if num1 > 1:
				num2 = randi() % (num1 - 1) + 1
			else:
				num2 = 1
			answer = num1 - num2

		"*": # Multiplicação: normal (1..6)
			num2 = randi() % 6 + 1
			answer = num1 * num2

		"/": # Divisão: aplicar regras para divisão exata ou casos permitidos
			# Regras: múltiplos/divisores do primeiro número, ou iguais, ou dividir por 1.
			# Se num1 for ímpar -> divide por ele mesmo ou por 1
			if num1 == 1:
				num2 = 1
			elif num1 % 2 == 1:
				# ímpar: escolha entre 1 ou ele mesmo
				if randi() % 2 == 0:
					num2 = 1
				else:
					num2 = num1
			else:
				# par: escolhe um divisor de num1 (divisão exata)
				var divs = []
				for i in range(1, num1 + 1):
					if num1 % i == 0:
						divs.append(i)
				num2 = divs[randi() % divs.size()]
			answer = float(num1) / float(num2)

	return {
		"num1": num1,
		"op": op,
		"num2": num2,
		"answer": answer
	}
