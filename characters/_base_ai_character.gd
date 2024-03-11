class_name _BaseAiCharacter
extends _BaseCharacter

@onready var BASE_TARGET_PRIORITIES = {
	# these values are simply references. They can be overweitten.
	UNKNOWN = 0.00,
	IDLE = 0.01,
	WALK = 0.10,
	INTERACT = 0.7,
	CAST = 1.0,
	TRUST = 1.0,
	SLASH = 1.0,
	SHOOT = 1.0,
}

@onready var BASE_ACTION_DISTANCES = {
	# these values are simply references. They can be overweitten.
	UNKNOWN = 0,
	IDLE = 0,
	WALK = 0,
	INTERACT = 30,
	CAST = 250,
	TRUST = 50,
	SLASH = 30,
	SHOOT = 250,
}

@onready var targets: Dictionary = {};

func add_action_target(
	target: Node2D,
	action: CHARACTER_ACTION,
	priority: float=- 1.0,
	action_distance: int=- 1,
	action_distance_tolerance: int=- 1,
	):

	print("add_action_target", self)

	var action_str = CHARACTER_ACTION.keys()[action];
	var id = action_str + "_" + str(target.get_instance_id());
	self.targets[id] = {
		action = CHARACTER_ACTION.IDLE,
		priority = BASE_TARGET_PRIORITIES[action_str] if priority < 0 else priority,
		target = target,
		action_distance = BASE_ACTION_DISTANCES[action_str] if action_distance < 0 else action_distance,
		action_distance_tolerance = 10 if action_distance_tolerance < 0 else action_distance_tolerance,
	};
	if self.targets.size() > 50:
		remove_tasks_with_least_priority(self.targets.size() - 10) # keep only 10 tasks

func remove_action_target(target: Node2D, action: CHARACTER_ACTION):
	var action_str = CHARACTER_ACTION.keys()[action]
	var id = action_str + "_" + str(target.get_instance_id())
	targets.erase(id)

func remove_tasks_with_least_priority(count_to_remove):
	var keys = targets.keys()
	var keys_to_keep: Array[String] = keys.slice(0, keys.size() - count_to_remove)
	for check in range(keys_to_keep.size(), keys.size()):
		var key_to_check = keys[check];
		for keep in range(0, keys_to_keep.size()):
			if (targets[key_to_check].priority > targets[keys_to_keep[keep]].priority):
				keys_to_keep[keep] = key_to_check
				break
	var targets_to_keep: Dictionary = {}
	for id in keys_to_keep:
		targets_to_keep[id] = targets[id]
	targets = targets_to_keep

func _ready() -> void:
	add_action_target(self, CHARACTER_ACTION.IDLE)

func _process(delta: float) -> void:
	_process_targeting_ai(delta)

func _process_targeting_ai(_delta: float) -> void:
	if targets.size() < 1:
		add_action_target(self, CHARACTER_ACTION.IDLE)

	var keys = targets.keys()
	var most_desired_key: String = keys[0]
	for key in keys:
		if targets[key].priority > targets[most_desired_key].priority:
			most_desired_key = key

	var t = targets[most_desired_key] # action | priority | target | action_distance | action_distance_tolerance

	var difference = t.target.global_position - global_position;
	var distance = (difference).length();

	var is_too_close = distance < t.action_distance - t.action_distance_tolerance
	var is_too_far = distance > t.action_distance + t.action_distance_tolerance

	if is_too_close or is_too_far:
		var direction_to_target = difference.normalized();
		var direction_to_move = (direction_to_target) if (is_too_far) else (-direction_to_target)
		var distance_to_move = distance - t.action_distance if (is_too_far) else (t.action_distance - distance)
		self.move_to(global_position + (direction_to_move * distance_to_move))
	else:
		var action: CHARACTER_ACTION = t.action;
		run_state_machine(velocity, action)
