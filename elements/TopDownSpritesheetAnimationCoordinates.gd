class_name TopDownSpritesheetAnimationCoordinates
extends Resource

@export var spritesheet_sector_size: Vector2 = Vector2(64, 64)
@export var spritesheet_sector_offset: Vector2 = Vector2.ZERO
@export var scale: Vector2 = Vector2(1, 1)

@export var animation_coordinates_IDLE_UP: Array[Vector2] = [Vector2(0, 8)]
@export var animation_coordinates_IDLE_LEFT: Array[Vector2] = [Vector2(0, 9)]
@export var animation_coordinates_IDLE_DOWN: Array[Vector2] = [Vector2(0, 10)]
@export var animation_coordinates_IDLE_RIGHT: Array[Vector2] = [Vector2(0, 11)]
@export var animation_coordinates_CAST_UP: Array[Vector2] = [Vector2(0, 0), Vector2(1, 0), Vector2(2, 0), Vector2(3, 0), Vector2(4, 0), Vector2(5, 0), Vector2(6, 0)]
@export var animation_coordinates_CAST_LEFT: Array[Vector2] = [Vector2(0, 1), Vector2(1, 1), Vector2(2, 1), Vector2(3, 1), Vector2(4, 1), Vector2(5, 1), Vector2(6, 1)]
@export var animation_coordinates_CAST_DOWN: Array[Vector2] = [Vector2(0, 2), Vector2(1, 2), Vector2(2, 2), Vector2(3, 2), Vector2(4, 2), Vector2(5, 2), Vector2(6, 2)]
@export var animation_coordinates_CAST_RIGHT: Array[Vector2] = [Vector2(0, 3), Vector2(1, 3), Vector2(2, 3), Vector2(3, 3), Vector2(4, 3), Vector2(5, 3), Vector2(6, 3)]
@export var animation_coordinates_TRUST_UP: Array[Vector2] = [Vector2(0, 4), Vector2(1, 4), Vector2(2, 4), Vector2(3, 4), Vector2(4, 4), Vector2(5, 4), Vector2(6, 4), Vector2(7, 4)]
@export var animation_coordinates_TRUST_LEFT: Array[Vector2] = [Vector2(0, 5), Vector2(1, 5), Vector2(2, 5), Vector2(3, 5), Vector2(4, 5), Vector2(5, 5), Vector2(6, 5), Vector2(7, 5)]
@export var animation_coordinates_TRUST_DOWN: Array[Vector2] = [Vector2(0, 6), Vector2(1, 6), Vector2(2, 6), Vector2(3, 6), Vector2(4, 6), Vector2(5, 6), Vector2(6, 6), Vector2(7, 6)]
@export var animation_coordinates_TRUST_RIGHT: Array[Vector2] = [Vector2(0, 7), Vector2(1, 7), Vector2(2, 7), Vector2(3, 7), Vector2(4, 7), Vector2(5, 7), Vector2(6, 7), Vector2(7, 7)]
@export var animation_coordinates_WALK_UP: Array[Vector2] = [Vector2(0, 8), Vector2(1, 8), Vector2(2, 8), Vector2(3, 8), Vector2(4, 8), Vector2(5, 8), Vector2(6, 8), Vector2(7, 8), Vector2(8, 8)]
@export var animation_coordinates_WALK_LEFT: Array[Vector2] = [Vector2(0, 9), Vector2(1, 9), Vector2(2, 9), Vector2(3, 9), Vector2(4, 9), Vector2(5, 9), Vector2(6, 9), Vector2(7, 9), Vector2(8, 9)]
@export var animation_coordinates_WALK_DOWN: Array[Vector2] = [Vector2(0, 10), Vector2(1, 10), Vector2(2, 10), Vector2(3, 10), Vector2(4, 10), Vector2(5, 10), Vector2(6, 10), Vector2(7, 10), Vector2(8, 10)]
@export var animation_coordinates_WALK_RIGHT: Array[Vector2] = [Vector2(0, 11), Vector2(1, 11), Vector2(2, 11), Vector2(3, 11), Vector2(4, 11), Vector2(5, 11), Vector2(6, 11), Vector2(7, 11), Vector2(8, 11)]
@export var animation_coordinates_SLASH_UP: Array[Vector2] = [Vector2(0, 12), Vector2(1, 12), Vector2(2, 12), Vector2(3, 12), Vector2(4, 12), Vector2(5, 12)]
@export var animation_coordinates_SLASH_LEFT: Array[Vector2] = [Vector2(0, 13), Vector2(1, 13), Vector2(2, 13), Vector2(3, 13), Vector2(4, 13), Vector2(5, 13)]
@export var animation_coordinates_SLASH_DOWN: Array[Vector2] = [Vector2(0, 14), Vector2(1, 14), Vector2(2, 14), Vector2(3, 14), Vector2(4, 14), Vector2(5, 14)]
@export var animation_coordinates_SLASH_RIGHT: Array[Vector2] = [Vector2(0, 15), Vector2(1, 15), Vector2(2, 15), Vector2(3, 15), Vector2(4, 15), Vector2(5, 15)]
@export var animation_coordinates_SHOOT_UP: Array[Vector2] = [Vector2(0, 16), Vector2(1, 16), Vector2(2, 16), Vector2(3, 16), Vector2(4, 16), Vector2(5, 16), Vector2(6, 16), Vector2(7, 16), Vector2(8, 16), Vector2(9, 16), Vector2(10, 16), Vector2(11, 16), Vector2(12, 16)] # 13
@export var animation_coordinates_SHOOT_LEFT: Array[Vector2] = [Vector2(0, 17), Vector2(1, 17), Vector2(2, 17), Vector2(3, 17), Vector2(4, 17), Vector2(5, 17), Vector2(6, 17), Vector2(7, 17), Vector2(8, 17), Vector2(9, 17), Vector2(10, 17), Vector2(11, 17), Vector2(12, 17)] # 13
@export var animation_coordinates_SHOOT_DOWN: Array[Vector2] = [Vector2(0, 18), Vector2(1, 18), Vector2(2, 18), Vector2(3, 18), Vector2(4, 18), Vector2(5, 18), Vector2(6, 18), Vector2(7, 18), Vector2(8, 18), Vector2(9, 18), Vector2(10, 18), Vector2(11, 18), Vector2(12, 18)] # 13
@export var animation_coordinates_SHOOT_RIGHT: Array[Vector2] = [Vector2(0, 19), Vector2(1, 19), Vector2(2, 19), Vector2(3, 19), Vector2(4, 19), Vector2(5, 19), Vector2(6, 19), Vector2(7, 19), Vector2(8, 19), Vector2(9, 19), Vector2(10, 19), Vector2(11, 19), Vector2(12, 19)] # 13
@export var animation_coordinates_DIE_DOWN: Array[Vector2] = [Vector2(0, 20), Vector2(1, 20), Vector2(2, 20), Vector2(3, 20), Vector2(4, 20), Vector2(5, 20)]
@export var animation_coordinates_LAY_ON_GROUND_DOWN: Array[Vector2] = [Vector2(5, 20)]
@export var animation_coordinates_GET_UP_DOWN: Array[Vector2] = [Vector2(5, 20), Vector2(4, 20), Vector2(5, 20), Vector2(4, 20), Vector2(3, 20), Vector2(2, 20), Vector2(1, 20), Vector2(0, 20)]
@export var animation_coordinates_INTERACT_UP: Array[Vector2] = [Vector2(0, 4), Vector2(1, 4), Vector2(2, 4), Vector2(4, 4), Vector2(4, 4), Vector2(2, 4), Vector2(4, 4), Vector2(2, 4), Vector2(3, 4), Vector2(1, 4)]
@export var animation_coordinates_INTERACT_LEFT: Array[Vector2] = [Vector2(0, 5), Vector2(1, 5), Vector2(2, 5), Vector2(4, 5), Vector2(4, 5), Vector2(2, 5), Vector2(4, 5), Vector2(2, 5), Vector2(3, 5), Vector2(1, 5)]
@export var animation_coordinates_INTERACT_DOWN: Array[Vector2] = [Vector2(0, 6), Vector2(1, 6), Vector2(2, 6), Vector2(4, 6), Vector2(4, 6), Vector2(2, 6), Vector2(4, 6), Vector2(2, 6), Vector2(3, 6), Vector2(1, 6)]
@export var animation_coordinates_INTERACT_RIGHT: Array[Vector2] = [Vector2(0, 7), Vector2(1, 7), Vector2(2, 7), Vector2(4, 7), Vector2(4, 7), Vector2(2, 7), Vector2(4, 7), Vector2(2, 7), Vector2(3, 7), Vector2(1, 7)]
