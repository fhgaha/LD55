class_name Cell
extends CSGBox3D

static func get_closest_cell(from: Vector3) -> Cell:
	var closest : Cell 
	for b in Global.inst.beds.get_children():
		for c in b.get_cells():
			if (closest == null):
				closest = c
				continue
			
			var d1 = from.distance_squared_to(c.global_position)
			var d2 = from.distance_squared_to(closest.global_position)
			if (d1 < d2):
				closest = c
	return closest

@onready var crop: Potato = $Potato
@onready var texts_above: Node3D = $TextsAbove
var need = {
	"crop" : true,
	"water": true,
}
var timer : float = 0
var is_occupied : bool = false

func _ready() -> void:
	texts_above.hide()
	pass


func _process(delta):
	timer += delta
	if (timer > 3):
		timer = 0
		tick()
	pass


func tick():
	need["water"] = crop.is_planted() and crop.water_amnt <= 0
	if (need["water"]):
		texts_above.show()
	else:
		texts_above.hide()


func plant_crop():
	crop.plant()
	need["crop"] = false
	pass


func water_crop(amnt : float):
	if (crop.is_planted()):
		crop.water_amnt += amnt
