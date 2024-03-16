class_name PickupItem
extends Resource

enum WearingAnimationType {hidden, in_hand, on_chest, aura}

@export var icon: Texture2D
@export var texture_on_ground: Texture2D
@export var texture_wearing: Texture2D
@export var name: StringName
@export var wearing_animation: WearingAnimationType

