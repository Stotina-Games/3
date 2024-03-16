class_name TopDownCharacterDefinition
extends Resource

enum CharacterType {
	NPC = 0,
	ENEMY = 1,
	PLAYER = 2,
}

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

enum CharacterDirection {UP, DOWN, LEFT, RIGHT}

@export var name: StringName
@export var type: CharacterType = CharacterType.NPC
@export var icon: Texture2D
@export var max_speed: int = 200

@export var move_target: Vector2 = Vector2.ZERO;

@export var previous_direction: CharacterDirection = CharacterDirection.DOWN
@export var previous_action: CharacterAction = CharacterAction.IDLE

@export var spritesheet_body: Texture2D
@export var spritesheet_head: Texture2D
@export var spritesheet_hair: Texture2D
@export var spritesheet_shirt: Texture2D
@export var spritesheet_pants: Texture2D
@export var spritesheet_shoes: Texture2D
@export var spritesheet_belt: Texture2D
@export var spritesheet_item: Texture2D

@export var spritesheet_sector_size: Vector2 = Vector2(64, 64)
@export var spritesheet_sector_offset: Vector2 = Vector2.ZERO

@export var animation_coordinates_IDLE_UP: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 8), 1);
@export var animation_coordinates_IDLE_LEFT: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 9), 1);
@export var animation_coordinates_IDLE_DOWN: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 10), 1);
@export var animation_coordinates_IDLE_RIGHT: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 11), 1);
@export var animation_coordinates_CAST_UP: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 0), 7);
@export var animation_coordinates_CAST_LEFT: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 1), 7);
@export var animation_coordinates_CAST_DOWN: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 2), 7);
@export var animation_coordinates_CAST_RIGHT: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 3), 7);
@export var animation_coordinates_TRUST_UP: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 4), 8);
@export var animation_coordinates_TRUST_LEFT: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 5), 8);
@export var animation_coordinates_TRUST_DOWN: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 6), 8);
@export var animation_coordinates_TRUST_RIGHT: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 7), 8);
@export var animation_coordinates_WALK_UP: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 8), 9);
@export var animation_coordinates_WALK_LEFT: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 9), 9);
@export var animation_coordinates_WALK_DOWN: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 10), 9);
@export var animation_coordinates_WALK_RIGHT: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 11), 9);
@export var animation_coordinates_SLASH_UP: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 12), 6);
@export var animation_coordinates_SLASH_LEFT: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 13), 6);
@export var animation_coordinates_SLASH_DOWN: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 14), 6);
@export var animation_coordinates_SLASH_RIGHT: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 15), 6);
@export var animation_coordinates_SHOOT_UP: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 16), 13);
@export var animation_coordinates_SHOOT_LEFT: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 17), 13);
@export var animation_coordinates_SHOOT_DOWN: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 18), 13);
@export var animation_coordinates_SHOOT_RIGHT: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 19), 13);
@export var animation_coordinates_DIE_DOWN: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(0, 20), 6);
@export var animation_coordinates_LAY_ON_GROUND_DOWN: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_sequential(Vector2(5, 20), 1);
@export var animation_coordinates_GET_UP_DOWN: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_non_sequential(Vector2(0, 20), [5, 4, 5, 4, 3, 2, 1, 0]);
@export var animation_coordinates_INTERACT_UP: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_non_sequential(Vector2(0, 4), [0, 1, 2, 4, 4, 2, 4, 2, 3, 1]);
@export var animation_coordinates_INTERACT_LEFT: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_non_sequential(Vector2(0, 5), [0, 1, 2, 4, 4, 2, 4, 2, 3, 1]);
@export var animation_coordinates_INTERACT_DOWN: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_non_sequential(Vector2(0, 6), [0, 1, 2, 4, 4, 2, 4, 2, 3, 1]);
@export var animation_coordinates_INTERACT_RIGHT: Array[Vector2] = TopDownCharacterDefinition.sprite_coordinates_non_sequential(Vector2(0, 7), [0, 1, 2, 4, 4, 2, 4, 2, 3, 1]);

static func sprite_coordinates_sequential(from_coordinate: Vector2, count: int):
	var coordinates: Array[Vector2] = [from_coordinate];
	for n in range(1, count):
		coordinates.push_back(Vector2(from_coordinate.x + n, from_coordinate.y))
	return coordinates

static func sprite_coordinates_non_sequential(from_coordinate: Vector2, x_offsets: Array[int]):
	var coordinates: Array[Vector2] = [];
	for n in x_offsets:
		coordinates.push_back(Vector2(from_coordinate.x + n, from_coordinate.y))
	return coordinates
