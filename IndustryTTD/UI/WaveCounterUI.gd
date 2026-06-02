extends NinePatchRect
@onready var progressBar: ProgressBar = $"../TextureProgressBar"
@export var waveManager: WaveManager
@onready var EnemiesInWaveLBL: Label = $EnemiesInWave
@onready var EnemiesLeftLBL: Label = $EnemyLeftLBL
@onready var WaveCounterLBL: Label = $"Wave Count"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var wave = waveManager.currentWave
	progressBar.max_value = waveManager.waveData.enemyCount.sample(wave)
	progressBar.value = progressBar.max_value - waveManager.currentEnemyCount
	
	WaveCounterLBL.text = "Wave: " + str(int(wave))
	EnemiesInWaveLBL.text = "Enemies in wave: " + str(int(waveManager.waveData.enemyCount.sample(wave)))
	EnemiesLeftLBL.text = "Enemies Left: " + str(int(waveManager.get_child_count()-1))
	pass
