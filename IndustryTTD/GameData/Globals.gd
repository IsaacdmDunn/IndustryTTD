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

var researchSpeedMod: float = 1
var wallHealthMod: float = 1
var wallRepairMod: float = 1
var woodAmountMod: float = 1
var woodSpeedMod: float = 1
var stoneAmountMod: float = 1
var stoneSpeedMod: float = 1
var niterAmountMod: float = 1
var niterSpeedMod: float = 1
var foodAmountMod: float = 1
var foodSpeedMod: float = 1

var houseCapMod: float = 1
var coalAmountMod: float = 1
var coalSpeedMod: float = 1
var ironAmountMod: float = 1
var ironSpeedMod: float = 1
var toolAmountMod: float = 1
var toolSpeedMod: float = 1

var archerSpeedMod: float = 1
var archerDamMod: float = 1
var archerRangeMod: float = 1

var ballistaSpeedMod: float = 1
var ballistaDamMod: float = 1
var ballistaRangeMod: float = 1
var ballistaPierceMod: float = 1

var catapultSpeedMod: float = 1
var catapultDamMod: float = 1
var catapultRangeMod: float = 1
var catapultAOEMod: float = 1

func ResearchCounter():
	SaveSystem.saveData.researchCount += 1
	#timeScale = 50
#plays sound pitched to 12 scale music 
func PitchAudioAsNote(semiTone: float, audio: AudioStreamPlayer):
	if audio != null:
	
		audio.pitch_scale = pow(2, semiTone / 12.0)
		audio.play()
		
		
##research
func WoodAmount():
	woodAmountMod += woodAmountMod/10
	ResearchCounter()
	pass
func woodSpeed():
	woodSpeedMod += woodSpeedMod/10
	ResearchCounter()
	pass
func stoneAmount():
	stoneAmountMod += stoneAmountMod/10
	ResearchCounter()
	pass
func stoneSpeed():
	stoneSpeedMod += stoneSpeedMod/10
	ResearchCounter()
	pass
func niterAmount():
	niterAmountMod += niterAmountMod/10
	ResearchCounter()
	pass
func niterSpeed():
	niterSpeedMod += niterSpeedMod/10
	ResearchCounter()
	pass
func farmAmount():
	foodAmountMod += foodAmountMod/10
	ResearchCounter()
	pass
func farmSpeed():
	foodSpeedMod += foodSpeedMod/10
	ResearchCounter()
	pass
	
func CoalAmount():
	coalAmountMod += coalAmountMod/10
	ResearchCounter()
	pass
func CoalSpeed():
	coalSpeedMod += coalSpeedMod/10
	ResearchCounter()
	pass
func HouseCap():
	houseCapMod += houseCapMod/10
	ResearchCounter()
	pass
func IronSpeed():
	ironSpeedMod += ironSpeedMod/10
	ResearchCounter()
	pass
func IronAmount():
	ironAmountMod += ironAmountMod/10
	ResearchCounter()
	pass
func ToolSpeed():
	toolSpeedMod += toolSpeedMod/10
	ResearchCounter()
	pass
func ToolAmount():
	toolAmountMod += toolAmountMod/10
	ResearchCounter()
	pass
func ScienceSpeed():
	researchSpeedMod += (researchSpeedMod / 10)
	pass
func Stockpile():
	var gm:GameManager = get_tree().get_first_node_in_group("GameManager")
	for i in gm.GameResourceLimit:
		i += i/10
	ResearchCounter()
	pass
	
func ArcherDam():
	archerDamMod += archerDamMod/10
	ResearchCounter()
	pass
func ArcherSpeed():
	archerSpeedMod += archerSpeedMod/10
	ResearchCounter()
	pass
func ArcherRange():
	archerRangeMod += archerRangeMod/10
	ResearchCounter()
	pass
	
func BallistaDam():
	ballistaDamMod += ballistaDamMod/10
	ResearchCounter()
	pass
func BallistaSpeed():
	ballistaSpeedMod += ballistaSpeedMod/10
	ResearchCounter()
	pass
func BallistaRange():
	ballistaRangeMod += ballistaRangeMod/10
	ResearchCounter()
	pass
func BallistaPeirce():
	ballistaPierceMod += 1
	ResearchCounter()
	pass
	
func CatpapultAOE():
	catapultAOEMod += catapultAOEMod/10
	ResearchCounter()
	pass
func CatapultDam():
	catapultDamMod += catapultDamMod/10
	ResearchCounter()
	pass
func CatapultSpeed():
	catapultSpeedMod += catapultSpeedMod/10
	ResearchCounter()
	pass
func CatapultRange():
	catapultRangeMod += catapultRangeMod/10
	ResearchCounter()
	pass
func FireUp():
	burnDamage += (burnDamage / 10) + 1
	ResearchCounter()
	pass
	
	
func WallHP():
	wallHealthMod += wallHealthMod/10
	ResearchCounter()
	pass
func WallRepair():
	wallRepairMod += wallRepairMod/10
	ResearchCounter()
	pass
