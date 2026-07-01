extends Node

func setGM():
	pass

var gm: GameManager
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
	gm.ProductionMethods[73].outputMod -= .1
	gm.ProductionMethods[74].outputMod -= .1
	gm.ProductionMethods[75].outputMod -= .1
	woodAmountMod += woodAmountMod/10
	ResearchCounter()
	pass
func woodSpeed():
	gm.ProductionMethods[73].speedMod -= .1
	gm.ProductionMethods[74].speedMod -= .1
	gm.ProductionMethods[75].speedMod -= .1
	gm.ProductionMethods[76].speedMod -= .1
	gm.ProductionMethods[77].speedMod -= .1
	gm.ProductionMethods[78].speedMod -= .1
	woodSpeedMod += woodSpeedMod/10
	ResearchCounter()
	pass
func stoneAmount():
	gm.ProductionMethods[56].outputMod += .1
	gm.ProductionMethods[57].outputMod += .1
	gm.ProductionMethods[58].outputMod += .1
	stoneAmountMod += stoneAmountMod/10
	ResearchCounter()
	pass
func stoneSpeed():
	gm.ProductionMethods[56].speedMod -= .1
	gm.ProductionMethods[57].speedMod -= .1
	gm.ProductionMethods[58].speedMod -= .1
	gm.ProductionMethods[59].speedMod -= .1
	gm.ProductionMethods[60].speedMod -= .1
	gm.ProductionMethods[61].speedMod -= .1
	stoneSpeedMod += stoneSpeedMod/10
	ResearchCounter()
	pass
func niterAmount():
	gm.ProductionMethods[45].outputMod += .1
	gm.ProductionMethods[46].outputMod += .1
	niterAmountMod += niterAmountMod/10
	ResearchCounter()
	pass
func niterSpeed():
	gm.ProductionMethods[45].speedMod -= .1
	gm.ProductionMethods[46].speedMod -= .1
	gm.ProductionMethods[47].speedMod -= .1
	gm.ProductionMethods[48].speedMod -= .1
	gm.ProductionMethods[49].speedMod -= .1
	niterSpeedMod += niterSpeedMod/10
	ResearchCounter()
	pass
func farmAmount():
	gm.ProductionMethods[79].outputMod += .1
	gm.ProductionMethods[80].outputMod += .1
	gm.ProductionMethods[81].outputMod += .1
	foodAmountMod += foodAmountMod/10
	ResearchCounter()
	pass
func farmSpeed():
	gm.ProductionMethods[79].speedMod -= .1
	gm.ProductionMethods[80].speedMod -= .1
	gm.ProductionMethods[81].speedMod -= .1
	foodSpeedMod += foodSpeedMod/10
	ResearchCounter()
	pass
	
func CoalAmount():
	gm.ProductionMethods[33].outputMod += .1
	gm.ProductionMethods[34].outputMod += .1
	gm.ProductionMethods[35].outputMod += .1
	#var gm: GameManager = get_tree().get_first_node_in_group("GameManager")
	coalAmountMod += coalAmountMod/10
	ResearchCounter()
	pass
func CoalSpeed():
	gm.ProductionMethods[33].speedMod -= .1
	gm.ProductionMethods[34].speedMod -= .1
	gm.ProductionMethods[35].speedMod -= .1
	gm.ProductionMethods[36].speedMod -= .1
	gm.ProductionMethods[37].speedMod -= .1
	gm.ProductionMethods[38].speedMod -= .1
	coalSpeedMod += coalSpeedMod/10
	ResearchCounter()
	pass
func HouseCap():
	houseCapMod += houseCapMod/10
	ResearchCounter()
	pass
func IronSpeed():
	gm.ProductionMethods[50].speedMod -= .1
	gm.ProductionMethods[51].speedMod -= .1
	gm.ProductionMethods[52].speedMod -= .1
	gm.ProductionMethods[53].speedMod -= .1
	gm.ProductionMethods[54].speedMod -= .1
	gm.ProductionMethods[55].speedMod -= .1
	ironSpeedMod += ironSpeedMod/10
	ResearchCounter()
	pass
func IronAmount():
	gm.ProductionMethods[50].outputMod += .1
	gm.ProductionMethods[51].outputMod += .1
	gm.ProductionMethods[52].outputMod += .1
	ironAmountMod += ironAmountMod/10
	ResearchCounter()
	pass
func ToolSpeed():
	toolSpeedMod += toolSpeedMod/10
	ResearchCounter()
	pass
func ToolAmount():
	gm.ProductionMethods[19].outputMod += .1
	gm.ProductionMethods[20].outputMod += .1
	gm.ProductionMethods[21].outputMod += .1
	toolAmountMod += toolAmountMod/10
	ResearchCounter()
	pass
func ScienceSpeed():
	researchSpeedMod += (researchSpeedMod / 10)
	pass
func Stockpile():
	#var gm:GameManager = get_tree().get_first_node_in_group("GameManager")
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
