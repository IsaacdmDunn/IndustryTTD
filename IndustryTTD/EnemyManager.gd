extends Path2D
class_name WaveManager
@export var baseEnemy: PackedScene

@export var waveData: WaveData
var currentWave: float = 0
var currentEnemyCount = 0
var timeBetweenEnemies = 0
var enemySpawnTimer = 0
@export var maxEnemies:int = 500
var maxEnemyCountReached: bool = false

@export var downWaveTime = 5
var downWaveTimer = 1000

func GetNextWave():
	Globals.PitchAudioAsNote(randi_range(-12,0),$"../SoundContainer/AudioStreamPlayer")
	
	if maxEnemyCountReached:
		Globals.enemySpeedMod += 0.01
	maxEnemyCountReached = false
	Globals.enemyDamageMod += 0.05
	Globals.enemyHealthMod += 0.1
	currentWave += 1
	currentEnemyCount = waveData.enemyCount.sample(currentWave)
	downWaveTimer = downWaveTime
	timeBetweenEnemies = 1/waveData.enemyPerSecond.sample(currentWave)
	
	pass



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GetNextWave()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	enemySpawnTimer -= delta * Globals.timeScale
	if enemySpawnTimer < 0:
		_on_timer_timeout()
	#if no enemies then start next wave
	if currentEnemyCount <= 0:
		downWaveTimer -= delta * Globals.timeScale
		timeBetweenEnemies = 1/waveData.enemyPerSecond.sample(currentWave)*10
	if downWaveTimer < 0:
		GetNextWave()
		pass
	pass


func _on_timer_timeout() -> void:
	if $".".get_child_count() < maxEnemies:
		var enemyToSpawn
		#var weight
		for i in waveData.numberOfEnemyTypes.sample(currentWave):
			#weight += waveData.enemiesRatio[i]
			var enemyValue = randi_range(0, waveData.enemiesRatio[i])
			if enemyValue < waveData.enemiesRatio[i]:
				enemyToSpawn = waveData.enemiesList[i-1].instantiate()
		
		#for i in waveData.numberOfEnemyTypes.sample(currentWave):
		#
			#if enemyValue < waveData.enemiesRatio[i]:
				#enemyToSpawn = waveData.enemiesList[i].instantiate()
			#else:
				#weight -= 
		currentEnemyCount -= 1
		add_child(enemyToSpawn)
	else:
		maxEnemyCountReached = true
		Globals.enemyDamageTemp = 0.1
		Globals.enemySpeedTemp = 0.1
		Globals.enemyHealthTemp = 0.1
	enemySpawnTimer = timeBetweenEnemies
	
	#$EnemySpawnTimer.start(timeBetweenEnemies)
	pass # Replace with function body.
