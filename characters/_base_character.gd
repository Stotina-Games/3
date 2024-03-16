class_name _BaseCharacter
extends CharacterBody2D

@export var definition: TopDownCharacterBase

@export var body_spritesheet: TopDownSpritesheet
@export var hair_spritesheet: TopDownSpritesheet
@export var shirt_spritesheet: TopDownSpritesheet
@export var pants_spritesheet: TopDownSpritesheet
@export var belt_spritesheet: TopDownSpritesheet
@export var wound_spritesheet: TopDownSpritesheet
@export var weapon_spritesheet: TopDownSpritesheet

@onready var rng = RandomNumberGenerator.new();

@onready var body_animated_sprite_2d: AnimatedSprite2D = $CompositeAnimatedSprite/Body_AnimatedSprite2D
@onready var hair_animated_sprite_2d: AnimatedSprite2D = $CompositeAnimatedSprite/Hair_AnimatedSprite2D
@onready var shirt_animated_sprite_2d: AnimatedSprite2D = $CompositeAnimatedSprite/Shirt_AnimatedSprite2D
@onready var pants_animated_sprite_2d: AnimatedSprite2D = $CompositeAnimatedSprite/Pants_AnimatedSprite2D
@onready var belt_animated_sprite_2d: AnimatedSprite2D = $CompositeAnimatedSprite/Belt_AnimatedSprite2D
@onready var wound_animated_sprite_2d: AnimatedSprite2D = $CompositeAnimatedSprite/Wound_AnimatedSprite2D
@onready var weapon_animated_sprite_2d: AnimatedSprite2D = $CompositeAnimatedSprite/Weapon_AnimatedSprite2D

func _ready() -> void:
	self.init_all_animated_sprites()

func run_state_machine(
	velocity_of_character,
	attempting_to_initiate_action: TopDownCharacterBase.CharacterAction=TopDownCharacterBase.CharacterAction.UNKNOWN,
	forced_action=TopDownCharacterBase.CharacterAction.UNKNOWN
	):
	var direction: TopDownCharacterBase.CharacterDirection = definition.current_direction;
	var action: TopDownCharacterBase.CharacterAction = definition.current_action;

	var absVelocity = velocity_of_character.abs();
	if absVelocity.x > absVelocity.y:
		if velocity_of_character.x > 0:
			direction = TopDownCharacterBase.CharacterDirection.RIGHT
			action = TopDownCharacterBase.CharacterAction.WALK
		elif velocity_of_character.x < 0:
			direction = TopDownCharacterBase.CharacterDirection.LEFT
			action = TopDownCharacterBase.CharacterAction.WALK
	elif absVelocity.x < absVelocity.y:
		if velocity_of_character.y > 0:
			direction = TopDownCharacterBase.CharacterDirection.DOWN
			action = TopDownCharacterBase.CharacterAction.WALK
		elif velocity_of_character.y < 0:
			direction = TopDownCharacterBase.CharacterDirection.UP
			action = TopDownCharacterBase.CharacterAction.WALK
	else:
		direction = definition.current_direction;
		action = TopDownCharacterBase.CharacterAction.IDLE

	var was_idle = definition.current_action == TopDownCharacterBase.CharacterAction.IDLE
	var was_walking = definition.current_action == TopDownCharacterBase.CharacterAction.WALK
	var is_able_to_initiate_action = was_idle or was_walking

	if is_able_to_initiate_action:
		if (attempting_to_initiate_action == TopDownCharacterBase.CharacterAction.CAST):
			action = TopDownCharacterBase.CharacterAction.CAST
		elif (attempting_to_initiate_action == TopDownCharacterBase.CharacterAction.TRUST):
			action = TopDownCharacterBase.CharacterAction.TRUST
		elif (attempting_to_initiate_action == TopDownCharacterBase.CharacterAction.SLASH):
			action = TopDownCharacterBase.CharacterAction.SLASH
		elif (attempting_to_initiate_action == TopDownCharacterBase.CharacterAction.SHOOT):
			action = TopDownCharacterBase.CharacterAction.SHOOT
		elif (attempting_to_initiate_action == TopDownCharacterBase.CharacterAction.INTERACT):
			action = TopDownCharacterBase.CharacterAction.INTERACT

	if forced_action != TopDownCharacterBase.CharacterAction.UNKNOWN:
		action = forced_action

	if action == TopDownCharacterBase.CharacterAction.DIE or action == TopDownCharacterBase.CharacterAction.LAY_ON_GROUND or action == TopDownCharacterBase.CharacterAction.GET_UP:
		direction = TopDownCharacterBase.CharacterDirection.DOWN

	var is_new_action = action != definition.current_action
	var is_new_direction = direction != definition.current_direction

	definition.current_action = action
	definition.current_direction = direction
	var animation = TopDownCharacterBase.CharacterAction.keys()[action] + "_" + TopDownCharacterBase.CharacterDirection.keys()[direction];

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

