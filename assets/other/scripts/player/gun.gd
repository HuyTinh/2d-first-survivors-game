extends Area2D

func _physics_process(delta: float) -> void:
	var ememies_in_range = get_overlapping_bodies()
	if ememies_in_range.size() > 0:
		var target_enemy = ememies_in_range.front()
		look_at(target_enemy.global_position)

func shoot():
	const BULLET = preload("res://assets/other/scenes/objects/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)
	

func _on_timer_timeout() -> void:
	shoot()
