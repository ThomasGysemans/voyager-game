extends Node2D

const TEXT_KNOW_MORE = "Appuie sur A pour en savoir plus"
const TEXT_HIDE = "Appuie sur A pour cacher"

onready var PositionLabel: Label = $CanvasLayer/PositionLabel
onready var PlanetLabel: Label = $CanvasLayer/PlanetLabel
onready var KnowMoreLabel: Label = $CanvasLayer/KnowMoreLabel
onready var DescriptionPanel: Panel = $CanvasLayer/DescriptionPanel
onready var DescriptionLabel: Label = $CanvasLayer/DescriptionPanel/DescriptionLabel
onready var Player = $Player
var is_near_planet := false

func _process(_delta):
	PositionLabel.text = "Position : %s %s" % [
		round(Player.global_position.x),
		round(Player.global_position.y)
	]
	if is_near_planet and Input.is_action_just_pressed("learn"):
		DescriptionPanel.visible = not DescriptionPanel.visible
		KnowMoreLabel.text = TEXT_HIDE if DescriptionPanel.visible else TEXT_KNOW_MORE

func _on_location_entered(area):
	is_near_planet = true
	var planet_code: int = area.get_parent().planet_name
	var planet_name: String = Globals.LOCATIONS_NAME[planet_code]
	var planet_description: String = Globals.LOCATIONS_DESCRIPTION[planet_code]
	PlanetLabel.text = "Planète : " + planet_name
	DescriptionLabel.text = planet_description
	KnowMoreLabel.visible = true
	KnowMoreLabel.text = TEXT_KNOW_MORE

func _on_location_exited(area):
	PlanetLabel.text = ""
	is_near_planet = false
	DescriptionPanel.visible = false
	KnowMoreLabel.visible = false
