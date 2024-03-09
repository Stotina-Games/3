class_name _BaseCharacter
extends CharacterBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var move_target: Vector2 = Vector2.ZERO;

var max_speed = 300

static var SPRITESHEETS = {
	BODY = {
		PLAYER_BODY_LIGHT = preload ("res://assets/characters/player/player-body-light.png"),
		PLAYER_BODY_AMBER = preload ("res://assets/characters/player/player-body-amber.png"),
		PLAYER_BODY_OLIVE = preload ("res://assets/characters/player/player-body-olive.png"),
		PLAYER_BODY_BLACK = preload ("res://assets/characters/player/player-body-black.png"),
	},

	WOUND = {
		NONE = null,
		PLAYER_WOUND_ARM = preload ("res://assets/characters/player/wounds/player-wound-arm.png"),
		PLAYER_WOUND_EYE = preload ("res://assets/characters/player/wounds/player-wound-eye.png"),
		PLAYER_WOUND_MOUTH = preload ("res://assets/characters/player/wounds/player-wound-mouth.png"),
		PLAYER_WOUND_RIBS = preload ("res://assets/characters/player/wounds/player-wound-ribs.png"),
	},

	BELT = {
		NONE = null,
		PLAYER_CLOTHES_BELT_BLACK = preload ("res://assets/characters/player/clothes/player-clothes-belt-black.png"),
		PLAYER_CLOTHES_BELT_BROWN = preload ("res://assets/characters/player/clothes/player-clothes-belt-brown.png"),
		PLAYER_CLOTHES_BELT_TAN = preload ("res://assets/characters/player/clothes/player-clothes-belt-tan.png"),
		PLAYER_CLOTHES_BELT_WHITE = preload ("res://assets/characters/player/clothes/player-clothes-belt-white.png"),
		PLAYER_CLOTHES_BELT_SASH_BLACK = preload ("res://assets/characters/player/clothes/player-clothes-belt-sash-black.png"),
		PLAYER_CLOTHES_BELT_SASH_GREEN = preload ("res://assets/characters/player/clothes/player-clothes-belt-sash-green.png"),
		PLAYER_CLOTHES_BELT_SASH_ORANGE = preload ("res://assets/characters/player/clothes/player-clothes-belt-sash-orange.png"),
		PLAYER_CLOTHES_BELT_SASH_RED = preload ("res://assets/characters/player/clothes/player-clothes-belt-sash-red.png"),
		PLAYER_CLOTHES_BELT_SASH_WHITE = preload ("res://assets/characters/player/clothes/player-clothes-belt-sash-white.png"),
		PLAYER_CLOTHES_BELT_SASH_YELLOW = preload ("res://assets/characters/player/clothes/player-clothes-belt-sash-yellow.png"),
	},

	PANTS = {
		NONE = null,
		PLAYER_CLOTHES_PANTS_BLACK = preload ("res://assets/characters/player/clothes/player-clothes-pants-black.png"),
		PLAYER_CLOTHES_PANTS_BLUE = preload ("res://assets/characters/player/clothes/player-clothes-pants-blue.png"),
		PLAYER_CLOTHES_PANTS_BROWN = preload ("res://assets/characters/player/clothes/player-clothes-pants-brown.png"),
		PLAYER_CLOTHES_PANTS_GRAY = preload ("res://assets/characters/player/clothes/player-clothes-pants-gray.png"),
		PLAYER_CLOTHES_PANTS_GREEN = preload ("res://assets/characters/player/clothes/player-clothes-pants-green.png"),
		PLAYER_CLOTHES_PANTS_RED = preload ("res://assets/characters/player/clothes/player-clothes-pants-red.png"),
		PLAYER_CLOTHES_PANTS_WHITE = preload ("res://assets/characters/player/clothes/player-clothes-pants-white.png"),
		PLAYER_CLOTHES_PANTS_YELLOW = preload ("res://assets/characters/player/clothes/player-clothes-pants-yellow.png"),
	},

	SHIRT = {
		NONE = null,
		PLAYER_CLOTHES_SHIRT_LONGSLEEVE_BLACK = preload ("res://assets/characters/player/clothes/player-clothes-shirt-longsleeve-black.png"),
		PLAYER_CLOTHES_SHIRT_LONGSLEEVE_BLUE = preload ("res://assets/characters/player/clothes/player-clothes-shirt-longsleeve-blue.png"),
		PLAYER_CLOTHES_SHIRT_LONGSLEEVE_BROWN = preload ("res://assets/characters/player/clothes/player-clothes-shirt-longsleeve-brown.png"),
		PLAYER_CLOTHES_SHIRT_LONGSLEEVE_GRAY = preload ("res://assets/characters/player/clothes/player-clothes-shirt-longsleeve-gray.png"),
		PLAYER_CLOTHES_SHIRT_LONGSLEEVE_GREEN = preload ("res://assets/characters/player/clothes/player-clothes-shirt-longsleeve-green.png"),
		PLAYER_CLOTHES_SHIRT_LONGSLEEVE_RED = preload ("res://assets/characters/player/clothes/player-clothes-shirt-longsleeve-red.png"),
		PLAYER_CLOTHES_SHIRT_LONGSLEEVE_WHITE = preload ("res://assets/characters/player/clothes/player-clothes-shirt-longsleeve-white.png"),
		PLAYER_CLOTHES_SHIRT_LONGSLEEVE_YELLOW = preload ("res://assets/characters/player/clothes/player-clothes-shirt-longsleeve-yellow.png"),
	},

	HAIR = {
		NONE = null,
		PLAYER_HAIR_BALDING_BLACK = preload ("res://assets/characters/player/hair/player-hair-balding-black.png"),
		PLAYER_HAIR_BALDING_BLONDE = preload ("res://assets/characters/player/hair/player-hair-balding-blonde.png"),
		PLAYER_HAIR_BALDING_BROWN = preload ("res://assets/characters/player/hair/player-hair-balding-brown.png"),
		PLAYER_HAIR_BALDING_REDHEAD = preload ("res://assets/characters/player/hair/player-hair-balding-redhead.png"),
		PLAYER_HAIR_BALDING_WHITE = preload ("res://assets/characters/player/hair/player-hair-balding-white.png"),
		PLAYER_HAIR_BOB_BLACK = preload ("res://assets/characters/player/hair/player-hair-bob-black.png"),
		PLAYER_HAIR_BOB_BLONDE = preload ("res://assets/characters/player/hair/player-hair-bob-blonde.png"),
		PLAYER_HAIR_BOB_BROWN = preload ("res://assets/characters/player/hair/player-hair-bob-brown.png"),
		PLAYER_HAIR_BOB_REDHEAD = preload ("res://assets/characters/player/hair/player-hair-bob-redhead.png"),
		PLAYER_HAIR_BOB_WHITE = preload ("res://assets/characters/player/hair/player-hair-bob-white.png"),
		PLAYER_HAIR_CURLY_BLACK = preload ("res://assets/characters/player/hair/player-hair-curly-black.png"),
		PLAYER_HAIR_CURLY_BLONDE = preload ("res://assets/characters/player/hair/player-hair-curly-blonde.png"),
		PLAYER_HAIR_CURLY_BROWN = preload ("res://assets/characters/player/hair/player-hair-curly-brown.png"),
		PLAYER_HAIR_CURLY_REDHEAD = preload ("res://assets/characters/player/hair/player-hair-curly-redhead.png"),
		PLAYER_HAIR_CURLY_WHITE = preload ("res://assets/characters/player/hair/player-hair-curly-white.png"),
		PLAYER_HAIR_JEWFRO_BLACK = preload ("res://assets/characters/player/hair/player-hair-jewfro-black.png"),
		PLAYER_HAIR_JEWFRO_BLONDE = preload ("res://assets/characters/player/hair/player-hair-jewfro-blonde.png"),
		PLAYER_HAIR_JEWFRO_BROWN = preload ("res://assets/characters/player/hair/player-hair-jewfro-brown.png"),
		PLAYER_HAIR_JEWFRO_REDHEAD = preload ("res://assets/characters/player/hair/player-hair-jewfro-redhead.png"),
		PLAYER_HAIR_JEWFRO_WHITE = preload ("res://assets/characters/player/hair/player-hair-jewfro-white.png"),
		PLAYER_HAIR_SPIKED_BLACK = preload ("res://assets/characters/player/hair/player-hair-spiked-black.png"),
		PLAYER_HAIR_SPIKED_BLONDE = preload ("res://assets/characters/player/hair/player-hair-spiked-blonde.png"),
		PLAYER_HAIR_SPIKED_BROWN = preload ("res://assets/characters/player/hair/player-hair-spiked-brown.png"),
		PLAYER_HAIR_SPIKED_LIBERTY_BLACK = preload ("res://assets/characters/player/hair/player-hair-spiked-liberty-black.png"),
		PLAYER_HAIR_SPIKED_LIBERTY_BLONDE = preload ("res://assets/characters/player/hair/player-hair-spiked-liberty-blonde.png"),
		PLAYER_HAIR_SPIKED_LIBERTY_BROWN = preload ("res://assets/characters/player/hair/player-hair-spiked-liberty-brown.png"),
		PLAYER_HAIR_SPIKED_LIBERTY_REDHEAD = preload ("res://assets/characters/player/hair/player-hair-spiked-liberty-redhead.png"),
		PLAYER_HAIR_SPIKED_LIBERTY_WHITE = preload ("res://assets/characters/player/hair/player-hair-spiked-liberty-white.png"),
		PLAYER_HAIR_SPIKED_REDHEAD = preload ("res://assets/characters/player/hair/player-hair-spiked-redhead.png"),
		PLAYER_HAIR_SPIKED_WHITE = preload ("res://assets/characters/player/hair/player-hair-spiked-white.png"),
	},

	WEAPON = {
		NONE = null,
		CANE = preload ("res://assets/characters/weapons/cane.png"),
		CLUB = preload ("res://assets/characters/weapons/club.png"),
		CROSSBOW = preload ("res://assets/characters/weapons/crossbow.png"),
		DRAGON_SPEAR = preload ("res://assets/characters/weapons/dragon-spear.png"),
		FLAIL = preload ("res://assets/characters/weapons/flail.png"),
		GLOWSWORD_BLUE = preload ("res://assets/characters/weapons/glowsword-blue.png"),
		GLOWSWORD_RED = preload ("res://assets/characters/weapons/glowsword-red.png"),
		HALBERD = preload ("res://assets/characters/weapons/halberd.png"),
		LONGSWORD_2 = preload ("res://assets/characters/weapons/longsword2.png"),
		LONGSWORD = preload ("res://assets/characters/weapons/longsword.png"),
		MACE = preload ("res://assets/characters/weapons/mace.png"),
		RAPIER = preload ("res://assets/characters/weapons/rapier.png"),
		SABER = preload ("res://assets/characters/weapons/saber.png"),
		SCIMITAR = preload ("res://assets/characters/weapons/scimitar.png"),
		SCYTHE = preload ("res://assets/characters/weapons/scythe.png"),
		SLINGSHOT = preload ("res://assets/characters/weapons/slingshot.png"),
		SPEAR = preload ("res://assets/characters/weapons/spear.png"),
		STAFF_DIAMOND = preload ("res://assets/characters/weapons/staff-diamond.png"),
		STAFF_GNARLED = preload ("res://assets/characters/weapons/staff-gnarled.png"),
		STAFF_LOOP = preload ("res://assets/characters/weapons/staff-loop.png"),
		STAFF_S = preload ("res://assets/characters/weapons/staff-S.png"),
		STAFF_SIMPLE = preload ("res://assets/characters/weapons/staff-simple.png"),
		TRIDENT = preload ("res://assets/characters/weapons/trident.png"),
	}
}

