
class_name PickupWeapon
extends PickupItem

enum AttackDirectionType {front, back, side, random}

@export var attack_texture: Texture2D
@export var attack_power: float=10
@export var attack_range_min: float=0
@export var attack_range_max: float=50
@export var attack_size: float=50
@export var attack_range_angle: float=75
@export var attack_direction: AttackDirectionType=AttackDirectionType.front
@export var attack_burst_count: float=2
@export var attack_cooldown_burst: float=0.2
@export var attack_cooldown_rest: float=1.1
