class_name Cell
extends CSGBox3D


func _ready():
	pass # Replace with function body.


func _process(delta):
	pass


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
