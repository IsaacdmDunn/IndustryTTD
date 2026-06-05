extends Node

const savePath = "user://save.tres"
const saveSettingsPath = "user://saveSettings.tres"
var settings: SettingsData 



func WriteSaveSettings():
	ResourceSaver.save(settings,saveSettingsPath)
	
func LoadSaveSettings():
	if ResourceLoader.exists(saveSettingsPath):
		settings = ResourceLoader.load(saveSettingsPath).duplicate(true)
	else:
		settings = SettingsData.new()
	pass

#func WriteSave():
	#ResourceSaver.save(self, savePath)
	
#func SaveExists():
	#return ResourceLoader.exists(savePath)
	
func LoadSave():
	
	pass
