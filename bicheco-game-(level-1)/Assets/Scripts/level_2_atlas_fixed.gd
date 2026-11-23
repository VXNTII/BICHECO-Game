
extends Node2D

func _on_level_3_portal_body_entered(body: Node2D) -> void:
	print("Portal touched by: ", body.name)

	if body.name == "Player":
		print("LEVEL 2 COMPLETE!")
