class_name TopDownCharacterBase
extends Resource

enum CharacterType {ENEMY, NPC, PLAYER}
enum CharacterDirection {UP, DOWN, LEFT, RIGHT}
enum CharacterAction {
	UNKNOWN,
	IDLE,
	CAST,
	TRUST,
	WALK,
	SLASH,
	SHOOT,
	DIE,
	LAY_ON_GROUND,
	GET_UP,
	INTERACT,
}

@export var name: StringName
@export var type: CharacterType = CharacterType.NPC
@export var icon: Texture2D
@export var max_speed: float = 200
@export var acceleration: float = 100
@export var health: float = 100
@export var health_regen: float = 0.1

@export var move_target: Vector2 = Vector2.ZERO;

@export var current_direction: CharacterDirection = CharacterDirection.DOWN
@export var current_action: CharacterAction = CharacterAction.IDLE
