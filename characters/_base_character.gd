class_name _BaseCharacter
extends CharacterBody2D

enum CHARACTER_ACTION {
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

enum CHARACTER_DIRECTION {UP, DOWN, LEFT, RIGHT}

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

@onready var move_target: Vector2 = Vector2.ZERO;

@onready var max_speed: int = 200

@onready var rng = RandomNumberGenerator.new();

@onready var body_animated_sprite_2d: AnimatedSprite2D = $CompositeAnimatedSprite/Body_AnimatedSprite2D
@onready var hair_animated_sprite_2d: AnimatedSprite2D = $CompositeAnimatedSprite/Hair_AnimatedSprite2D
@onready var shirt_animated_sprite_2d: AnimatedSprite2D = $CompositeAnimatedSprite/Shirt_AnimatedSprite2D
@onready var pants_animated_sprite_2d: AnimatedSprite2D = $CompositeAnimatedSprite/Pants_AnimatedSprite2D
@onready var belt_animated_sprite_2d: AnimatedSprite2D = $CompositeAnimatedSprite/Belt_AnimatedSprite2D
@onready var wound_animated_sprite_2d: AnimatedSprite2D = $CompositeAnimatedSprite/Wound_AnimatedSprite2D
@onready var weapon_animated_sprite_2d: AnimatedSprite2D = $CompositeAnimatedSprite/Weapon_AnimatedSprite2D

@onready var selected_spritesheet_body: Texture2D
@onready var selected_spritesheet_wound: Texture2D
@onready var selected_spritesheet_belt: Texture2D
@onready var selected_spritesheet_pants: Texture2D
@onready var selected_spritesheet_shirt: Texture2D
@onready var selected_spritesheet_hair: Texture2D
@onready var selected_spritesheet_weapon: Texture2D

@onready var animation_spritesheet_coordinates = {
	IDLE_UP = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 8), 1),
	IDLE_LEFT = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 9), 1),
	IDLE_DOWN = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 10), 1),
	IDLE_RIGHT = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 11), 1),

	CAST_UP = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 0), 7),
	CAST_LEFT = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 1), 7),
	CAST_DOWN = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 2), 7),
	CAST_RIGHT = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 3), 7),

	TRUST_UP = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 4), 8),
	TRUST_LEFT = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 5), 8),
	TRUST_DOWN = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 6), 8),
	TRUST_RIGHT = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 7), 8),

	WALK_UP = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 8), 9),
	WALK_LEFT = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 9), 9),
	WALK_DOWN = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 10), 9),
	WALK_RIGHT = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 11), 9),

	SLASH_UP = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 12), 6),
	SLASH_LEFT = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 13), 6),
	SLASH_DOWN = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 14), 6),
	SLASH_RIGHT = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 15), 6),

	SHOOT_UP = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 16), 13),
	SHOOT_LEFT = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 17), 13),
	SHOOT_DOWN = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 18), 13),
	SHOOT_RIGHT = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 19), 13),

	DIE_DOWN = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(0, 20), 6),

	LAY_ON_GROUND_DOWN = _BaseCharacter.sprite_coordinates_sequential(Vector2(64, 64), Vector2(5, 20), 1),

	GET_UP_DOWN = _BaseCharacter.sprite_coordinates_non_sequential(Vector2(64, 64), Vector2(0, 20), [5, 4, 5, 4, 3, 2, 1, 0]),

	INTERACT_UP = _BaseCharacter.sprite_coordinates_non_sequential(Vector2(64, 64), Vector2(0, 4), [0, 1, 2, 4, 4, 2, 4, 2, 3, 1]),
	INTERACT_LEFT = _BaseCharacter.sprite_coordinates_non_sequential(Vector2(64, 64), Vector2(0, 5), [0, 1, 2, 4, 4, 2, 4, 2, 3, 1]),
	INTERACT_DOWN = _BaseCharacter.sprite_coordinates_non_sequential(Vector2(64, 64), Vector2(0, 6), [0, 1, 2, 4, 4, 2, 4, 2, 3, 1]),
	INTERACT_RIGHT = _BaseCharacter.sprite_coordinates_non_sequential(Vector2(64, 64), Vector2(0, 7), [0, 1, 2, 4, 4, 2, 4, 2, 3, 1]),
}

