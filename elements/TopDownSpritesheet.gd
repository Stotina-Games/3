class_name TopDownSpritesheet
extends Resource

enum SpritesheetType {
	body,
	wound,
	belt,
	pants,
	shirt,
	hair,
	weapon,
}

@export var name: StringName
@export var type: SpritesheetType = SpritesheetType.body
@export var spritesheet: Texture2D
@export var spritesheet_coordinates: TopDownSpritesheetAnimationCoordinates


