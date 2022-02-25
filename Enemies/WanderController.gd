extends Node2D

export(int) var wander_range = 32

onready var start_posotion = global_position
onready var 	target_postion = global_position

onready var timer = $Timer

func _ready():
	update_target_postion()

func update_target_postion():
	var target_vector = Vector2(rand_range(-wander_range, wander_range), rand_range(-wander_range, wander_range))
	target_postion = start_posotion + target_vector

func get_time_left():
	return timer	.time_left

func start_wander_timer(duration):
	timer.start(duration)

func _on_Timer_timeout():
	update_target_postion()
