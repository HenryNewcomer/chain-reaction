extends Node2D

export var init_grid_size = Vector2(4, 4)
var current_grid_size = Vector2.ZERO
var current_grid_state = []

func reset():
	generate_grid(init_grid_size)

func _ready():
	Signals.connect("prion_clicked", self, "capture_current_grid_state")
	reset()

func generate_grid(size_2d):
	current_grid_size = size_2d
	var columns = size_2d.x
	var rows = size_2d.y
	print("SETTING: %s by %s" % [columns, rows])
	var i = 0
	var width = $Prion.rect_size.x
	var height = $Prion.rect_size.y
	
	for c in columns:
		for r in rows:
			i += 1
			var new_inst = $Prion.duplicate()
			add_child(new_inst)
			new_inst.rect_position = Vector2(c*width, r*height)
			print("%s) %s, %s" % [i, c, r])
			current_grid_state.push_back(1)

func capture_current_grid_state():
	print("[ CAPTURING STATE! ]")
	print(current_grid_state)
	pass
