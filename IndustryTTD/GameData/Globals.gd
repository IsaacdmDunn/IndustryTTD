extends Node

##level data
var levelID = 0


var openFromSave = false
var timeScale = 0
var level
var enemyHealthMod: float = 1
var enemyHealthTemp: float = 0
var enemyDamageMod: float = 1
var enemyDamageTemp: float = 0
var enemySpeedMod: float = 1
var enemySpeedTemp: float = 0
var burnDamage = 3
var freezeAmount = .3

func Test():
	SaveSystem.saveData.researchCount += 1
	timeScale = 50

func Test2():
	SaveSystem.saveData.researchCount += 1
	#timeScale = 50
#plays sound pitched to 12 scale music 
func PitchAudioAsNote(semiTone: float, audio: AudioStreamPlayer):
	if audio != null:
	
		audio.pitch_scale = pow(2, semiTone / 12.0)
		audio.play()
		
		
##research
func woodAmount():
	pass
func woodSpeed():
	pass
func stoneAmount():
	pass
func stoneSpeed():
	pass
func niterAmount():
	pass
func niterSpeed():
	pass
func farmAmount():
	pass
func farmSpeed():
	pass
	
func CoalAmount():
	pass
func CoalSpeed():
	pass
func HouseCap():
	pass
func IronSpeed():
	pass
func IronAmount():
	pass
func ToolSpeed():
	pass
func ToolAmount():
	pass
func ScienceSpeed():
	pass
func Stockpile():
	pass
	
func ArcherDam():
	pass
func ArcherSpeed():
	pass
func ArcherRange():
	pass
	
func BallistaDam():
	pass
func BallistaSpeed():
	pass
func BallistaRange():
	pass
func BallistaPeirce():
	pass
	
func CatpapultAOE():
	pass
func CatapultDam():
	pass
func CatapultSpeed():
	pass
func CatapultRange():
	pass
func FireUp():
	pass
	
	
func WallHP():
	pass
func WallRepair():
	pass
