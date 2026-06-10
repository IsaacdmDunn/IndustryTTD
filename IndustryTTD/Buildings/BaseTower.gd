extends Building

@export var towerRange: float = 10
@export var attackRate: float = 1
@export var baseDamage: float = 500
@export var basePierce: int = 1 #needs to be more than 0
@export var baseAoE: float = 0#above 0 means AoE can happen
@export var burn: float = 0#0 means no burn
@export var freeze: float = 0#0 means no freeze
@export var projectileToSpawn: PackedScene

var targetNode: Node2D

func _physics_process(delta: float) -> void:
	#open buildingUI
	if selected and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		get_tree().get_first_node_in_group("GameUI").OpenBuildingUI(self)
		get_tree().get_first_node_in_group("SoundManager").ButtonSound()
	
	#try find target if cooldown timer reset
	if cooldown < 0 and gm.GameResourceList[0] > 0:
		GetTarget()
		cooldown = productionRate
	cooldown -= delta * Globals.timeScale
	pass

#gets clostest enemy
func GetTarget():
	var closestDisance = 10000
	var distanceTo
	var timeToTarget
	for enemy in get_tree().get_nodes_in_group("Enemy"):
		distanceTo = global_position.distance_to(enemy.global_position)
		
		if distanceTo < closestDisance and distanceTo < towerRange:
			closestDisance = distanceTo
			
			targetNode = enemy
	if targetNode != null:
		if targetNode.get_child(0).health > 0:
			
		
			#spawn projectile
			var projectile = projectileToSpawn.instantiate()	
			
			timeToTarget = distanceTo / projectile.speed
			var predictedPos = targetNode.get_child(0).position + (targetNode.get_child(0).velocity * timeToTarget)
			projectile.predictedPos = predictedPos
			projectile.target = targetNode
			projectile.global_position = global_position
			projectile.damage = baseDamage
			projectile.AoE = baseAoE
			projectile.burn = burn
			projectile.freeze = freeze
			projectile.peircing = basePierce
			get_tree().get_first_node_in_group("ProjectileContainer").add_child(projectile)
			
			ProduceResource()
			Globals.PitchAudioAsNote(randi_range(-6,6), $AudioStreamPlayer)
	pass

#draw range circle
func _draw() -> void:
	if selected:
		var cen = Vector2.ZERO
		var rad = towerRange
		var color = Color(1,1,1,.5)
		draw_circle(cen, rad*2, color)
		draw_circle(cen, rad*2, color, false, 10, false)


func AddAdditionInfo():
	extraDetails = "\nAttack Rate: " + str(gm.ProductionMethods[productionMethodID[currentProductionID]].baseProductionRate)
	extraDetails += "\nDamage: " + str(baseDamage)
	extraDetails += "\nRange: " + str(towerRange)
	if basePierce > 0:
		extraDetails += "\nPeirce: " + str(basePierce)
	if baseAoE > 0:
		extraDetails += "\nAoE Range: " + str(baseAoE)
	if burn > 0:
		extraDetails += "\nBurn: " + str(burn)
	if freeze > 0:
		extraDetails += "\nFreeze: " + str(freeze)
	
	pass