@onready var previous_direction: CHARACTER_DIRECTION = CHARACTER_DIRECTION.RIGHT
@onready var previous_action: CHARACTER_ACTION = CHARACTER_ACTION.IDLE

func run_state_machine(velocity_of_character, attempting_to_initiate_action: CHARACTER_ACTION=CHARACTER_ACTION.UNKNOWN, forced_action=CHARACTER_ACTION.UNKNOWN):
	var direction: CHARACTER_DIRECTION = previous_direction;
	var action: CHARACTER_ACTION = previous_action;

	var absVelocity = velocity_of_character.abs();
	if absVelocity.x > absVelocity.y:
		if velocity_of_character.x > 0:
			direction = CHARACTER_DIRECTION.RIGHT
			action = CHARACTER_ACTION.WALK
		elif velocity_of_character.x < 0:
			direction = CHARACTER_DIRECTION.LEFT
			action = CHARACTER_ACTION.WALK
	elif absVelocity.x < absVelocity.y:
		if velocity_of_character.y > 0:
			direction = CHARACTER_DIRECTION.DOWN
			action = CHARACTER_ACTION.WALK
		elif velocity_of_character.y < 0:
			direction = CHARACTER_DIRECTION.UP
			action = CHARACTER_ACTION.WALK
	else:
		direction = previous_direction;
		action = CHARACTER_ACTION.IDLE

	var is_able_to_initiate_action = previous_action == CHARACTER_ACTION.IDLE or previous_action == CHARACTER_ACTION.WALK;

	if is_able_to_initiate_action:
		if (attempting_to_initiate_action == CHARACTER_ACTION.CAST):
			action = CHARACTER_ACTION.CAST
		elif (attempting_to_initiate_action == CHARACTER_ACTION.TRUST):
			action = CHARACTER_ACTION.TRUST
		elif (attempting_to_initiate_action == CHARACTER_ACTION.SLASH):
			action = CHARACTER_ACTION.SLASH
		elif (attempting_to_initiate_action == CHARACTER_ACTION.SHOOT):
			action = CHARACTER_ACTION.SHOOT
		elif (attempting_to_initiate_action == CHARACTER_ACTION.INTERACT):
			action = CHARACTER_ACTION.INTERACT

	if forced_action != CHARACTER_ACTION.UNKNOWN:
		action = forced_action

	if action == CHARACTER_ACTION.DIE or action == CHARACTER_ACTION.LAY_ON_GROUND or action == CHARACTER_ACTION.GET_UP:
		direction = CHARACTER_DIRECTION.DOWN

	var is_new_action = action != previous_action
	var is_new_direction = direction != previous_direction

	previous_action = action
	previous_direction = direction
	var animation = CHARACTER_ACTION.keys()[action] + "_" + CHARACTER_DIRECTION.keys()[direction];

	var determined_state = {
		action = action,
		direction = direction,
		animation = animation,
		is_new_action = is_new_action,
		is_new_direction = is_new_direction,
	};

	if is_new_action:
		on_new_action(determined_state)

	if is_new_direction:
		on_new_direction(determined_state)

	if is_new_direction or is_new_action:
		on_new_direction_or_action(determined_state)

	return determined_state

func on_new_action(_determined_state) -> void:
	pass

func on_new_direction(_determined_state) -> void:
	pass

func on_new_direction_or_action(determined_state) -> void:
	play_animation(determined_state.animation)

static func sprite_coordinates_sequential(size: Vector2, from_coordinate: Vector2, count: int, offset=Vector2.ZERO):
	var coordinates: Array[Vector2] = [from_coordinate];
	for n in range(1, count):
		coordinates.push_back(Vector2(from_coordinate.x + n, from_coordinate.y))
	return {size = size, coordinates = coordinates, offset = offset}

static func sprite_coordinates_non_sequential(size: Vector2, from_coordinate: Vector2, x_offsets: Array[int], offset=Vector2.ZERO):
	var coordinates: Array[Vector2] = [];
	for n in x_offsets:
		coordinates.push_back(Vector2(from_coordinate.x + n, from_coordinate.y))
	return {size = size, coordinates = coordinates, offset = offset}

