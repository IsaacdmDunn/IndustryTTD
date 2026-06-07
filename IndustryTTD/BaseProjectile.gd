extends CharacterBody2D
class_name BaseProjectile
var target: Node2D
@export var speed = 50.0
@export var damage = 5
var lifetime = 5
@export var peircing = 1
var dir
var predictedPos
func _ready() -> void:
	#set direction on spawn
	dir = position.direction_to(target.get_child(0).global_position).normalized() * speed
	

func _physics_process(delta: float) -> void:
	#countdown lifetime
	lifetime -= delta
	#sets velocity and move
	velocity = dir * Globals.timeScale
	move_and_collide(velocity)
	
	#destroy self
	if lifetime < 0 or peircing <= 0:
		queue_free()

#if in enemy collision damage enemy and either lose piercing or destroy self
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_parent().is_in_group("Enemy"):
		if peircing >= 0:
			body.TakeDamage(damage)
		peircing -=1
	if lifetime < 0 or peircing <= 0:
		queue_free()
	pass # Replace with function body.