func spriteCoordinatesSequential(size: Vector2, from_coordinate: Vector2, count: int, offset=Vector2.ZERO):
	var coordinates: Array[Vector2] = [from_coordinate];
	for n in range(1, count):
		coordinates.push_back(Vector2(from_coordinate.x + n, from_coordinate.y))
	return {size = size, coordinates = coordinates, offset = offset}

func spriteCoordinatesNonSequential(size: Vector2, from_coordinate: Vector2, x_offsets: Array[int], offset=Vector2.ZERO):
	var coordinates: Array[Vector2] = [];
	for n in x_offsets:
		coordinates.push_back(Vector2(from_coordinate.x + n, from_coordinate.y))
	return {size = size, coordinates = coordinates, offset = offset}

var ANIMATION_SPRITESHEET_COORDINATES = {
	IDLE_UP = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 8), 1),
	IDLE_LEFT = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 9), 1),
	IDLE_DOWN = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 10), 1),
	IDLE_RIGHT = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 11), 1),

	CAST_UP = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 0), 7),
	CAST_LEFT = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 1), 7),
	CAST_DOWN = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 2), 7),
	CAST_RIGHT = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 3), 7),

	TRUST_UP = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 4), 8),
	TRUST_LEFT = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 5), 8),
	TRUST_DOWN = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 6), 8),
	TRUST_RIGHT = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 7), 8),

	WALK_UP = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 8), 9),
	WALK_LEFT = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 9), 9),
	WALK_DOWN = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 10), 9),
	WALK_RIGHT = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 11), 9),

	SLASH_UP = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 12), 6),
	SLASH_LEFT = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 13), 6),
	SLASH_DOWN = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 14), 6),
	SLASH_RIGHT = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 15), 6),

	SHOOT_UP = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 16), 13),
	SHOOT_LEFT = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 17), 13),
	SHOOT_DOWN = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 18), 13),
	SHOOT_RIGHT = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 19), 13),

	DIE_DOWN = spriteCoordinatesSequential(Vector2(64, 64), Vector2(0, 20), 6),

	LAY_ON_GROUND_DOWN = spriteCoordinatesSequential(Vector2(64, 64), Vector2(5, 20), 1),

	GET_UP_DOWN = spriteCoordinatesNonSequential(Vector2(64, 64), Vector2(0, 20), [5, 4, 5, 4, 3, 2, 1, 0]),

	INTERACT_UP = spriteCoordinatesNonSequential(Vector2(64, 64), Vector2(0, 4), [0, 1, 2, 4, 4, 2, 4, 2, 3, 1]),
	INTERACT_LEFT = spriteCoordinatesNonSequential(Vector2(64, 64), Vector2(0, 5), [0, 1, 2, 4, 4, 2, 4, 2, 3, 1]),
	INTERACT_DOWN = spriteCoordinatesNonSequential(Vector2(64, 64), Vector2(0, 6), [0, 1, 2, 4, 4, 2, 4, 2, 3, 1]),
	INTERACT_RIGHT = spriteCoordinatesNonSequential(Vector2(64, 64), Vector2(0, 7), [0, 1, 2, 4, 4, 2, 4, 2, 3, 1]),
}