func select_random_looks():
	var possible_Bodies: Array = SPRITESHEETS.BODY.keys()
	var random_BODY = possible_Bodies[rng.randi_range(0, possible_Bodies.size() - 1)]
	self.selected_spritesheet_body = SPRITESHEETS.BODY.get(random_BODY)

	var possible_Wounds: Array = SPRITESHEETS.WOUND.keys()
	var random_WOUND = possible_Wounds[rng.randi_range(0, possible_Wounds.size() - 1)]
	self.selected_spritesheet_wound = SPRITESHEETS.WOUND.get(random_WOUND)

	var possible_Belts: Array = SPRITESHEETS.BELT.keys()
	var random_BELT = possible_Belts[rng.randi_range(0, possible_Belts.size() - 1)]
	self.selected_spritesheet_belt = SPRITESHEETS.BELT.get(random_BELT)

	var possible_Pants: Array = SPRITESHEETS.PANTS.keys()
	var random_PANTS = possible_Pants[rng.randi_range(0, possible_Pants.size() - 1)]
	self.selected_spritesheet_pants = SPRITESHEETS.PANTS.get(random_PANTS)

	var possible_Shirts: Array = SPRITESHEETS.SHIRT.keys()
	var random_SHIRT = possible_Shirts[rng.randi_range(0, possible_Shirts.size() - 1)]
	self.selected_spritesheet_shirt = SPRITESHEETS.SHIRT.get(random_SHIRT)

	var possible_Hairs: Array = SPRITESHEETS.HAIR.keys()
	var random_HAIR = possible_Hairs[rng.randi_range(0, possible_Hairs.size() - 1)]
	self.selected_spritesheet_hair = SPRITESHEETS.HAIR.get(random_HAIR)

	var possible_Weapons: Array = SPRITESHEETS.WEAPON.keys()
	var random_WEAPON = possible_Weapons[rng.randi_range(0, possible_Weapons.size() - 1)]
	self.selected_spritesheet_weapon = SPRITESHEETS.WEAPON.get(random_WEAPON)

	self.scale = Vector2(rng.randf_range(0.75, 1.25), rng.randf_range(0.75, 1.8))

func init_all_animated_sprites():
	self.init_animated_sprite(self.body_animated_sprite_2d, self.selected_spritesheet_body, self.animation_spritesheet_coordinates)
	self.init_animated_sprite(self.wound_animated_sprite_2d, self.selected_spritesheet_wound, self.animation_spritesheet_coordinates)
	self.init_animated_sprite(self.belt_animated_sprite_2d, self.selected_spritesheet_belt, self.animation_spritesheet_coordinates)
	self.init_animated_sprite(self.pants_animated_sprite_2d, self.selected_spritesheet_pants, self.animation_spritesheet_coordinates)
	self.init_animated_sprite(self.shirt_animated_sprite_2d, self.selected_spritesheet_shirt, self.animation_spritesheet_coordinates)
	self.init_animated_sprite(self.hair_animated_sprite_2d, self.selected_spritesheet_hair, self.animation_spritesheet_coordinates)
	self.init_animated_sprite(self.weapon_animated_sprite_2d, self.selected_spritesheet_weapon, self.animation_spritesheet_coordinates)
	play_animation('WALK_LEFT')

func init_animated_sprite(animated_sprite: AnimatedSprite2D, sprite_sheet: Texture2D, animations_coordinates: Dictionary):
	# cleanup
	animated_sprite.sprite_frames = SpriteFrames.new()

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
			animated_sprite.sprite_frames.add_frame(key, tex, 0.4)

func play_animation(animation_name: StringName):
	body_animated_sprite_2d.play(animation_name)
	wound_animated_sprite_2d.play(animation_name)
	belt_animated_sprite_2d.play(animation_name)
	pants_animated_sprite_2d.play(animation_name)
	shirt_animated_sprite_2d.play(animation_name)
	hair_animated_sprite_2d.play(animation_name)
	weapon_animated_sprite_2d.play(animation_name)
	print(play_animation, body_animated_sprite_2d, body_animated_sprite_2d.sprite_frames)

func move_to(new_target: Vector2):
	self.move_target = new_target

func _ready() -> void:
	self.init_all_animated_sprites()

func _process(_delta: float) -> void:
	run_state_machine(velocity)

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
	move_and_slide()
