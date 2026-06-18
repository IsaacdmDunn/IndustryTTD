extends Resource
class_name ProductionMethod

enum bonusStats {Damage, AoE, Peirce, Range, Freeze, Burn, RepairAmount, MaxHpMod, Scattershot}
@export var itemInputID: Array[int]
@export var itemInput: Array[int]
@export var itemOutputID: Array[int]
@export var itemOutput: Array[int]
@export var baseProductionRate: float
@export var isUnlocked: bool = true
@export var img: Texture2D
@export var pmName: String
@export var bonusEffectID: Array[bonusStats]
@export var bonusEffectAmount: Array[int]
