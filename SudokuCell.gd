extends Button

var parent
var pos
var groups

func _init(parent, pos, groups):
	self.parent = parent
	self.pos = pos
	self.groups = groups

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		parent.cell_click(pos, self)

func get_possibles():
	# If the value is already set, don't recalculate
	if self.text != parent.clear_value:
		return [self.text]

	var possibles = parent.symbols.duplicate()
	# Remove all values already in current groups
	for group in groups:
		for cell in group:
			if possibles.has(cell.text):
				possibles.erase(cell.text)
	
	return possibles