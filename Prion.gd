extends Button

const FACE_LEFT = -1
const FACE_RIGHT = 1
var width
var facing

func _input_event(viewport, event, shape_idx):
	print("PRESSED!")

func _ready():
	width = rect_size.x
	facing = FACE_RIGHT
	
	add_to_group("prions")
	connect("pressed", self, "_on_pressed")

func _on_pressed():
	Signals.emit_signal("prion_clicked")
	print("???")
	flip_direction()
	"""
	emit_signal("touched", self)
	get_tree().set_input_as_handled()
	"""

# Ugly, but whatever...
func flip_direction():
	facing = (FACE_RIGHT if facing == FACE_LEFT else FACE_LEFT)
	rect_scale.x *= -1
	rect_position.x += (width * -facing)
