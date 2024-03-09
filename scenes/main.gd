extends Node2D

@onready var showcase_player: _BaseCharacter = $ShowcasePlayer

func change_player_looks():
	showcase_player.select_random_looks()
	showcase_player.init_all_animated_sprites()

func _ready() -> void:
	change_player_looks()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var mouse_position = get_global_mouse_position();
	var player_position = showcase_player.global_position;
	var direction = (mouse_position - player_position).normalized()
	showcase_player.move_to(mouse_position - (direction * 50))
	pass


func _on_new_game_pressed() -> void:
	change_player_looks()