@onready var rng = RandomNumberGenerator.new();

@onready var body_animated_sprite_2d: AnimatedSprite2D = $CompositeAnimatedSprite/Body_AnimatedSprite2D
@onready var hair_animated_sprite_2d: AnimatedSprite2D = $CompositeAnimatedSprite/Hair_AnimatedSprite2D
@onready var shirt_animated_sprite_2d: AnimatedSprite2D = $CompositeAnimatedSprite/Shirt_AnimatedSprite2D
@onready var pants_animated_sprite_2d: AnimatedSprite2D = $CompositeAnimatedSprite/Pants_AnimatedSprite2D
@onready var belt_animated_sprite_2d: AnimatedSprite2D = $CompositeAnimatedSprite/Belt_AnimatedSprite2D
@onready var wound_animated_sprite_2d: AnimatedSprite2D = $CompositeAnimatedSprite/Wound_AnimatedSprite2D
@onready var weapon_animated_sprite_2d: AnimatedSprite2D = $CompositeAnimatedSprite/Weapon_AnimatedSprite2D

var SELECTED_SPRITESHEETS = {
	BODY = SPRITESHEETS.BODY.PLAYER_BODY_LIGHT,
	WOUND = null,
	BELT = null,
	PANTS = null,
	SHIRT = null,
	HAIR = null,
	WEAPON = null,
}

