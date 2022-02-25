extends Area2D

const HitEffect = preload("res://Effects/HitEffect.tscn")

var invencible = false setget set_invencible

onready var timer = $Timer

signal invencibility_started
signal invencibility_ended

func set_invencible(value):
	invencible = value
	if invencible == true:
		emit_signal("invencibility_started")
	else:
		emit_signal("invencibility_ended")

func start_invencibility(duration):
	self.invencible = true
	timer.start(duration)


func create_hit_effect():
	var effect = HitEffect.instance()
	var main = get_tree().current_scene
	main.add_child(effect)
	effect.global_position = global_position

func _on_Timer_timeout():
	self.invencible = false

func _on_Hurtbox_invencibility_started():
	set_deferred("monitorable", false)

func _on_Hurtbox_invencibility_ended():
	set_deferred("monitorable", true)
