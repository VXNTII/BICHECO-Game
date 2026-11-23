extends Area2D

@export var player: CharacterBody2D

var spawn_position: Vector2

func _ready():
	spawn_position = player.global_position
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body == player:
		player.set_deferred("global_position", spawn_position)
		player.velocity = Vector2.ZERO
