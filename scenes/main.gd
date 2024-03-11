extends Node2D

@onready var showcase_player: _BaseCharacter = $ShowcasePlayer

@onready var showcase_enemy_1: _BaseAiCharacter = $ShowcaseEnemy_1
@onready var showcase_enemy_2: _BaseAiCharacter = $ShowcaseEnemy_2
@onready var showcase_enemy_3: _BaseAiCharacter = $ShowcaseEnemy_3

const MINOTAUR = preload ("res://assets/characters/minotaur.png")
const SKELETON = preload ("res://assets/characters/skeleton.png")
const FLYING_WOLFMAN = preload ("res://assets/characters/flying-wolfman.png")

func change_player_looks():
	showcase_player.select_random_looks()
	showcase_player.init_all_animated_sprites()

func setup_enemies():
	showcase_enemy_1.max_speed = 140
	showcase_enemy_1.selected_spritesheet_body = MINOTAUR
	showcase_enemy_1.selected_spritesheet_weapon = _BaseCharacter.SPRITESHEETS.WEAPON.FLAIL
	showcase_enemy_1.add_action_target(showcase_player, _BaseCharacter.CHARACTER_ACTION.SLASH, 1, 75)
	showcase_enemy_1.init_all_animated_sprites()

	showcase_enemy_2.max_speed = 170
	showcase_enemy_2.selected_spritesheet_body = SKELETON
	showcase_enemy_2.selected_spritesheet_weapon = _BaseCharacter.SPRITESHEETS.WEAPON.SLINGSHOT
	showcase_enemy_2.add_action_target(showcase_player, _BaseCharacter.CHARACTER_ACTION.SHOOT, 1, 150)
	showcase_enemy_2.init_all_animated_sprites()

	showcase_enemy_3.max_speed = 170
	showcase_enemy_3.selected_spritesheet_body = FLYING_WOLFMAN
	showcase_enemy_3.selected_spritesheet_weapon = _BaseCharacter.SPRITESHEETS.WEAPON.STAFF_S
	showcase_enemy_3.add_action_target(showcase_player, _BaseCharacter.CHARACTER_ACTION.INTERACT, 1, 180)
	showcase_enemy_3.init_all_animated_sprites()

func _ready() -> void:
	change_player_looks()
	setup_enemies()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var mouse_position = get_global_mouse_position();
	var player_position = showcase_player.global_position;
	var direction = (mouse_position - player_position).normalized()
	showcase_player.move_to(mouse_position - (direction * 50))
	pass

func _on_new_game_pressed() -> void:
	change_player_looks()