func select_random_looks():
	var selected_spritesheets = {}

	var possible_Bodies: Array = SPRITESHEETS.BODY.keys()
	var random_BODY = possible_Bodies[rng.randi_range(0, possible_Bodies.size()-1)]
	selected_spritesheets.BODY = SPRITESHEETS.BODY.get(random_BODY)

	var possible_Wounds: Array = SPRITESHEETS.WOUND.keys()
	var random_WOUND = possible_Wounds[rng.randi_range(0, possible_Wounds.size()-1)]
	selected_spritesheets.WOUND = SPRITESHEETS.WOUND.get(random_WOUND)

	var possible_Belts: Array = SPRITESHEETS.BELT.keys()
	var random_BELT = possible_Belts[rng.randi_range(0, possible_Belts.size()-1)]
	selected_spritesheets.BELT = SPRITESHEETS.BELT.get(random_BELT)

	var possible_Pants: Array = SPRITESHEETS.PANTS.keys()
	var random_PANTS = possible_Pants[rng.randi_range(0, possible_Pants.size()-1)]
	selected_spritesheets.PANTS = SPRITESHEETS.PANTS.get(random_PANTS)

	var possible_Shirts: Array = SPRITESHEETS.SHIRT.keys()
	var random_SHIRT = possible_Shirts[rng.randi_range(0, possible_Shirts.size()-1)]
	selected_spritesheets.SHIRT = SPRITESHEETS.SHIRT.get(random_SHIRT)

	var possible_Hairs: Array = SPRITESHEETS.HAIR.keys()
	var random_HAIR = possible_Hairs[rng.randi_range(0, possible_Hairs.size()-1)]
	selected_spritesheets.HAIR = SPRITESHEETS.HAIR.get(random_HAIR)

	var possible_Weapons: Array = SPRITESHEETS.WEAPON.keys()
	var random_WEAPON = possible_Weapons[rng.randi_range(0, possible_Weapons.size()-1)]
	selected_spritesheets.WEAPON = SPRITESHEETS.WEAPON.get(random_WEAPON)

	SELECTED_SPRITESHEETS = selected_spritesheets;

