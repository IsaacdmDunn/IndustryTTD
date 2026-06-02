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
	dir = position.direction_to(target.get_child(0).global_position).normalized() * speed
	print(target.position)

func _physics_process(delta: float) -> void:
	#if target != null and position.distance_to(target.global_position) > 5 :
		
		#dir = position.direction_to(target.global_position).normalized() * speed

	lifetime -= delta
	
	#print(position)
	velocity = dir * Globals.timeScale
	move_and_collide(velocity)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_parent().is_in_group("Enemy"):
		body.TakeDamage(damage)
		peircing -=1
	if lifetime < 0 or peircing <= 0:
		queue_free()
	pass # Replace with function body.