func init_all_animated_sprites():
	cleanup_animated_sprites()

	if (self.body_spritesheet):
		self.init_animated_sprite(self.body_animated_sprite_2d, self.body_spritesheet.spritesheet, self.body_spritesheet.spritesheet_coordinates)
	if (self.wound_spritesheet):
		self.init_animated_sprite(self.wound_animated_sprite_2d, self.wound_spritesheet.spritesheet, self.wound_spritesheet.spritesheet_coordinates)
	if (self.belt_spritesheet):
		self.init_animated_sprite(self.belt_animated_sprite_2d, self.belt_spritesheet.spritesheet, self.belt_spritesheet.spritesheet_coordinates)
	if (self.pants_spritesheet):
		self.init_animated_sprite(self.pants_animated_sprite_2d, self.pants_spritesheet.spritesheet, self.pants_spritesheet.spritesheet_coordinates)
	if (self.shirt_spritesheet):
		self.init_animated_sprite(self.shirt_animated_sprite_2d, self.shirt_spritesheet.spritesheet, self.shirt_spritesheet.spritesheet_coordinates)
	if (self.hair_spritesheet):
		self.init_animated_sprite(self.hair_animated_sprite_2d, self.hair_spritesheet.spritesheet, self.hair_spritesheet.spritesheet_coordinates)
	if (self.weapon_spritesheet):
		self.init_animated_sprite(self.weapon_animated_sprite_2d, self.weapon_spritesheet.spritesheet, self.weapon_spritesheet.spritesheet_coordinates)

	play_animation('WALK_LEFT')

func cleanup_animated_sprites():
	self.body_animated_sprite_2d.sprite_frames = SpriteFrames.new()
	self.wound_animated_sprite_2d.sprite_frames = SpriteFrames.new()
	self.belt_animated_sprite_2d.sprite_frames = SpriteFrames.new()
	self.pants_animated_sprite_2d.sprite_frames = SpriteFrames.new()
	self.shirt_animated_sprite_2d.sprite_frames = SpriteFrames.new()
	self.hair_animated_sprite_2d.sprite_frames = SpriteFrames.new()
	self.weapon_animated_sprite_2d.sprite_frames = SpriteFrames.new()

func init_animated_sprite(animated_sprite: AnimatedSprite2D, sprite_sheet: Texture2D, animations_coordinates: TopDownSpritesheetAnimationCoordinates):
	# animation list
	var animationNames = [
		"IDLE_UP", "IDLE_LEFT", "IDLE_DOWN", "IDLE_RIGHT",
		"CAST_UP", "CAST_LEFT", "CAST_DOWN", "CAST_RIGHT",
		"TRUST_UP", "TRUST_LEFT", "TRUST_DOWN", "TRUST_RIGHT",
		"WALK_UP", "WALK_LEFT", "WALK_DOWN", "WALK_RIGHT",
		"SLASH_UP", "SLASH_LEFT", "SLASH_DOWN", "SLASH_RIGHT",
		"SHOOT_UP", "SHOOT_LEFT", "SHOOT_DOWN", "SHOOT_RIGHT",
		"DIE_DOWN", "LAY_ON_GROUND_DOWN", "GET_UP_DOWN",
		"INTERACT_UP", "INTERACT_LEFT", "INTERACT_DOWN", "INTERACT_RIGHT",
	]

	# for each animation to create
	for key in animationNames:
		var offset: Vector2 = animations_coordinates.spritesheet_sector_offset
		var size: Vector2 = animations_coordinates.spritesheet_sector_size
		var coordinates: Array[Vector2] = animations_coordinates['animation_coordinates_' + key]
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
	if (self.body_animated_sprite_2d.sprite_frames.has_animation(animation_name)):
		self.body_animated_sprite_2d.play(animation_name)

	if (self.wound_animated_sprite_2d.sprite_frames.has_animation(animation_name)):
		self.wound_animated_sprite_2d.play(animation_name)

	if (self.belt_animated_sprite_2d.sprite_frames.has_animation(animation_name)):
		self.belt_animated_sprite_2d.play(animation_name)

	if (self.pants_animated_sprite_2d.sprite_frames.has_animation(animation_name)):
		self.pants_animated_sprite_2d.play(animation_name)

	if (self.shirt_animated_sprite_2d.sprite_frames.has_animation(animation_name)):
		self.shirt_animated_sprite_2d.play(animation_name)

	if (self.hair_animated_sprite_2d.sprite_frames.has_animation(animation_name)):
		self.hair_animated_sprite_2d.play(animation_name)

	if (self.weapon_animated_sprite_2d.sprite_frames.has_animation(animation_name)):
		self.weapon_animated_sprite_2d.play(animation_name)

func move_to(new_target: Vector2):
	self.definition.move_target = new_target

func _process(_delta: float) -> void:
	run_state_machine(velocity)

func _physics_process(_delta: float) -> void:
	if (definition.move_target != Vector2.ZERO):
		var difference = definition.move_target - global_position
		var direction = (difference).normalized()
		var distance = (difference).abs().length()
		if (distance < 10):
			# Already There
			definition.move_target = Vector2.ZERO
			velocity = Vector2.ZERO
		else:
			velocity = direction * definition.max_speed;
	move_and_slide()
