extends CharacterBody2D
class_name BaseEnemy
@export var path:PathFollow2D
var finalspeed
@export var baseSpeed = 1.0
@export var health = 50
@export var damage = 1
@export var maxSpeed = 10
@onready var offsetPos = Vector2(randf_range(-50,50),randf_range(-50,50))
var fireTimer = 0
var freezeTimer = 0
var timer = 1
func _ready() -> void:
	#spawn noise
	Globals.PitchAudioAsNote(randi_range(0,12), $"../AudioStreamPlayer")
		
	#sets stats using modifiers 
	var extraSpeed:float = 1
	baseSpeed = baseSpeed * (Globals.enemySpeedMod + Globals.enemySpeedTemp)
	if baseSpeed > maxSpeed:
		extraSpeed += (baseSpeed - maxSpeed) / 100
		baseSpeed = maxSpeed
	damage = damage * (Globals.enemyDamageMod + Globals.enemyDamageTemp)
	health = health * (Globals.enemyHealthMod + Globals.enemyHealthTemp + extraSpeed)
	
func _physics_process(delta: float) -> void:
	if fireTimer > 0 or freezeTimer > 0:
		timer -= delta
	
	finalspeed = baseSpeed * Globals.timeScale
	
	if timer < 0:
		if fireTimer > 0:
			fireTimer = fireTimer - 1
			TakeDamage(Globals.burnDamage)
		
		if freezeTimer > 0:
			freezeTimer = freezeTimer - 1
			#move enemy along path
			finalspeed = Globals.freezeAmount * (baseSpeed * Globals.timeScale)
	
			
	path.progress += finalspeed
	position = offsetPos
	
	#when at end of path damage wall and destroy self
	if path.progress_ratio == 1:
		get_tree().get_first_node_in_group("Wall").TakeDamage(damage)
		path.queue_free()

#take damage when hit with projectile
func TakeDamage(damage):
	health -= damage
	if health <= 0:
		#path.reparent(get_tree().root)
		SaveSystem.saveData.kills += 1
		path.queue_free()

func free() -> void:
	SaveSystem.saveData.kills += 1