var previous_direction = "RIGHT"
var previous_action = "IDLE"
func get_current_state(velocity_of_character, attempting_to_initiate_action, forced_action=""):
	var direction = previous_direction;
	var action = previous_action;

	var absVelocity = velocity_of_character.abs();
	if absVelocity.x > absVelocity.y:
		if velocity_of_character.x > 0:
			direction = "RIGHT"
			action = "WALK"
		elif velocity_of_character.x < 0:
			direction = "LEFT"
			action = "WALK"
	elif absVelocity.x < absVelocity.y:
		if velocity_of_character.y > 0:
			direction = "DOWN"
			action = "WALK"
		elif velocity_of_character.y < 0:
			direction = "UP"
			action = "WALK"
	else:
		direction = previous_direction;
		action = "IDLE"

	var is_able_to_initiate_action = previous_direction == 'IDLE' or previous_direction == "WALK";

	if is_able_to_initiate_action:
		if (attempting_to_initiate_action == 'CAST'):
			action = 'CAST'
		elif (attempting_to_initiate_action == 'TRUST'):
			action = 'TRUST'
		elif (attempting_to_initiate_action == 'SLASH'):
			action = 'SLASH'
		elif (attempting_to_initiate_action == 'SHOOT'):
			action = 'SHOOT'
		elif (attempting_to_initiate_action == 'INTERACT'):
			action = 'INTERACT'

	if forced_action != "":
		action = forced_action

	if action == 'DIE'||action == 'LAY_ON_GROUND'||action == 'GET_UP':
		direction = "DOWN"

	if previous_action != action or previous_direction != direction:
		print("Action Change: " + action + "_" + direction + " ---> " + str(absVelocity));

	previous_action = action
	previous_direction = direction

	return {action = action, direction = direction, animation = action + "_" + direction}

