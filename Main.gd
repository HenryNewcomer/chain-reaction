extends Node2D

export var grid_size = Vector2(4, 4)
var current_grid = []

func _ready():
	Signals.connect("prion_clicked", self, "capture_current_grid_state")
	reset_grid()
	current_grid[2] = 0
	draw_grid()

func reset_grid():
	var converted_grid_size = grid_size.x * grid_size.y
	for i in range(converted_grid_size):
		# Set all values to 1.
		current_grid.append(1)

func draw_grid():
	var columns = grid_size.x
	var rows = grid_size.y
	var width = $Prion.rect_size.x
	var height = $Prion.rect_size.y
	var i = 0
	
	for c in columns:
		for r in rows:
			i += 1
			var new_inst = $Prion.duplicate()
			add_child(new_inst)
			new_inst.rect_position = Vector2(c*width, r*height)
			print("%s) %s, %s" % [i, c, r])
			current_grid.push_back(1)
	print(current_grid)

func capture_current_grid_state():
	print("[ CAPTURING STATE! ]")
	print(current_grid)
	pass
