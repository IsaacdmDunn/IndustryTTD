extends CharacterBody2D
class_name BaseEnemy
@export var path:PathFollow2D

@export var baseSpeed = 1.0
@export var health = 50
@export var damage = 1
@export var maxSpeed = 10
@onready var offsetPos = Vector2(randf_range(-50,50),randf_range(-50,50))

func _ready() -> void:
	Globals.PitchAudioAsNote(randi_range(0,12), $"../AudioStreamPlayer")
		
	
	var extraSpeed:float = 1
	baseSpeed = baseSpeed * (Globals.enemySpeedMod + Globals.enemySpeedTemp)
	if baseSpeed > maxSpeed:
		extraSpeed += (baseSpeed - maxSpeed) / 100
		baseSpeed = maxSpeed
	damage = damage * (Globals.enemyDamageMod + Globals.enemyDamageTemp)
	health = health * (Globals.enemyHealthMod + Globals.enemyHealthTemp + extraSpeed)
	
func _physics_process(delta: float) -> void:
	#velocity = global_position
	#move enemy along path
	path.progress += baseSpeed * Globals.timeScale
	#velocity -= global_position
	position = offsetPos
	if path.progress_ratio == 1:
		get_tree().get_first_node_in_group("Wall").TakeDamage(damage)
		path.queue_free()
		
func TakeDamage(damage):
	health -= damage
	if health <= 0:
		#path.reparent(get_tree().root)
		path.queue_free()
