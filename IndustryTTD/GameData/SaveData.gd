extends Node

const savePath = "user://save.tres"
const saveSettingsPath = "user://saveSettings.tres"
var settings: SettingsData = SettingsData.new()
var saveData: SaveData = SaveData.new()



func WriteSave():
	ResourceSaver.save(saveData,savePath)
	
func LoadSave():
	if ResourceLoader.exists(savePath):
		saveData = ResourceLoader.load(savePath).duplicate(true)
	else:
		saveData = SaveData.new()
	pass

func WriteSaveSettings():
	ResourceSaver.save(settings,saveSettingsPath)
	
func LoadSaveSettings():
	if ResourceLoader.exists(saveSettingsPath):
		settings = ResourceLoader.load(saveSettingsPath).duplicate(true)
	else:
		settings = SettingsData.new()
	pass
