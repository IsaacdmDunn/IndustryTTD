extends Building

@export var towerRange: float = 10
@export var attackRate: float = .2

@export var projectileToSpawn: PackedScene
var targetNode: Node2D

func _physics_process(delta: float) -> void:
	#ProduceResource()
	#draw range circle
	queue_redraw()
	attackRate = gm.ProductionMethods[productionMethodID[currentProductionID]].baseProductionRate
	#$TowerTop.rotat
	if cooldown < 0 and gm.GameResourceList[0] > 0:
		GetTarget()
		cooldown = attackRate
	cooldown -= delta * Globals.timeScale
	pass


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
			get_tree().get_first_node_in_group("ProjectileContainer").add_child(projectile)
			
			#use resource
			gm.GameResourceList[gm.ProductionMethods[productionMethodID[currentProductionID]].itemInputID[0]] -= gm.ProductionMethods[productionMethodID[0]].itemInput[0]
		
			Globals.PitchAudioAsNote(randi_range(-6,6), $AudioStreamPlayer)
	pass


func _draw() -> void:
	if selected:
		var cen = Vector2.ZERO
		var rad = towerRange
		var color = Color(1,1,1,.5)
		draw_circle(cen, rad, color)
		draw_circle(cen, rad, color, false, 10, false)
