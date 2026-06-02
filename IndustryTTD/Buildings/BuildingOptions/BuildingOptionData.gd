extends Resource
class_name BuildingOption
enum BuildingType {Turret, Basic, Industry, Other}
@export var building: PackedScene
@export var costID: Array[int]
@export var costAmount: Array[int]
@export var buildingName: String
@export var buildingType = BuildingType.Basic
@export var buildingImg: Texture2D
@export var description: String
@export var buildingSize: Vector2i = Vector2i(2,2)
