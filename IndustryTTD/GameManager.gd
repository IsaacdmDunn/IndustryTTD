extends Node
class_name GameManager
enum GameResourceTypes {Wood, Stone, Food, Pop, Ore, Charcoal, Metal}
@export var GameResourceList: Array[int] = [500, 300, 300, 20, 0,0,0,0,0]
@export var GameResourceLimit: Array[int] = [500, 500, 500, 100, 100,100,100,100,100]
@export var GameResourceName: Array[String] = ["Wood", "Stone", "Food", "People", "Ore", "Charcoal", "Metal"]


@export var BuildingList: Array[BuildingOption]
@export var ProductionMethods: Array[ProductionMethod]
@export var ResearchList: Array[Research]
@export var MapSize: Vector2i = Vector2i(64,32)

enum GameState {Game, Pause, Build, Loading, GameOver}
var currentGameState = GameState.Game

func UnlockResearch(list: Array[int]):
	for i in list:
		ResearchList[i].isUnlocked = true
	pass


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
