extends Button

const FACE_LEFT = -1
const FACE_RIGHT = 1
var is_on = 1 # on (1) = /    off (0) = \
var width
var facing

func _ready():
	width = rect_size.x
	facing = FACE_RIGHT
	add_to_group("prions")
	connect("pressed", self, "_on_pressed")

func _on_pressed():
	Signals.emit_signal("prion_clicked")
	print("prion_clicked *pressed*")
	flip_direction()
	"""
	emit_signal("touched", self)
	get_tree().set_input_as_handled()
	"""

func flip_direction():
	is_on = !is_on
	var plus_or_minus = (-1 if is_on else 1)
	rect_scale.x *= -1
	rect_position.x += (width * plus_or_minus)
