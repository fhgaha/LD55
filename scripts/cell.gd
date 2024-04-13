class_name Cell
extends CSGBox3D

static func get_closest_cell(from: Vector3) -> Cell:
	var closest : Cell 
	for b in Global.inst.beds:
		for c in b.get_cells():
			if (closest == null):
				closest = c
				continue
			
			var d1 = from.distance_squared_to(c.global_position)
			var d2 = from.distance_squared_to(closest.global_position)
			if (d1 < d2):
				closest = c
	return closest

@onready var potato: Potato = $Potato

var crop : Crop
var need = {
	"crop" : true,
	"water": true,
}

func _process(delta):
	if (crop):
		crop.water_amnt -= 0.005
		need["crop"] = !crop
		need["water"] = crop.water_amnt <= 0
	pass


func plant_crop():
	need["crop"] = false
	potato.crop.plant()
	pass
