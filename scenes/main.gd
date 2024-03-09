extends Node2D

@onready var showcase_player: _BaseCharacter = $ShowcasePlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var mouse_position = get_global_mouse_position();
	var player_position = showcase_player.global_position;
	var direction = (mouse_position - player_position).normalized()
	showcase_player.move_to(mouse_position - (direction * 50))
	pass
