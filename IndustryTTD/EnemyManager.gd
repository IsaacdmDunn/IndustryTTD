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

@export var downWaveMod: float = 2
@export var downWaveTime = 7
var downWaveTimer = 1000

#sets data for next wave
func GetNextWave():
	if currentWave == waveData.enemyCount.max_domain:
		$"../Camera2D/CanvasLayer/GameUI/Win Screen".SetWinscreen()
		pass
	
	
	
	Globals.PitchAudioAsNote(randi_range(-12,0),$"../SoundContainer/AudioStreamPlayer")
	#if max enemy count reached set extra penealties
	if maxEnemyCountReached:
		Globals.enemySpeedMod += 0.01
	maxEnemyCountReached = false
	
	#add modifiers for enemys
	Globals.enemyDamageMod += 0.05
	Globals.enemyHealthMod += 0.1
	currentWave += 1
	
	#auto save game
	SaveSystem.saveData.waveID = currentWave
	get_parent().SetSaveData()
	
	#set enemies in round/ down wave timer for break between waves/ enemy spawn rate
	currentEnemyCount = waveData.enemyCount.sample(currentWave)
	downWaveTimer = downWaveTime
	timeBetweenEnemies = 1/waveData.enemyPerSecond.sample(currentWave)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#enemy spawn timer
	enemySpawnTimer -= delta * Globals.timeScale
	if enemySpawnTimer < 0:
		_on_timer_timeout()
	#if no enemies then start next wave
	if currentEnemyCount <= 0:
		downWaveTimer -= delta * Globals.timeScale
		timeBetweenEnemies = 1/waveData.enemyPerSecond.sample(currentWave)*downWaveMod
	if downWaveTimer < 0:
		GetNextWave()
		pass
	pass

#spawn enemy
func _on_timer_timeout() -> void:
	if $".".get_child_count() < maxEnemies:
		var enemyToSpawn
	
		for i in waveData.numberOfEnemyTypes.sample(currentWave) - 1:
			
			var enemyValue = randi_range(0, waveData.enemiesRatio[i])
			if enemyValue < waveData.enemiesRatio[i]:
				enemyToSpawn = waveData.enemiesList[i-1].instantiate()
	
		currentEnemyCount -= 1
		add_child(enemyToSpawn)
	#if max enemies reached set temp penealities
	else:
		maxEnemyCountReached = true
		Globals.enemyDamageTemp = 0.1
		Globals.enemySpeedTemp = 0.1
		Globals.enemyHealthTemp = 0.1
	enemySpawnTimer = timeBetweenEnemies
	
