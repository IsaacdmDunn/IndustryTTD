extends Node
var timeScale = 1
var enemyHealthMod: float = 1
var enemyHealthTemp: float = 0
var enemyDamageMod: float = 1
var enemyDamageTemp: float = 0
var enemySpeedMod: float = 1
var enemySpeedTemp: float = 0


func Test():
	timeScale = 50

#plays sound pitched to 12 scale music 
func PitchAudioAsNote(semiTone: float, audio: AudioStreamPlayer):
	if audio != null:
	
		audio.pitch_scale = pow(2, semiTone / 12.0)
		audio.play()