func init_all_animated_sprites():
	init_animated_sprite(body_animated_sprite_2d, SELECTED_SPRITESHEETS.BODY, ANIMATION_SPRITESHEET_COORDINATES)
	init_animated_sprite(wound_animated_sprite_2d, SELECTED_SPRITESHEETS.WOUND, ANIMATION_SPRITESHEET_COORDINATES)
	init_animated_sprite(belt_animated_sprite_2d, SELECTED_SPRITESHEETS.BELT, ANIMATION_SPRITESHEET_COORDINATES)
	init_animated_sprite(pants_animated_sprite_2d, SELECTED_SPRITESHEETS.PANTS, ANIMATION_SPRITESHEET_COORDINATES)
	init_animated_sprite(shirt_animated_sprite_2d, SELECTED_SPRITESHEETS.SHIRT, ANIMATION_SPRITESHEET_COORDINATES)
	init_animated_sprite(hair_animated_sprite_2d, SELECTED_SPRITESHEETS.HAIR, ANIMATION_SPRITESHEET_COORDINATES)
	init_animated_sprite(weapon_animated_sprite_2d, SELECTED_SPRITESHEETS.WEAPON, ANIMATION_SPRITESHEET_COORDINATES)
	play_animation('WALK_LEFT')

func init_animated_sprite(animated_sprite: AnimatedSprite2D, sprite_sheet: Texture2D, animations_coordinates: Dictionary):
	# cleanup
	for i in animated_sprite.sprite_frames.animations:
		animated_sprite.sprite_frames.remove_animation(i.name)

	# for each animation to create
	for key in animations_coordinates:
		var offset: Vector2 = animations_coordinates[key].offset
		var size: Vector2 = animations_coordinates[key].size
		var coordinates: Array[Vector2] = animations_coordinates[key].coordinates
		animated_sprite.sprite_frames.add_animation(key);

		for coordinate: Vector2 in coordinates:
			var tex = AtlasTexture.new()
			tex.atlas = sprite_sheet
			tex.region = Rect2(
				offset.x + (size.x * coordinate.x),
				offset.y + (size.y * coordinate.y),
				size.x,
				size.y)
			animated_sprite.sprite_frames.add_frame(key, tex, 0.5)

func play_animation(animation_name: StringName):
	body_animated_sprite_2d.play(animation_name)
	wound_animated_sprite_2d.play(animation_name)
	belt_animated_sprite_2d.play(animation_name)
	pants_animated_sprite_2d.play(animation_name)
	shirt_animated_sprite_2d.play(animation_name)
	hair_animated_sprite_2d.play(animation_name)
	weapon_animated_sprite_2d.play(animation_name)

func move_to(new_target: Vector2):
	self.move_target = new_target

func _ready() -> void:
	init_all_animated_sprites()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	if (move_target != Vector2.ZERO):
		var difference = move_target - global_position;
		var direction = (difference).normalized()
		var distance = (difference).abs().length();
		if (distance < 10):
			# Already There
			move_target = Vector2.ZERO
			velocity = Vector2.ZERO
		else:
			velocity = direction * max_speed;

	var state = get_current_state(velocity, "")
	play_animation(state.animation)

	move_and_slide()
