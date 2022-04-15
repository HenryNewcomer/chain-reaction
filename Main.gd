extends Node2D

export var grid_size = Vector2(4, 4)
var current_grid = []

func _ready():
	Signals.connect("prion_clicked", self, "capture_current_grid_state")
	reset_grid()
	draw_grid()

# FIXME current_grid is twice as long as it should be

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
	
	for r in rows:
		for c in columns:
			var new_inst = $Prion.duplicate()
			new_inst.array_id = i
			add_child(new_inst)
			new_inst.rect_position = Vector2(c*width, r*height)
			i += 1

func capture_current_grid_state(id): # TODO fix id. how does prion element know its own array ID?
	print("[ CAPTURING STATE! ]")
	current_grid[id] = int(!current_grid[id])
	print(current_grid)
